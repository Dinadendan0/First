import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Cache_helper.dart';
import 'package:untitled/News_App/Network/Cubit_NewsApp.dart';
import 'package:untitled/Dio_helper.dart';
import 'package:untitled/Shop_App/LoginScreen.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/OnBoarding.dart';
import 'package:untitled/Shop_App/Shop_layout.dart';
import 'package:untitled/Shop_App/Themes.dart';
import 'package:untitled/SocialApp/LayoutScreen.dart';
import 'package:untitled/SocialApp/Network/Cubit.dart';
import 'package:untitled/SocialApp/Network/states.dart';
import 'package:untitled/SocialApp/LoginScreen/SocialLoginScreen.dart';
import 'package:untitled/SocialApp/Register/register.dart';
import 'package:untitled/TODO_App/App_cubit.dart';
import 'package:untitled/TODO_App/App_states.dart';
import 'package:untitled/const.dart';
import 'Counter_app/bloc_observer.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') ;

  Widget widget;
  //bool onBoarding = CacheHelper.getData(key: 'onBoarding') ;
  //token = CacheHelper.getData(key: 'token');
   uId = CacheHelper.getData(key: 'uId');

  if(uId != null )
    {
      widget = SocialLayout();
    } else
      {
        widget = loginScreen();
      }
  //if(onBoarding != null )
    //{
      //if(token != null ) widget = ShopLayout();
     // else widget = LoginScreen();
    //} else
      //{
   // widget = OnBoarding();
     // }

  runApp(MyApp(
      isDark : isDark,
    startWidget: widget,
  ));
}
class MyApp extends StatelessWidget {

  final bool isDark ;

  final Widget startWidget ;

  MyApp({
    this.isDark,
    this.startWidget}) ;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (BuildContext context )=> AppCubit()
            ..changeAppMode(
          //fromShared: isDark,
        ),
        ),
        BlocProvider(
          create: (BuildContext context )=> ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData(),
            ),
        BlocProvider(
          create: (BuildContext context ) => ShopLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context ) => SearchCubit(),
        ),
        BlocProvider(
          create: (BuildContext context )=> SocialCubit()..getUserData(),
        ),


      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state) {},
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            //darkTheme: darkTheme,
            //themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
