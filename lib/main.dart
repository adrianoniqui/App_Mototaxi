import 'package:flutter/material.dart';
import 'package:mototaxi/screens/common/role_selection_screen.dart';
import 'package:mototaxi/screens/driver/driver_registration_screen.dart'; // Importa la pantalla de registro de conductor
import 'package:mototaxi/screens/customer/customer_registration_screen.dart'; // Importa la pantalla de registro de cliente
import 'package:mototaxi/screens/driver/ImageUploadScreen.dart'; // Importa la pantalla de carga de imágenes
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoTaxi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define la ruta inicial si es necesario, por ejemplo:
      // initialRoute: '/',
      routes: {
        // Define las rutas nombradas aquí
        '/driverRegistration': (context) => DriverRegistrationScreen(),
        '/customerRegistration': (context) => CustomerRegistrationScreen(),
        '/uploadImages': (context) => ImageUploadScreen(), // Nueva ruta para carga de imágenes
      },
      home: RoleSelectionScreen(), // Tu widget como pantalla de inicio
    );
  }
}
