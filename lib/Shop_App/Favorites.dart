import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shop_App/Models/FavoritesModel.dart';
import 'package:untitled/Shop_App/Models/FavoritesModel.dart';
import 'package:untitled/Shop_App/Models/FavoritesModel.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/component.dart';
import 'package:untitled/const.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener:  (context,state){},
      builder: (context,state)
      {
        return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder:(context) =>  ListView.separated(
            itemBuilder: (context,index) => buildListProduct(ShopCubit.get(context).favoritesModel.data.data[index].product,context),
            separatorBuilder:(context,index) => myDriver(),
            itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }


}
