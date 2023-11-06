import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';

@RoutePage()
class TransformSignaturePage extends StatefulWidget {
  const TransformSignaturePage({super.key});

  @override
  State<TransformSignaturePage> createState() => _TransformSignaturePageState();
}

class _TransformSignaturePageState extends State<TransformSignaturePage> {
  late Rect rect = Rect.fromCenter(
    center: MediaQuery.of(context).size.center(Offset.zero),
    width: 250,
    height: 300,
  );
  String _path = "";
  bool isChanged = false;

  Future<void> _addPictureToGallery() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    setState(() {
      if (imageFile != null) {
        _path = imageFile.path;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlatformAppBar(
        title: Text(
          'Transform Signature Box',
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          TransformableBox(
            rect: rect,
            clampingRect: Offset.zero & MediaQuery.of(context).size,
            onChanged: (result) {
              setState(() {
                rect = result.rect;
              });
            },
            contentBuilder: (context, rect, flip) {
              if (isChanged) {
                return InkWell(
                  onTap: () async {
                    await _addPictureToGallery();
                  },
                  child:
                      _path.isNotEmpty ? Image.file(File(_path)) : const Center(child: Text('+ Upload From Storage')),
                );
              }
              return InkWell(
                onTap: () async {
                  var _isChanged = await AutoRouter.of(context).push(const SignatureRoute()) as bool?;
                  setState(() {
                    isChanged = _isChanged ?? false;
                  });
                },
                child: const Center(child: Text('+ Signature')),
              );
            },
          ),
        ],
      ),
    );
  }
}
