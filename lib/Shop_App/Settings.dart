import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/component.dart';
import 'package:untitled/const.dart';

class SettingsScreen extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state)
      {},
      builder: (context,state)
      {
        var model = ShopCubit.get(context).userModel ;
        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return  ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null ,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if(state is ShopLoadingUpDateUserState)
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'phone must not be empty';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: ()
                    {
                      if(formKey.currentState.validate())
                        {
                          ShopCubit.get(context).updateUserData(
                            name :nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }

                    },
                    text: 'UpDate',
                    background: defaultColor,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      function: ()
                    {
                      signOut(context) ;
                      },
                      text: 'Sign Out',
                    background: defaultColor,
                  ),
                ],
              ),
            ),
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}
