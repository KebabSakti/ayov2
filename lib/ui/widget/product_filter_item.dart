import 'package:flutter/material.dart';

class ProductFilterItem extends StatelessWidget {
  final bool selected;
  final Function onSelected;
  final Widget child;

  ProductFilterItem({
    @required this.selected,
    @required this.onSelected,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.green.withOpacity(0.5),
      elevation: 0,
      pressElevation: 0,
      selected: selected,
      onSelected: onSelected,
      label: child,
    );
  }
}
