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
        title: const Text("COMPORTAMIENTO_ALUMNO"),
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
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                            child: Text(
                          "HORA",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        )),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.vertical(top: Radius.circular(40)),
                            color: theme.primaryColor)),
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
