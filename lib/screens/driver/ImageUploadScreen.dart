import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
    ImageProvider getImageOrPlaceholder(ImageProvider? image) {
      return image ?? AssetImage('assets/placeholder.png');
    }

    void handleImageTap(int idx) async {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Cámara'),
                  onTap: () async {
                    var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        images[idx] = FileImage(File(pickedFile.path));
                      });
                    }
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Galería'),
                  onTap: () async {
                    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        images[idx] = FileImage(File(pickedFile.path));
                      });
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
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
            child: Text(images[index] == null ? 'Quitar' : 'Añadir'),
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
