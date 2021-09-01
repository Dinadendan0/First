import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Dio_helper.dart';
import 'package:untitled/Shop_App/Categories.dart';
import 'package:untitled/Shop_App/Models/ChangeFavoriteModel.dart';
import 'package:untitled/Shop_App/Favorites.dart';
import 'package:untitled/Shop_App/Models/CategoriesModel.dart';
import 'package:untitled/Shop_App/Models/FavoritesModel.dart';
import 'package:untitled/Shop_App/Models/HomeModel.dart';
import 'package:untitled/Shop_App/Models/Login_Model.dart';
import 'package:untitled/Shop_App/Models/SearchModels.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/Shop_App/Network/ends_points.dart';
import 'package:untitled/Shop_App/Products.dart';
import 'package:untitled/Shop_App/Settings.dart';
import 'package:untitled/const.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel ;

  void userLogin({
  @required String email ,
  @required String password,
})
  {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data:{
        'email' : email,
        'password' : password,
      },
    ).then((value) 
    {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel.status);
      print(loginModel.message);

      emit(ShopLoginSuccessState(loginModel));
    }
    ).catchError((error)
        {
          print(error.toString());
          emit(ShopLoginErrorsState(error.toString()));
        });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility ()
  {
    isPassword =! isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }

}


class ShopCubit extends Cubit <ShopStates>
{
  ShopCubit() : super(ShopInitialState()) ;

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<Widget> bottomScreens=
  [
    ProductsScreen(),
    Categories(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  void changeBottom(int index)
  {
    currentIndex =index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;
   Map <int , bool> favorites = {} ;
  void getHomeData()
  {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

     // printFullText(homeModel.data.banners[0].image);

      print(homeModel.status);

      homeModel.data.products.forEach((element)
      {
        favorites.addAll({
          element.id : element.inFavorites ,
        });
      });
      //print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error)
    {
      print(error.toString());

      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;
  void getCategoriesData()
  {

    DioHelper.getData(
      url: GET_CATEGORIES,
      token : token,
    ).then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error)
    {
      print(error.toString());

      emit(ShopErrorCategoriesState());
    });
  }


  ChangeFavoritesModel changeFavoritesModel;
  void changeFavorite(int productId)
  {
    favorites[productId] = !favorites[productId];

    emit(ShopChangeFavoritesState());

    DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id' :productId,
        },
        token: token,
    ).then((value)
    {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if(!changeFavoritesModel.status)
        {
          favorites[productId] = !favorites[productId];
        } else
          {
            getFavoritesData();
          }
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error)
    {
      favorites[productId] = !favorites[productId];

      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel favoritesModel;
  void getFavoritesData()
  {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token : token,
    ).then((value)
    {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel userModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token : token,
    ).then((value)
    {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
})
  {

    emit(ShopLoadingUpDateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token : token,
      data:
      {
        'name' : name,
        'email' : email,
        'phone' : phone,
      }
    ).then((value)
    {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(ShopSuccessUpDateUserState(userModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUpDateUserState());
    });
  }
}

class SearchCubit extends Cubit <SearchStates>
{
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  
  SearchModel model ;
  void search(String text)
  {
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: token,
        data: {
          'text' : text ,
        },
    ).then((value) 
        {
          model = SearchModel.fromJson(value.data);
          emit(SearchSuccessState());
        }
    ).catchError((error){

      print(error.toString());
      emit(SearchErrorsState());
    });
  }
  
}


