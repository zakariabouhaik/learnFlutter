import 'package:flutter/material.dart';

class CategoryModel{

  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({

    required this.name,
    required this.iconPath,
    required this.boxColor

  });


  static List<CategoryModel> getCategories(){

    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(name: 'Salad',
      iconPath: 'assets/icons/salad-svgrepo-com.svg',
      boxColor: Colors.green)
    );

    categories.add(
      CategoryModel(name: 'Cake',
      iconPath: 'assets/icons/cake-tall-svgrepo-com.svg',
      boxColor: Colors.brown)
    );


    categories.add(
      CategoryModel(name: 'Pie',
      iconPath: 'assets/icons/apple-pie-svgrepo-com.svg',
      boxColor: Colors.yellow)
    );

    categories.add(
      CategoryModel(name: 'Smoothies',
      iconPath: 'assets/icons/smoothie-svgrepo-com.svg',
      boxColor: Colors.purple)
    );




    return categories;
  }

}