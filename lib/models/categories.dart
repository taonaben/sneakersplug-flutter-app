import 'package:flutter/material.dart';
import 'package:sneakersplug/models/category_identity.dart';

class Categories extends ChangeNotifier {
  //list of brands
  List<ShoeBrand> brandList = [
    ShoeBrand("lib/images/nike_icon.png", "Nike"),
    ShoeBrand("lib/images/nike_icon.png", "Adidas"),
    ShoeBrand("lib/images/nike_icon.png", "Puma"),
    ShoeBrand("lib/images/nike_icon.png", "Yeezy"),
    ShoeBrand("lib/images/nike_icon.png", "Balenciaga"),
    ShoeBrand("lib/images/nike_icon.png", "Louis vuitton"),
  ];

  List<ShoeBrand> getBrandList() {
    return brandList;
  }

  //list of sneaker types
  List<SneakerType> sneakerTypeList = [
    SneakerType("lib/images/nike_icon.png", "Running"),
    SneakerType("lib/images/nike_icon.png", "Tennis"),
    SneakerType("lib/images/nike_icon.png", "Basketball"),
    SneakerType("lib/images/nike_icon.png", "Fashion"),
  ];

  List<SneakerType> getSneakerTypeList() {
    return sneakerTypeList;
  }

  //list of Colorways
  List<Colorway> colorwayList = [
    Colorway("lib/images/nike_icon.png", "Red"),
    Colorway("lib/images/nike_icon.png", "Black"),
    Colorway("lib/images/nike_icon.png", "Blue"),
    Colorway("lib/images/nike_icon.png", "White"),
    Colorway("lib/images/nike_icon.png", "Yellow"),
    Colorway("lib/images/nike_icon.png", "Grey"),
  ];

  List<Colorway> getColorwayList() {
    return colorwayList;
  }

  //list of Collaborations
  List<Collaboration> collaborationList = [
    Collaboration("lib/images/nike_icon.png", "Cactus Jack"),
    Collaboration("lib/images/nike_icon.png", "We The Best"),
    Collaboration("lib/images/nike_icon.png", "Lebron james"),
    Collaboration("lib/images/nike_icon.png", "Hatiperi"),
    Collaboration("lib/images/nike_icon.png", "Fenti"),
  ];

  List<Collaboration> getCollaborationList() {
    return collaborationList;
  }
}
