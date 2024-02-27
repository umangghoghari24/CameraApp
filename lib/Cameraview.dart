import 'dart:io';
import 'package:cameraapp/Camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class cameraview extends StatefulWidget {
   cameraview({Key? key, required this.path,
   }) : super(key: key);
  final path;

  @override
  State<cameraview> createState() => _cameraviewState();
}

class _cameraviewState extends State<cameraview> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          SizedBox(
            width: 115,
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.crop_rotate,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.title,
              size: 25,
            ),
          ),
          IconButton(
              onPressed: () {
                print('object');
              },
              icon: Icon(
                Icons.edit,
                size: 25,
              )),
        ],
      ),

      body: Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              // image file path

              child: Image.file(
                File(widget.path),
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
                bottom: 0,
                child: Container(color: Colors.white,
                  width: MediaQuery.of(context).size.width ,

                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: ('  Add a caption'),
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,


                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            child: IconButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Camera(

                              )));

                            },
                                icon: Icon(Icons.send),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
