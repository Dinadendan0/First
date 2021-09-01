import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/News_App/Business_screen.dart';
import 'package:untitled/Dio_helper.dart';
import 'package:untitled/News_App/Science%20_screen.dart';
import 'package:untitled/News_App/Sports_screen.dart';
import 'package:untitled/News_App/Network/Status_NewsApp.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState()) ;

  static NewsCubit get(context) => BlocProvider.of(context) ;

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),

  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic>business = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
      },
    ).then((value) {
      business = value.data['articles'] ;
      print(business[0]['title']) ;
      emit(NewsGetBusinessSuccessState()) ;

    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
   if(sports.length ==0)
     {
       DioHelper.getData(
         url:'v2/top-headlines',
         query: {
           'country':'eg',
           'category':'sports',
           'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
         },
       ).then((value) {
         //print(value.data['articles'][0]['title']) ;
         sports = value.data['articles'] ;
         print(sports [0]['title']) ;
         emit(NewsGetSportsSuccessState()) ;

       }).catchError((error)
       {
         print(error.toString());
         emit(NewsGetSportsErrorState(error.toString()));
       });
     } else
       {
         emit(NewsGetSportsSuccessState());
       }
  }
  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length ==0)
      {
        DioHelper.getData(
          url:'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
          },
        ).then((value) {
          //print(value.data['articles'][0]['title']) ;
          science = value.data['articles'] ;
          print(science[0]['title']) ;
          emit(NewsGetScienceSuccessState()) ;

        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      } else
        {
          emit(NewsGetScienceSuccessState());
        }
  }

  List<dynamic> search = [];
  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());

      DioHelper.getData(
        url:'v2/everything',
        query:
        {
          'q':'$value',
          'apiKey':'7aaa13e8a75d44cfb13dcc81ebd077d4',
        },
      ).then((value) {
        search = value.data['articles'] ;
        print(search[0]['title']) ;
        emit(NewsGetSearchSuccessState()) ;
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    }

  void changeBottomNavBar (int index)
  {
    currentIndex = index ;
    if (index ==0)
      getBusiness();
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();

    emit(NewsBottomNavState());
  }

  }



