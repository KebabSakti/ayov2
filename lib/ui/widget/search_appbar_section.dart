import 'package:ayov2/getx/controller/controller.dart';
import 'package:flutter/material.dart';

class SearchAppbarSection extends StatelessWidget {
  final SearchPageController controller;

  SearchAppbarSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      iconTheme: IconThemeData(color: Colors.grey[800]),
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 38,
            width: double.infinity,
            color: Colors.grey[100],
            child: TextField(
              controller: controller.searchField,
              autofocus: true,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              cursorColor: Colors.grey[600],
              cursorWidth: 1,
              decoration: InputDecoration(
                hintText: 'Cari di sini',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 4),
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.grey[400],
                  size: 20,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  constraints: BoxConstraints(),
                  iconSize: 20,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.grey[400],
                  ),
                ),
                prefixIconConstraints: BoxConstraints(minWidth: 40),
              ),
              onSubmitted: (value) {},
            ),
          ),
        ),
      ),
    );
  }
}
