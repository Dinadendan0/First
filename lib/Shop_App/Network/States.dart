import 'package:untitled/Shop_App/Models/ChangeFavoriteModel.dart';
import 'package:untitled/Shop_App/Models/Login_Model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates
{
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorsState extends ShopLoginStates
{
  final String error;
  ShopLoginErrorsState(this.error);
}

class ShopChangePasswordVisibilityState extends ShopLoginStates {}

/////////////////////////////////////////////


abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates
{
  final ChangeFavoritesModel model ;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates {}

/////////////////////////////////////////////////////////////
abstract class ShopRegisterStates{}

class ShopRegisterInitialState extends ShopRegisterStates {}

class ShopRegisterLoadingState extends ShopRegisterStates {}

class ShopRegisterSuccessState extends ShopRegisterStates
{
  final ShopLoginModel loginModel;
  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorsState extends ShopRegisterStates
{
  final String error;
  ShopRegisterErrorsState(this.error);
}

class ShopChangePasswordVisibilityRegisterState extends ShopRegisterStates {}


///////////////////////////////////////////
class ShopLoadingUpDateUserState extends ShopStates {}

class ShopSuccessUpDateUserState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUpDateUserState(this.loginModel);
}

class ShopErrorUpDateUserState extends ShopStates {}


/////////////////////////////////////////////////////

abstract class SearchStates{}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates{}

class SearchErrorsState extends SearchStates{}



