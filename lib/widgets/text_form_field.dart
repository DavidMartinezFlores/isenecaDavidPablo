import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  //String que indica si el texto tiene formato como por ejemplo una fecha dd/mm/yyy 
  final String format;
  //String que indica el caracter a separar como por ejemplo /
  final String split;
  //Los campos format y split no son obligatorios
  TextFormWidget({super.key,this.format="",this.split=""});
  var controller = TextEditingController();
  var focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event){
        if(format.isNotEmpty && split.isNotEmpty)
        {
          //Controller para controlar el texto que escribimos
          String text = controller.value.text;
          //Lista que guarda el texto introducido si tiene formato
          List<String> textFormat = text.split(split);
          //Lista que guarda las especificaciones del formato
          List<String> formatRule = format.split(split);
          if(textFormat.length!=formatRule.length)
          {
            //Si el tamaño de las listas no coincide borra el texto
            controller.clear();
          }
          else 
          {
            for(int i = 0;i<formatRule.length;i++)
            {
              String textToCheck = textFormat[i];
              String checker = formatRule[i];
              if(textToCheck.startsWith(" "))
              {
                textToCheck = textToCheck.substring(0);
              }
              if(checker.startsWith(" "))
              {
                checker = checker.substring(0);
              }
              if(checker.length!=format.length)
              {
                //Si el tamaño de algunos de los items no coincide borra el texto
                controller.clear();
                break;
              }
            }
          }
        }
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: controller,
    );
  }
}