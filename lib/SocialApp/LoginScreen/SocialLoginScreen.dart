import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Cache_helper.dart';
import 'package:untitled/SocialApp/LayoutScreen.dart';
import 'package:untitled/SocialApp/Network/Cubit.dart';
import 'package:untitled/SocialApp/Network/states.dart';
import 'package:untitled/SocialApp/Register/register.dart';
import 'package:untitled/component.dart';

class loginScreen extends StatelessWidget
{

  var formKey =GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginStates>(
        listener: (context,state)
        {
          if(state is SocialLoginErrorsState)
            {
              showToast(
                text:state.error,
                state: ToastStates.ERROR,
              );
            }
          if(state is SocialLoginSuccessState)
            {
              CacheHelper.saveData(
                key: 'uId',
                value: state.uId,
              ).then((value)
              {
                navigateAndFinish(context, SocialLayout());
              });
            }
        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style:Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Login now to communicate with friends',
                          style:Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please enter your email';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: SocialLoginCubit.get(context).suffix,
                          onSubmit: (value)
                          {
                            if (formKey.currentState.validate())
                            {
                              SocialLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: SocialLoginCubit.get(context).isPassword,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please enter your email';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffixPressed:()
                          {
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => defaultButton(
                            background: Colors.deepOrange,
                            function: (){
                              if (formKey.currentState.validate())
                              {
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'Login',
                            isUpperCase: true,
                          ),
                          fallback: (context)=> Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height:15 ,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            defaultTextButton(
                              function: ()
                              {
                                navigateTo(context,RegisterScreen(),);
                              },
                              text: 'REGISTER',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
