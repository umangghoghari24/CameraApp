import 'package:cameraapp/Camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';

import 'Cameraview.dart';


late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  print(_cameras);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WhatsApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xff128C7E)
            )
        ),

        home: Camera()
    );
  }
}

//camera app

class Cameraapp extends StatefulWidget {
  const Cameraapp({Key? key}) : super(key: key);

  @override
  State<Cameraapp> createState() => _CameraappState();
}

class _CameraappState extends State<Cameraapp> {
  late CameraController controller;

  var camera_index = 0;
  var showreal= true;
  var showflash= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = CameraController(_cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  var currnetcamerastatus = 1;
  var isshow= false;

  void initstate(){
    super.initState();

    setState(() {
      currnetcamerastatus = 1;
    });
  }
  var currnetcamera = 2;

  void initstate2(){
    super.initState();
    setState(() {
      currnetcamerastatus = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Scaffold();
    }
    return MaterialApp(
      home:
      Stack(
        children: [
          CameraPreview(controller),
          Positioned(
            height: MediaQuery.of(context).size.height/5.5,
              // top: 50,
              // left: 10,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              },
                  icon: Icon(Icons.close,
                  size: 32,
                  color: Colors.white,)),

            ),
          Positioned(
            // height: MediaQuery.of(context).size.height/5.5,
            // width: MediaQuery.of(context).size.width/0.54,
            //
            // child: IconButton(onPressed: () {},
            //     icon: Icon(Icons.flash_on)),
              top: 48,
              right: 10,
              child: Container(
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                  onPressed: () {
                    if (showflash==true){
                      setState(() {
                        showflash=!showflash;
                        controller.setFlashMode(FlashMode.off);
                      });
                    }else{
                      setState(() {
                        showflash=!showflash;
                        controller.setFlashMode(FlashMode.torch);
                      });
                    }
                  },
                  child: Icon(
                    showflash?Icons.flash_on:Icons.flash_off,
                    color: Colors.white,
                  ),
                ),
              )
          ),
          // Positioned(
          //     top: 44, left: 153,
          //     child: Text('00:00', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal),)),
          Positioned(
              bottom: 58,
              right: 15,
              child: IconButton(onPressed: () {
                        if (showreal==true){
                          setState(() {
                            camera_index=0;
                            showreal=!showreal;
                          });
                        }else{
                          setState(() {
                            camera_index=1;
                            showreal=!showreal;
                          });
                        }
                        controller=CameraController(_cameras[camera_index], ResolutionPreset.max);
                        controller.initialize().then((_) {
                          if (!mounted) {
                            return;
                          }
                          setState(() {
                          });
                        }).catchError((Object e) {
                          if (e is CameraException) {}
                        });
                      },
                  icon: Icon(
                    Icons.cameraswitch_sharp,
                            color: Colors.white,
                    size: 32,
                  ))),
          Positioned(
              bottom: 50,left: 145,
              child: IconButton(onPressed: () async{

                // photo path

                          final path =  await join( (await getTemporaryDirectory()).path,'${DateTime.now()}.png');
                          XFile picture = await controller.takePicture();
                          picture.saveTo(path);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>cameraview(path: path,)));
              },
                  icon: Icon(Icons.camera,
                    color: Colors.white,
                    size: 45,
                  ))),
          
          Positioned(
              bottom: 68,
              left: 15,
              child: Icon(
                Icons.image,
                color: Colors.white,
                size: 32,
              )),


          // Positioned(
          //     bottom: 250,
          //     left: 175,
          //     child: Icon(
          //       Icons.minimize,
          //       color: Colors.black,
          //     )),

          // Positioned(bottom: 150,
          //   child: Container(
          //     height: 100, width: 1000,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 20,
          //       itemBuilder: (context,index){
          //         return Padding(
          //           padding: const EdgeInsets.all(2.0),
          //           child: Container(height: 0, width: 50,
          //             color: Colors.white,),
          //         );
          //       },
          //     ),
          //   ),),

          Positioned(
            bottom: 0,
            child: Container(

              child: Column(
                children: [
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      SizedBox(
                        width: 110,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: currnetcamerastatus==1?Colors.grey.shade800:Colors.transparent,shape: StadiumBorder()),
                        // child: Text('Video'),
                        onPressed: () {
                          setState(() {
                            currnetcamerastatus=1;
                          });
                        },
                        child: Text('photo'),
                      ),
                      SizedBox(width: 3,),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: currnetcamerastatus==2?Colors.grey.shade800:Colors.transparent,shape: StadiumBorder()),
                        //   child: Text('Photo'),
                        onPressed: () {
                          setState(() {
                            currnetcamerastatus = 2;
                          });
                        },
                        child: Text('video'),
                      )
                    ],
                  ),
                ],
              ),
              height: 55,width: 1000,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}






