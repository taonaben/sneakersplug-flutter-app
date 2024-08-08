import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakersplug/models/categories.dart';
import 'package:sneakersplug/models/category_identity.dart';
import 'package:sneakersplug/widgets/category%20cards/brands_card.dart';
import 'package:sneakersplug/widgets/category%20cards/collaborations_card.dart';
import 'package:sneakersplug/widgets/category%20cards/colorways_card.dart';
import 'package:sneakersplug/widgets/category%20cards/sneaker_type_card.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Categories>(
      builder: (context, categories, child) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              //Brands
              const Text(
                "Brands",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              //Brand items
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  categories.brandList.length,
                  (index) {
                    ShoeBrand category = categories.getBrandList()[index];
                    return BrandsCard(
                      shoeBrand: category,
                      onTap: () {
                        // Handle the tap event here
                      },
                    );
                  },
                ),
              ),

              //Sneaker type
              const Text("Sneaker Type", style: TextStyle(fontSize: 18),),

              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  categories.sneakerTypeList.length,
                  (index) {
                    SneakerType sneakerType =
                        categories.getSneakerTypeList()[index];
                    return SneakerTypeCard(
                      sneakerType: sneakerType,
                      onTap: () {
                        // Handle the tap event here
                      },
                    );
                  },
                ),
              ),

              // Colorways
              const Text(
                "Colorways",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  categories.colorwayList.length,
                  (index) {
                    Colorway colorway = categories.getColorwayList()[index];
                    return ColorwaysCard(
                      colorway: colorway,
                      onTap: () {
                        // Handle the tap event here
                      },
                    );
                  },
                ),
              ),

              // Collaborations
              const Text(
                "Collaborations",
                style: TextStyle(fontSize: 18,),
              ),

              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: List.generate(
                  categories.collaborationList.length,
                  (index) {
                    Collaboration collaboration =
                        categories.getCollaborationList()[index];
                    return CollaborationsCard(
                      collaboration: collaboration,
                      onTap: () {
                        // Handle the tap event here
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
