import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:peruri_app/core/commons/colors_const.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organism/ui_helper.dart';
import 'package:signature/signature.dart';

@RoutePage()
class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: ColorConstant.primary,
    exportBackgroundColor: Colors.white,
    exportPenColor: Colors.black,
  );

  @override
  void dispose() {
    // IMPORTANT to dispose of the controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text('Signature page'),
      ),
      body: ListView(
        children: <Widget>[
          //SIGNATURE CANVAS
          Container(
            margin: UIHelper.padding(all: 20),
            decoration: BoxDecoration(border: Border.all(color: ColorConstant.darkGrey)),
            child: Signature(
              key: const Key('signature'),
              controller: _controller,
              height: 300,
              backgroundColor: Colors.white,
            ),
          ),
          //OK AND CLEAR BUTTONS
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //SHOW EXPORTED IMAGE IN NEW ROUTE
              IconButton(
                icon: const Icon(Icons.undo),
                color: Colors.blue,
                onPressed: () {
                  setState(() => _controller.undo());
                },
                tooltip: 'Undo',
              ),
              IconButton(
                icon: const Icon(Icons.redo),
                color: Colors.blue,
                onPressed: () {
                  setState(() => _controller.redo());
                },
                tooltip: 'Redo',
              ),
              //CLEAR CANVAS
              IconButton(
                key: const Key('clear'),
                icon: const Icon(Icons.clear),
                color: Colors.blue,
                onPressed: () {
                  setState(() => _controller.clear());
                },
                tooltip: 'Clear',
              ),
              IconButton(
                key: const Key('save'),
                icon: const Icon(Icons.save),
                color: Colors.blue,
                onPressed: () async {
                  var image = await _controller.toPngBytes();
                  if (image != null) {
                    await ImageGallerySaver.saveImage(image,
                        quality: 100, name: Random.secure().nextDouble().toString());
                    AutoRouter.of(context).pop(true);
                  }
                },
                tooltip: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
