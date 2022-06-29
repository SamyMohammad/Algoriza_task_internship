import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.width,
    this.height,
    this.imgPath,
    required this.onTap,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  VoidCallback onTap;

  Color? buttonColor;

  double? borderRadius;

  Color? textColor;

  String buttonText;

  Color? borderColor;

  String? imgPath;
  double? width;
  double? height;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          border: Border.all(color: borderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               imgPath != null ?  Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Image.asset(imgPath!,height: height,width: width,),
               ):const Text(''),
                  Text(
                    buttonText,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),

                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
