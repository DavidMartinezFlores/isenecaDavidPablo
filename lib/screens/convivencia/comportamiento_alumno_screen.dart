import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> hourList = ["Primera Hora","Segunda Hora","Tercera Hora","Recreo","Cuarta Hora","Quinta Hora","Sexta Hora",];



List<String> professorList = ["Rafa","Paco","Manuel","Rocio","Juan","Raquel","Vicente",];

List<String> alumnList = ["David","Pablo","Juan","Manuel","Javier","Alejandro","Carlos",];

List<String> attitudePoints = ["-1 Gritar en el pasillo","- 25 Pelearse ","-25 Coger el Movil en clase","-75 Agredir a un Profesor","+25 Buen comportamiento","+1 Tareas realizadas","+1 Buena actitud",];

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
        title: const Center(child: Text("👨‍🎓 COMPORTAMIENTO ALUMNO 👨‍🎓",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
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
                duration: const Duration(milliseconds: 500),
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
                        style: const TextStyle(
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
                    ),
                  ],
                ),
              ),

              // --- SEPARADOR ENTRE HORA Y PROFESOR ---
              createVerticalSeparator(20),

              // --- CONTENEDOR DE PROFESOR ---
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: initAnimation ? screenSize.width * 0.95:200,
                curve: Curves.linear,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: 
                // --- COLUMNA DE PROFESOR PARA HACER EL EFECTO DE CABECERA DE CONTAINER CON FONDO DE COLOR Y TEXTO ----
                Column(
                  children: [
                    // --- CONTENEDOR PARA LA CABEZERA DE PROFESOR ---
                    Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor),
                        child: Center(
                            child: Text(
                          " 👩‍🏫 PROFESOR 👩‍🏫 ",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ))),

                    // --- ESPACIO DE 5 PX ---
                    createVerticalSeparator(5),

                    // --- COLUMNA INTERNA DE PROFESOR ---
                    Column(mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      // --- CONTENEDOR PARA LIMITAR EL ANCHO DEL DROP DOWN AL 89%
                      SizedBox(
                        width: screenSize.width*0.89,
                        child: DropdownButtonFormField(
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          hint: const Text("Selecciona un Profesor    👈 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          items: professorList.map((valueOfMap) => 
                          DropdownMenuItem(value: valueOfMap,child: Text(valueOfMap),)).toList(),
                          onChanged: (value) {
                            print("$value");
                        },),
                      ),

                      // --- ESPACIO DE 10 PX ---
                      createVerticalSeparator(10),
                    ]),
                  ],
                ),
              ),


              // --- SEPARADOR ENTRE PROFESOR Y ALUMNO ---
              createVerticalSeparator(20),

              // --- CONTENEDOR DE ALUMNO ---
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: initAnimation ? screenSize.width * 0.95:200,
                curve: Curves.linear,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: 
                // --- COLUMNA DE ALUMNO PARA HACER EL EFECTO DE CABECERA DE CONTAINER CON FONDO DE COLOR Y TEXTO ----
                Column(
                  children: [
                    // --- CONTENEDOR PARA LA CABEZERA DE ALUMNO ---
                    Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor),
                        child: Center(
                            child: Text(
                          " 👨‍🎓 ALUMNO 👨‍🎓 ",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ))),

                    // --- ESPACIO DE 5 PX ---
                    createVerticalSeparator(5),

                    // --- COLUMNA INTERNA DE ALUMNO ---
                    Column(mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      // --- CONTENEDOR PARA LIMITAR EL ANCHO DEL DROP DOWN AL 89%
                      SizedBox(
                        width: screenSize.width*0.89,
                        child: DropdownButtonFormField(
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          hint: const Text("Selecciona un Alumno   👈 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          items: alumnList.map((valueOfMap) => 
                          DropdownMenuItem(value: valueOfMap,child: Text(valueOfMap),)).toList(),
                          onChanged: (value) {
                            print("$value");
                        },),
                      ),

                      // --- ESPACIO DE 10 PX ---
                      createVerticalSeparator(10),
                    ]),
                  ],
                ),
              ),

              // --- SEPARADOR ENTRE ALUMNO Y PUNTOS ACTITUD ---
              createVerticalSeparator(20),

              // --- CONTENEDOR DE PUNTOS ACTITUD ---
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: initAnimation ? screenSize.width * 0.95:200,
                curve: Curves.linear,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: 
                // --- COLUMNA DE PUNTOS / ACTITUD PARA HACER EL EFECTO DE CABECERA DE CONTAINER CON FONDO DE COLOR Y TEXTO ----
                Column(
                  children: [
                    // --- CONTENEDOR PARA LA CABEZERA DE PUNTOS ACTITUD ---
                    Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor),
                        child: Center(
                            child: Text(
                          " ❌ PUNTOS / ACTITUD ✔️ ",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ))),

                    // --- ESPACIO DE 5 PX ---
                    createVerticalSeparator(5),

                    // --- COLUMNA INTERIOR ---
                    Column(mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      // --- CONTENEDOR PARA LIMITAR EL ANCHO DEL DROP DOWN AL 89%
                      SizedBox(
                        width: screenSize.width*0.89,
                        child: DropdownButtonFormField(
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          hint: const Text("Selecciona Puntos   👈 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          items: attitudePoints.map((valueOfMap) => 
                          DropdownMenuItem(value: valueOfMap,child: Text(valueOfMap),)).toList(),
                          onChanged: (value) {
                            print("$value");
                        },),
                      ),

                      // --- ESPACIO DE 10 PX ---
                      createVerticalSeparator(10),
                    ]),
                  ],
                ),
              ),

              // --- SEPARADOR ENTRE PUNTOS ACTITUD Y DERIVACION AL AULA DE CONVIVENCIA---
              createVerticalSeparator(20),

              // --- CONTENEDOR DE PUNTOS ACTITUD ---
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: initAnimation ? screenSize.width * 0.95:200,
                curve: Curves.linear,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: theme.secondaryHeaderColor),
                child: 
                // --- COLUMNA DE DERIVACION AL AULA DE CONVIVENCIA PARA HACER EL EFECTO DE CABECERA DE CONTAINER CON FONDO DE COLOR Y TEXTO ----
                Column(
                  children: [
                    // --- CONTENEDOR PARA LA CABEZERA DE DERIVACION AL AULA DE CONVIVENCIA ---
                    Container(
                        width: double.infinity,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(40)),
                            color: theme.primaryColor),
                        child: Center(
                            child: Text(
                          " ❌ DERIVACION AL AULA DE CONVIVENCIA ✔️ ",
                          style: TextStyle(
                              color: theme.secondaryHeaderColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ))),

                    // --- ESPACIO DE 5 PX ---
                    createVerticalSeparator(5),

                    // --- COLUMNA INTERIOR ---
                    Column(mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      // --- CONTENEDOR PARA LIMITAR EL ANCHO DEL DROP DOWN AL 89%
                      SizedBox(
                        width: screenSize.width*0.89,
                        child: DropdownButtonFormField(
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                          borderRadius: const BorderRadius.all(Radius.circular(40)),
                          hint: const Text("Selecciona Puntos   👈 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                          items: attitudePoints.map((valueOfMap) => 
                          DropdownMenuItem(value: valueOfMap,child: Text(valueOfMap),)).toList(),
                          onChanged: (value) {
                            print("$value");
                        },),
                      ),

                      // --- ESPACIO DE 10 PX ---
                      createVerticalSeparator(10),
                    ]),
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
