import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String? selectedItem;
  final ValueChanged<String?> onChanged;
  final List<String> items ;
  const CustomDropDown({super.key, required this.selectedItem, required this.onChanged, required this.items});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.grey, // Outer border color
          width: 1.0, // Outer border width
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            value: selectedItem,
            iconSize: 0,
            underline: Container( // Remove underline
              height: 0,
            ),
            hint: const Text('Select an item'),
            onChanged:onChanged,
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
