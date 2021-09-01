
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Dio_helper.dart';
import 'package:untitled/Shop_App/Models/Login_Model.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/Shop_App/Network/ends_points.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates>
{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel loginModel ;

  void userRegister({
    @required String email ,
    @required String password,
    @required String phone ,
    @required String name ,

  })
  {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data:{
        'email' : email,
        'name' : name,
        'phone' : phone,
        'password' : password,
      },
    ).then((value)
    {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);


      emit(ShopRegisterSuccessState(loginModel));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(ShopRegisterErrorsState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibilityRegister ()
  {
    isPassword =! isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityRegisterState());
  }

}