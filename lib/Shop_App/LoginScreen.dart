import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/Cache_helper.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Shop_layout.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/Shop_App/register.dart';
import 'package:untitled/component.dart';
import 'package:untitled/const.dart';
//import 'package:toast/toast.dart';


class LoginScreen extends StatelessWidget
{
  var formKey =GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context)
  {
    var emailController = TextEditingController();
    var passwordController =TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state) {
          if(state is ShopLoginSuccessState)
            {
              if(state.loginModel.status)
                {
                  print(state.loginModel.message);
                  print(state.loginModel.data.token);
                  Fluttertoast.showToast(
                      msg: state.loginModel.message,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  CacheHelper.saveData(
                    key: 'token',
                      value:state.loginModel.data.token,
                  ).then((value)
                  {
                    token =state.loginModel.data.token;
                    navigateAndFinish(context, ShopLayout());
                  });
                } else
                  {
                    print(state.loginModel.message);
                    showToast(
                      text: state.loginModel.message,
                      state: ToastStates.ERROR,
                    );
                  }
            }
        },
        builder: (context ,state) {
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
                      //crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Login now to browse our hot offers',
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
                          suffix: ShopLoginCubit.get(context).suffix,
                          onSubmit: (value)
                          {
                            if (formKey.currentState.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
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
                            ShopLoginCubit.get(context).changePasswordVisibility();
                            },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => defaultButton(
                            background: Colors.deepOrange,
                            function: (){
                              if (formKey.currentState.validate())
                                {
                                  ShopLoginCubit.get(context).userLogin(
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
