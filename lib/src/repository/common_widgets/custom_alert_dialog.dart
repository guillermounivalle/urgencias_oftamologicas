


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAlertDialog extends StatefulWidget {
  late final Color colorImage;
  late final String textMessage;
  late final String assetName;


  CustomAlertDialog({
    required this.colorImage,
    required this.textMessage,
    required this.assetName,


  });
  @override
  _CustomAlertDialog createState()=> _CustomAlertDialog();
}

class _CustomAlertDialog extends State<CustomAlertDialog>{
  void initState() {
    super.initState();
    _colorImage = widget.colorImage;
    _textmessage = widget.textMessage;
    _assetName = widget.assetName;

  }

  late Color _colorImage;
  late final String _textmessage;
  late final String _assetName;
  @override
  Widget build(BuildContext context) {
    return(
      Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, //en el eje y
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(width: 10.0),
            SvgPicture.asset(
              _assetName,
              color: _colorImage,
              width: 25.0,
              height: 25.0,
            ),
            SizedBox(width: 15.0),
            Text(
                _textmessage,
                style:
                TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                )
            ),
            Opacity(
              opacity: 0.0,
            ),//Este opacity permite acomodar centrado el texto sign in
          ],
        )
      )
    );
  }

}