import 'package:cameraapp/main.dart';
import 'package:flutter/material.dart';
class Camera extends StatefulWidget {
   Camera({
     Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Camera')),
      ),
      body: Center(
        child: Column(
          children: [
            // Image.network('https://cdn.dribbble.com/users/2409752/screenshots/7070185/media/331c0fed4314abb0b7afd3a4b6b31ac1.jpg?resize=400x300&vertical=center',),
            // Divider(thickness: 1,),
            SizedBox(height: 50,),
            CircleAvatar(
              radius: 40,
              child: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cameraapp()));
              },
                  icon: Icon(Icons.camera)),
            ),
            SizedBox(height: 30,),
            Container(width: MediaQuery.of(context).size.width-50,
              color: Colors.white12,
                child: Center(
                    child: Text('Click Camera Button',style: TextStyle(
                      color: Colors.black
                    ),
                    ),
                ),)
          ],
        ),
      ),
    );
  }
}
