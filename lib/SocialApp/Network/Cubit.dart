import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/SocialApp/Chat/ChatScreen.dart';
import 'package:untitled/SocialApp/Feeds/FeedScreen.dart';
import 'package:untitled/SocialApp/Network/states.dart';
import 'package:untitled/SocialApp/Notifications/NotificationScreen.dart';
import 'package:untitled/SocialApp/Settings/SettingScreen.dart';
import 'package:untitled/SocialApp/Users/UserScreen.dart';
import 'package:untitled/SocialApp/models/userModel.dart';
import 'package:untitled/const.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit() : super(SocialLoginInitialState());
  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String email ,
    @required String password,
  })
  {
    emit(SocialLoginLoadingState());
   FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password,
   ).then((value)
    {
      print(value.user.email);
      print(value.user.uid);
      emit(SocialLoginSuccessState(value.user.uid));
    }).catchError((error)
    {
      print(error.toString());
      emit(SocialLoginErrorsState(error.toString()));
    });
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility ()
  {
    isPassword =! isPassword ;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityState());
  }

}

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel model ;
  void getUserData()
  {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
          model = SocialUserModel.fromJson(value.data());

          emit(SocialGetUserSuccessState());
        })
        .catchError((error){
          emit(SocialGetUserErrorsState(error));
    })
    ;
  }

  int currentIndex = 0 ;
  List<Widget> screens = [
    FeedScreen(),
    ChatScreen(),
    UserScreen(),
    SettingsScreen(),

  ];

  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'Settings',

  ];

  void changeBottomNav(int index)
  {
    currentIndex = index ;
    emit(SocialChangeBottomNav());
  }



}

