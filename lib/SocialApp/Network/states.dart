abstract class SocialLoginStates{}

class SocialLoginInitialState extends SocialLoginStates {}

class SocialLoginLoadingState extends SocialLoginStates {}

class SocialLoginSuccessState extends SocialLoginStates
{
  final String uId;
  SocialLoginSuccessState(this.uId);
}

class SocialLoginErrorsState extends SocialLoginStates
{
  final String error;
  SocialLoginErrorsState(this.error);
}

class SocialChangePasswordVisibilityState extends SocialLoginStates {}

////////////////////////////////////////////

abstract class SocialRegisterStates{}

class SocialRegisterInitialState extends SocialRegisterStates {}

class SocialRegisterLoadingState extends SocialRegisterStates {}

class SocialRegisterSuccessState extends SocialRegisterStates
{}

class SocialRegisterErrorsState extends SocialRegisterStates
{
  final String error;
  SocialRegisterErrorsState(this.error);
}

class SocialCreateUserSuccessState extends SocialRegisterStates
{}
class SocialCreateUserErrorsState extends SocialRegisterStates
{
  final String error;
  SocialCreateUserErrorsState(this.error);
}

class SocialChangePasswordVisibilityRegisterState extends SocialRegisterStates {}

//////////////////////////////////////////////////////////////


abstract class SocialStates{}

class SocialInitialState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorsState extends SocialStates
{
  final String error ;
  SocialGetUserErrorsState(this.error);

}

class SocialChangeBottomNav extends SocialStates {}

class SocialNewPostState extends SocialStates {}





