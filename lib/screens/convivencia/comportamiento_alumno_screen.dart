import 'package:flutter/material.dart';
import 'package:iseneca/widgets/widgets.dart';

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
                width: screenSize.width * 0.9,
                height: screenSize.height * 0.15,
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
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor)),
                    createVerticalSeparator(0.035, context),
                    Container(
                      decoration: BoxDecoration(color: theme.primaryColor,borderRadius: BorderRadius.all(Radius.circular(40))),
                      width: screenSize.width*0.15,
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month),
                          label: const Text(
                            "Fecha",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          style: const ButtonStyle(
                            iconSize: MaterialStatePropertyAll(35),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
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
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor)),
                    const ExpansionTile(
                      title: Text(
                        "Horas",
                        style: TextStyle(fontSize: 24),
                      ),
                      children: [
                        //TODO: Colocar las horas mediante servicio
                        Text(
                          "Colocar horas en RadioListTile",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Colocar horas en RadioListTile",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Colocar horas en RadioListTile",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Colocar horas en RadioListTile",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Colocar horas en RadioListTile",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Colocar horas en RadioListTile",
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createVerticalSeparator(cuantity, context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * cuantity,
    );
  }
}
