import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConvivenciaScreen extends StatelessWidget {
  const ConvivenciaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CONVIVENCIA"),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "expulsados_screen"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.boxes),
                title: Text('Expulsados'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "mayores_screen"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.braille),
                title: Text('Mayores'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "comportamiento_alumno_screen"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.braille),
                title: Text('Comportamiento alumno'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "reflexion_screen"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.sadCry),
                title: Text('Aula Reflexión'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "carnet_screen"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.idCard),
                title: Text('Carnet e Incidencias'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "incidencia_telefono_screen"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.idCard),
                title: Text('Carnet e Incidencias'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "screen_expulsados"),
            child: const Card(
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.boxes),
                title: Text('Expulsados'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
