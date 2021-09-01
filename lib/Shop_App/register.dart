import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Cache_helper.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Network/RegisterCubit.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/Shop_App/Shop_layout.dart';
import 'package:untitled/component.dart';
import 'package:untitled/const.dart';
class RegisterScreen extends StatelessWidget
{
  var formKey =GlobalKey<FormState>() ;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController =TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener:  (context, state){
          if(state is ShopRegisterSuccessState)
          {
            if(state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);

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
        builder: (context, state) {
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
                          'Register',
                          style:Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Register now to browse our hot offers',
                          style:Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please enter your name';
                            }
                          },
                          label: 'Name',
                          prefix: Icons.person,
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
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please enter your Password';
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
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please enter your phone';
                            }
                          },
                          label: 'Phone ',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            background: Colors.deepOrange,
                            function: (){
                              if (formKey.currentState.validate())
                              {
                                ShopRegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: ' Register',
                            isUpperCase: true,
                          ),
                          fallback: (context)=> Center(child: CircularProgressIndicator()),
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

