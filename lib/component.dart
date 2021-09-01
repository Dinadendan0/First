import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/News_App/web_view.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/TODO_App/App_cubit.dart';
import 'package:untitled/const.dart';
Widget defaultButton(
{
  Color background =Colors.blue ,
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 5 ,
  @required Function function,
  @required String text ,

}) =>
    Container(
      width: width,
      height: 40,
      child: MaterialButton(
    onPressed: function,
    child: Text(
     isUpperCase ? text.toUpperCase() : text ,
      style: TextStyle(
      color: Colors.white,
    ),
    ),
  ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,

      ),
);
Widget defaultTextButton({
  @required Function function,
  @required String text,
}) => TextButton(
    onPressed: function,
    child: Text(
      text.toUpperCase(),
    ),

);
Widget defaultFormField ({
  cursorColor,
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit ,
  Function onChange ,
  Function onTap ,
  Function suffixPressed,
  bool isPassword = false ,
  bool isClickable = true,
  @required Function validate ,
  @required String label ,
  @required IconData prefix ,
  IconData suffix ,
}) =>
    TextFormField(
      controller: controller,
  keyboardType: type ,
  enabled: isClickable,
  onFieldSubmitted: onSubmit ,
  onChanged: onChange,
  onTap: onTap ,
  validator: validate,
  obscureText: isPassword ,
  decoration: InputDecoration(
    labelText: label,
  prefixIcon: Icon(prefix),
  suffixIcon: suffix != null
      ? IconButton(
    onPressed: suffixPressed,
    icon: Icon(
      suffix,
    ),
  )
      : null,
  border: OutlineInputBorder(),
  ),

);
Widget buildTaskItem(Map model,context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Text(
            '${model['time']}',
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${model['title']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Text('${model['date']}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,

                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed:()
            {
              AppCubit.get(context).updateData(
                  status: 'done',
                  id: model['id'],
              );
              },
            icon: Icon(
              Icons.playlist_add_check,
              size: 40,
              color: Colors.blue,
            ),
        ),
        IconButton(
          onPressed:()
          {
              AppCubit.get(context).updateData(
                status: 'archived',
                id: model['id'],
              );
          },
          icon: Icon(
            Icons.archive,
            color: Colors.black45,
            size: 30,
          ),
        ),

      ],
  ),
),
  onDismissed: (direction)
  {
    AppCubit.get(context).deleteData(id:model['id']);
  },
);
Widget tasksBuilder({
  @required List<Map> tasks,
})=>ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context)=> ListView.separated(
    itemBuilder:(context,index) => buildTaskItem(tasks[index] ,context),
    separatorBuilder: (context,index) => myDriver(),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet ,Please Add Some Tasks ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);

Widget myDriver() =>  Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);

Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Container(
          width: 140,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBuilder(list,context,{isSearch = false }) => ConditionalBuilder(
  condition: list.length >0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index) => buildArticleItem(list[index],context),
    separatorBuilder: (context,index) => myDriver(),
    itemCount: list.length ,
  ),
  fallback: (context) => isSearch ? Container(): Center(child: CircularProgressIndicator()),
);

void navigateTo(context ,widget) => Navigator.push(
  context,
  MaterialPageRoute(
  builder:(context )=> widget,
  ),
);

void navigateAndFinish(context ,widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder:(context )=> widget,
  ),
    (Route<dynamic> route) => false,
);
 void showToast ({
   @required String text,
   @required ToastStates state,
 })=> Fluttertoast.showToast(
     msg: text,
     toastLength: Toast.LENGTH_LONG,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 5,
     backgroundColor: chooseToastColor(state),
     textColor: Colors.white,
     fontSize: 16.0
 );

 enum ToastStates{SUCCESS,ERROR,WARNING}
 Color chooseToastColor(ToastStates state)
 {
   Color color;
   switch(state)
   {
     case ToastStates.SUCCESS:
       color =Colors.green;
       break;
     case ToastStates.ERROR:
       color =Colors.red;
       break;
     case ToastStates.WARNING:
       color =Colors.amber;
       break;
   }
   return color;
 }

Widget buildListProduct( model,context,{bool isOldPrice = true, }) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image),
              width: 120,
              height: 120,
            ),
            if(model.discount !=0 && isOldPrice )
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
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    'LE : ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    model.price.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if(model.discount !=0 && isOldPrice)
                    Text(
                      model.oldPrice.toString(),
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
  ),
);
