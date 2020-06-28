import 'package:flutter/material.dart';

class NeuCard extends StatelessWidget {
  final double width, height, borderRadius; 
  final margin, padding, tailWidget;

  NeuCard({
    this.height,
    this.width,
    this.borderRadius,
    this.margin,
    this.padding,
    this.tailWidget,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all( 0.0),
      padding: padding ?? EdgeInsets.all( 0.0),
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffe3f8ff),
        boxShadow: [
          BoxShadow(
            offset: Offset(4.00, 4.00),
            color: Color(0xffb4c6cc),
            //Color(0xff000000).withOpacity(0.16),
            blurRadius: 4,
          ),
          BoxShadow(
            offset: Offset(-4.00, -4.00),
            color: Colors.white,
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius ?? 15.00),
      ),
      child: tailWidget,
    );
  }
}
