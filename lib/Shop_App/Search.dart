import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shop_App/Models/FavoritesModel.dart';
import 'package:untitled/Shop_App/Network/Cubit.dart';
import 'package:untitled/Shop_App/Network/States.dart';
import 'package:untitled/component.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var formKey = GlobalKey();
    return BlocProvider(
      create: (BuildContext context){},
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener:(context,state){} ,
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: searchController,
                        type: TextInputType.text,
                        validate: (String value)
                        {
                          if(value.isEmpty)
                            {
                              return 'enter text to search';
                            }
                          return null ;
                        },
                        label: 'Search',
                        prefix: Icons.search,
                      onSubmit: (String text)
                        {
                          SearchCubit.get(context).search(text);
                        }
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                    if(state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                        itemBuilder: (context,index) => buildListProduct(SearchCubit.get(context).model.data.data[index],context,isOldPrice: false,),
                        separatorBuilder:(context,index) => myDriver(),
                        itemCount: SearchCubit.get(context).model.data.data.length,
                    ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
