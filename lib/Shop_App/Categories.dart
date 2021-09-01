import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shop_App/Models/CategoriesModel.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/component.dart';

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener:  (context,state){},
      builder: (context,state)
      {
        return ListView.separated(
          itemBuilder: (context,index) => buildCatItem(ShopCubit.get(context).categoriesModel.data.data[index]),
          separatorBuilder:(context,index) => myDriver(),
          itemCount: ShopCubit.get(context).categoriesModel.data.data.length,
        );
      },
    );
  }
  
  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Image(
          image: NetworkImage(
            model.image,
          ),
          height: 120,
          width: 120,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
            model.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}
