import 'package:flutter/material.dart';
import 'package:sneakersplug/models/category_identity.dart';

class BrandsCard extends StatelessWidget {
  final ShoeBrand shoeBrand;
  final void Function()? onTap;

  const BrandsCard({
    super.key,
    required this.shoeBrand,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicWidth(
        child: Flexible(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        shoeBrand.imageURL,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      shoeBrand.text,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
