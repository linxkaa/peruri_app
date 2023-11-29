import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';
import 'package:peruri_app/presentation/widgets/molecules/platform_app_bar.dart';
import 'package:peruri_app/presentation/widgets/organisms/ui_helper.dart';

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

  double topLeftDY = 0;
  double topLeftDX = 0;

  double topRightDY = 0;
  double topRightDX = 0;

  double bottomLeftDY = 0;
  double bottomLeftDX = 0;

  double bottomRightDY = 0;
  double bottomRightDX = 0;

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
          Column(
            children: [
              Text('Top Left DY: $topLeftDY'),
              Text('Top Left DX: $topLeftDX'),
              UIHelper.verticalSpace(10),
              Text('Top Right DY: $topRightDY'),
              Text('Top Right DX: $topRightDX'),
              UIHelper.verticalSpace(10),
              Text('Bottom Left DY: $bottomLeftDY'),
              Text('Bottom Left DX: $bottomLeftDX'),
              UIHelper.verticalSpace(10),
              Text('Bottom Right DY: $bottomRightDY'),
              Text('Bottom Right DX: $bottomRightDX'),
            ],
          ),
          TransformableBox(
            rect: rect,
            clampingRect: Offset.zero & MediaQuery.of(context).size,
            onChanged: (result) {
              setState(() {
                rect = result.rect;
                topLeftDY = result.rect.topLeft.dy;
                topLeftDX = result.rect.topLeft.dx;

                topRightDY = result.rect.topRight.dy;
                topRightDX = result.rect.topRight.dx;

                bottomLeftDY = result.rect.bottomLeft.dy;
                bottomLeftDX = result.rect.bottomLeft.dx;

                bottomRightDY = result.rect.bottomRight.dy;
                bottomRightDX = result.rect.bottomRight.dx;
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
