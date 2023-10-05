import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List imageList = [null, null, null, null];
  @override
  Widget build(BuildContext context) {
    final _imagePicker = ImagePicker();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('포토네컷'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
              children: imageList
                  .asMap()
                  .entries
                  .map(
                    (e) => Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: InkWell(
                          onDoubleTap: () =>
                              setState(() => imageList[e.key] = null),
                          onTap: () async {
                            var xfile = await _imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (xfile != null) {
                              imageList[e.key] = xfile;
                              setState(() {});
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  image: imageList[e.key] != null
                                      ? DecorationImage(
                                          image: AssetImage(
                                              imageList[e.key]!.path),
                                          fit: BoxFit.cover)
                                      : null,
                                  color: Colors.white12)),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
