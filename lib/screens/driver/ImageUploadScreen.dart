import 'package:flutter/material.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  List<ImageProvider?> images = [
    AssetImage('assets/dni.png'),
    AssetImage('assets/licencia_conducir.png'),
    AssetImage('assets/mototaxi.png'),
  ];

  Widget imageCard(int index) {
    // Método auxiliar para obtener la imagen o el placeholder
    ImageProvider getImageOrPlaceholder(ImageProvider? image) {
      return image ?? AssetImage('assets/placeholder.png');
    }

    // Método auxiliar para manejar el onTap
    void handleImageTap(int idx) {
      setState(() {
        images[idx] = images[idx] == null ? AssetImage('assets/placeholder.png') : null;
      });
    }

    return GestureDetector(
      onTap: () => handleImageTap(index),
      child: Column(
        children: [
          Container(
            width: 320,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: DecorationImage(
                image: getImageOrPlaceholder(images[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => handleImageTap(index),
            child: Text(images[index] == null ? 'Añadir' : 'Quitar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Fotos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(3, (index) => imageCard(index))
                    .map((widget) => Padding(padding: EdgeInsets.only(bottom: 20), child: widget))
                    .toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar la lógica para enviar información al backend
                print("Enviar imágenes al servidor");
              },
              child: Text('Enviar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
