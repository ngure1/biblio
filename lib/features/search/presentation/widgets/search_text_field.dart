import 'package:biblio/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryInverseColor,
              width: 1.5,
            )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: 'Find a book that suits your taste',
        hintStyle: TextStyle(color: AppColors.secondaryColor, fontSize: 14),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
