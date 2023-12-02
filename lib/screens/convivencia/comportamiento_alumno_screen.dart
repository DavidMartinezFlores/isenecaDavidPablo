import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> hourList = ["Primera Hora","Segunda Hora","Tercera Hora","Recreo","Cuarta Hora","Quinta Hora","Sexta Hora",];

class ComportamientoAlumnoScreen extends StatefulWidget {
  const ComportamientoAlumnoScreen({super.key});

  @override
  State<ComportamientoAlumnoScreen> createState() =>
      _ComportamientoAlumnoScreenState();
}

class _ComportamientoAlumnoScreenState
    extends State<ComportamientoAlumnoScreen> {
  bool initAnimation = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds:1),() {
      setState(() {
              initAnimation=true;
      });
    },);
    
  }
      
  DateTime dateTime = DateTime.now();
  String currentHour = hourList[0];
  @override
  Widget build(BuildContext context) {

    final valueFormat = DateFormat("dd-MM-yyyy");
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Text("COMPORTAMIENTO_ALUMNO"),
      ),
      body: SingleChildScrollView(
        child: Center(

          // ---- COLUMN PRINCIPAL ----
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              // --- ESPACIO ENTRE CONTAINERS Y APP BAR ---
              SizedBox(
                height: screenSize.height * 0.05,
              ),

              // --- CONTAINER PRINCIPAL DE FECHA, LIMITADO AL 95% DEL ANCHO DE PANTALLA ---
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: initAnimation ? screenSize.width * 0.95:200,
                curve: Curves.linear,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: 
                // --- COLUMNA DE FECHA PARA HACER EL EFECTO DE CABECERA DE CONTAINER CON FONDO DE COLOR Y TEXTO ----
                Column(
                  children: [
                    // --- CONTENEDOR PARA LA CABEZERA DE FECHA ---
                    Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor),
                        child: Center(
                            child: Text(
                          " 📆 FECHA 📆 ",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ))),
                    // --- ESPACIO DE 15 PX ---
                    createVerticalSeparator(15),

                    // --- ROW CON FECHA SELECCIONADA Y BOTON PARA CAMBIAR FECHA ---
                    Column(mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Text(
                        "📆 Fecha Seleccionada: ${valueFormat.format(dateTime)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      createVerticalSeparator(10),
        
                      // --- BOTON CAMBIAR FECHA ---
                      FilledButton.icon(
                        onPressed: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoDatePicker(
                                    backgroundColor:
                                        theme.secondaryHeaderColor,
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime.now(),
                                    onDateTimeChanged: (value) {
                                      setState(() {
                                        dateTime = value;
                                      });
                                    },
                                  ));
                        },
                        icon: const Icon(Icons.calendar_month),
                        label: const Text(
                          "Cambiar Fecha",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      createVerticalSeparator(10),
                      
                    ]),
                  ],
                ),
              ),

              // --- SEPARADOR ENTRE FECHA Y HORA ---
              createVerticalSeparator(20),

              // --- CONTENEDOR PRINCIPAL DE HORA 95% DEL ANCHO ---
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: initAnimation ? screenSize.width * 0.95:200,
                curve: Curves.slowMiddle,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: 
                // --- COLUMNA PRINCIPAL DEL CONTENEDOR ---
                Column(
                  children: [
                    // --- CONTENEDOR PARA LA CABEZERA DE HORA ---
                    Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor),
                        child: Center(
                            child: Text(
                          " 🕘 HORA 🕘 ",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ))),

                    // --- SECCION EXPANDIBLE CON LAS HORAS ---
                    ExpansionTile(
                      title: Text(
                        "Seleccionar Hora : 🕘 $currentHour 🕘 ",
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                      ),
                      children: [
                        //TODO: Colocar las horas mediante servicio
                        RadioListTile(title: currentHour == hourList[0] ? Text("${hourList[0]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[0])
                        ,value: hourList[0], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },),
                        RadioListTile(title: currentHour == hourList[1] ? Text("${hourList[1]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[1])
                        ,value: hourList[1], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },),
                        RadioListTile(title: currentHour == hourList[2] ? Text("${hourList[2]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[2])
                        ,value: hourList[2], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },),
                        RadioListTile(title: currentHour == hourList[3] ? Text("${hourList[3]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[3])
                        ,value: hourList[3], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },),
                        RadioListTile(title: currentHour == hourList[4] ? Text("${hourList[4]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[4])
                        ,value: hourList[4], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },),
                        RadioListTile(title: currentHour == hourList[5] ? Text("${hourList[5]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[5])
                        ,value: hourList[5], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },),
                        RadioListTile(title: currentHour == hourList[6] ? Text("${hourList[6]}    👈 ",style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 83, 3),fontWeight: FontWeight.bold),):Text(hourList[6])
                        ,value: hourList[6], groupValue: currentHour, onChanged: (value) {
                          setState(() {
                             currentHour = value.toString();
                          });
                        },)
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

  createVerticalSeparator(cuantity) {
    return SizedBox(height: cuantity + 0.0);
  }
}
