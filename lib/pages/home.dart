import 'package:fitness/pages/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
    HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories=[];

  void _getCategories(){
    categories=CategoryModel.getCategories();
  }



  @override
  void initState(){
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
     return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            _searchbar(),

    SizedBox(height: 40),
            _category()
        ],),
     )  ;
  }

  Column _category() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                        'Category',
                         style: TextStyle(
                            fontSize: 18
                         ),),  
                  ),
                  SizedBox(height: 10,),
                   Container(
                    height: 120,

                  child: ListView.separated(
        
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20,right: 20),
                     separatorBuilder: (context, index) => SizedBox(width: 25,),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: categories[index].boxColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child:Padding(padding: const EdgeInsets.all(8.0), 
                              child: SvgPicture.asset(categories[index].iconPath),
                              )
                            ),
                            Text(
                              categories[index].name,
                            )
                            
                          ],
                        ),
                      );
                    },
                  ),
                  ),
                
              ],
          );
  }

  Container _searchbar() {
    return Container(
              margin: EdgeInsets.only(top:40,left:20,right: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.11),
                          blurRadius: 70,
                          spreadRadius: 0.0
                          
                      )
                  ]
              ),
            child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10),
                  prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                      'assets/icons/icons8-search.svg',
                      width: 20, // Définir une largeur spécifique
                      height: 20, // Définir une hauteur spécifique
                      
                      
                  ),
                  ),
                  hintText: 'Search Pancake',
                 
                  suffixIcon: Container(
                      width: 100,
                    child: IntrinsicHeight(
                      child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                              indent: 10,
                              endIndent:10 ,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset( 'assets/icons/filter-svgrepo-com.svg',
                            width: 20,
                            height: 20,),
                          ),
                        ],
                      ),
                    ),
                  ),

                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    )
                ),
            ),
          );
  }

  AppBar appBar() {
    return AppBar(
          title: Text('Breakfast',
          style: TextStyle(
              fontSize:  20,
              color: Colors.black
          ),),
      elevation: 3.8,
      shadowColor: Colors.black, // Add this
      centerTitle: true,
      backgroundColor: Colors.white,

      leading:
      GestureDetector(

          onTap: (){

          },


          child: 
  Container(
          margin:EdgeInsets.all(10) ,
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/arrow-left-svgrepo-com.svg',
          height: 40,
          width: 40,),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
      ) ,


      ),
      
      actions: [
          GestureDetector(
              onTap: (){},
         child:  Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 50,
              child: SvgPicture.asset('assets/icons/dots-horizontal-svgrepo-com.svg'),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
          ),
          )
      ],
      );
  }
}