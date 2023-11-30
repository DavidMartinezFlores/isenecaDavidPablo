import 'package:flutter/material.dart';

class ComportamientoAlumnoScreen extends StatelessWidget {
  const ComportamientoAlumnoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text("COMPORTAMIENTO_ALUMNO"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Container(
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: Column(
                  children: [
                    Container(
                      width: screenSize.width * 0.8,
                      child: Text("HORA"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: theme.primaryColor)
                    ),

                        
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
