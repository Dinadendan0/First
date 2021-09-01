
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shop_App/Models/CategoriesModel.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Models/HomeModel.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/component.dart';
import 'package:untitled/const.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state)
      {
        if(state is ShopSuccessChangeFavoritesState)
          {
            if(!state.model.status)
              {
                showToast(text: state.model.message, state:ToastStates.ERROR );
              }
          }
      },
      builder: (context,state){
          return ConditionalBuilder(
            condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).categoriesModel != null,
              builder: (context) => builderWidget(ShopCubit.get(context).homeModel, ShopCubit.get(context).categoriesModel,context),
            fallback: (context) => Center(child: CircularProgressIndicator(),),

          );
      },
    );
  }

  Widget builderWidget(HomeModel model, CategoriesModel categoriesModel,context ) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Container(
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          CarouselSlider(
              items: model.data.banners.map((e) => Image(
                image:NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ).toList(),
              options: CarouselOptions(
                height: 250,
                initialPage:0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3,),
                autoPlayAnimationDuration: Duration(seconds: 1,),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,

              ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index) =>  buildCategoriesItem(categoriesModel.data.data[index]),
                      separatorBuilder:(context,index) => SizedBox(
                        width: 10,
                      ) ,
                      itemCount: categoriesModel.data.data.length,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'New Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.72,
            children: List.generate(
                model.data.products.length,
                    (index) => buildGridProduct(model.data.products[index],context ),
            ),
          ),
        ],
      ),
    ),
  );


  Widget buildCategoriesItem(DataModel model) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
        image: NetworkImage(model.image),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
      Container(
        color:Colors.black.withOpacity(.7),
        width: 100,
        child: Text(
          model.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );


  Widget buildGridProduct(ProductsModel model, context) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: double.infinity,
              height: 200,
              //fit: BoxFit.cover,

            ),
            if(model.discount !=0 )
              Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'DISCOUNT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,

                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  model.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                height: 36,
              ),
              Row(
                children: [
                  Text('LE : ',
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.w500,
                 ),
                  ),
                  Text(
                   '${model.price.round()}',
                    style: TextStyle(
                      fontSize: 15,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(
                  width: 5,
                  ),
                  if(model.discount !=0 )
                    Text(
                    '${model.oldPrice.round()}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorite(model.id);
                        print(model.id);
                      },
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor : ShopCubit.get(context).favorites[model.id] ? defaultColor : Colors.white ,
                        child: Icon(
                          Icons.favorite_border,
                          size: 16,
                        ),
                      ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

