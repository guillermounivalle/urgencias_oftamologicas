import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/color.styles.dart';

class DropdownListCustom extends StatefulWidget {
  final List<String> listElements;
  final ValueChanged<String> onChanged;
  String labelInfo;
  bool showSecondText;

  DropdownListCustom({
    required this.listElements,
    required this.onChanged,
    required this.labelInfo,
    required this.showSecondText,

  });
  @override
  _DropdownListCustom createState() => new _DropdownListCustom();

}

class _DropdownListCustom extends State<DropdownListCustom>{
  @override
  void initState() {
    super.initState();
    _labelInfo = widget.labelInfo;
    _list = widget.listElements;
    onChanged = widget.onChanged;
    _showSecondText = widget.showSecondText;
  }

  void _manejadorOnChanged(String? value){
    widget.onChanged(value!);
  }
  late final ValueChanged<String> onChanged;
  late List<String> _list;
  late final String _labelInfo;
  late final bool _showSecondText;

  List<DropdownMenuItem<String>> _createList() {
    return _list.map<DropdownMenuItem<String>>(
          (e) =>            DropdownMenuItem(
        value: e,
        child: Text(e),
      ),
    ).toList();
  }




  String? _selectedItem2;
  Widget _onChangedWithValue() {
    final dropdown = DropdownButton(
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w100,
      ),
      dropdownColor: ColorStyles.appbarprimarycolor,
      iconEnabledColor: Colors.white,
      iconSize: 30.0,
      items: _createList(),
      value: _selectedItem2,
      onChanged: (String? value) => setState(() {
        _selectedItem2 = value ?? "";
        _manejadorOnChanged(value);
      }),
    );
    return _createDropdownContainer(
      dropdown,
      _labelInfo,
      _selectedItem2,
    );
  }

  Widget _addLabelTo(Widget child, String text) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsetsDirectional.only(start: 16.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Expanded(flex: 2, child: Center(child: child)),
      ],
    );
  }

  Widget _createDropdownContainer(
      Widget dropdown, String label, String? value) {
    return Container(
      height: 75,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            width: 0.5,
            color: Colors.white
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _addLabelTo(dropdown, label),
          if(_showSecondText)
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "$value",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                ),
              ),
              padding: EdgeInsetsDirectional.only(start: 16.0),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final onlyItems = DropdownButton(
      items: _createList(),
      onChanged: null,
    );
    final backColor = DropdownButton(
      items: _createList(),
      onChanged: (value) {},
      dropdownColor: Colors.cyan,
    );
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            //_addLabelTo(onlyItems, "Only Items"),
            //_onChangedWithoutValue(),
            _onChangedWithValue(),
            //_initialValue(),
            //_withHint(),
            //_disableHint(),
            //_disable(),
            //_addLabelTo(backColor, "Change back color"),
          ],
        ),
      ),
    );
  }
}