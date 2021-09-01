import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/SocialApp/Network/states.dart';
import 'package:untitled/SocialApp/models/userModel.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String email ,
    @required String password,
    @required String phone ,
    @required String name ,

  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      userCreate(
          email: email,
          phone: phone,
          name: name,
          uId: value.user.uid,
      );
    }).catchError((error)
    {
      emit(SocialRegisterErrorsState(error.toString()));
    });
  }

  void userCreate({
    @required String email ,
    @required String phone ,
    @required String name ,
    @required String uId ,
  })
  {
    SocialUserModel model = SocialUserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      bio : ' write your bio ...',
      image: 'https://i.pinimg.com/564x/bf/17/4b/bf174b9a4ea62d7f50b071683d6ce5d1.jpg',
      cover: 'https://i.pinimg.com/564x/c8/69/a1/c869a112acf9e4f394189936eeae1e8c.jpg',
      isEmailVerified: false ,
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(model.toMap()).then((value)
    {
          emit(SocialCreateUserSuccessState());
    }).catchError((error){
          emit(SocialCreateUserErrorsState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true ;

  void changePasswordVisibility ()
  {
    isPassword =! isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityRegisterState());
  }

}