import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona tu Rol'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/driverRegistration'),
              child: Text('Conductor'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Corregido aquí
                foregroundColor: Colors.white, // Corregido aquí
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/customerRegistration'),
              child: Text('Cliente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, //
                foregroundColor: Colors.white, //
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
