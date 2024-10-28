import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  final Map<String, String> option;
  final String hintText;
  final Function(String) onSelected;
  final String? initSelect;
  const BaseSelect({
    super.key,
    required this.option,
    required this.hintText,
    required this.onSelected,
    this.initSelect,
  });

  @override
  BaseSelectState createState() => BaseSelectState();
}

class BaseSelectState extends State<BaseSelect> {
  String? selectedValue;
  String? errorText;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initSelect;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: selectedValue,
          hint: Text(widget.hintText),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.onSelected(newValue!);
          },
          items: widget.option.entries.map<DropdownMenuItem<String>>((select) {
            return DropdownMenuItem<String>(
              value: select.value,
              child: Text(select.key),
            );
          }).toList(),
        ));
  }
}
