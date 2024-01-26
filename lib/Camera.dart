import 'package:cameraapp/main.dart';
import 'package:flutter/material.dart';
class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

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
            SizedBox(height: 100,),
            CircleAvatar(
              radius: 40,
              child: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cameraapp()));
              },
                  icon: Icon(Icons.camera)),
            ),
            SizedBox(height: 30,),
            Container(
              color: Colors.grey,
                child: Text('Click Camera Button'))
          ],
        ),
      ),
    );
  }
}
