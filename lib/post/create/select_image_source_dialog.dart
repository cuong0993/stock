import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageSourceDialog extends StatelessWidget {
  const SelectImageSourceDialog({
    required this.onImageSourceSelected,
    Key? key,
  }) : super(key: key);
  final ValueSetter<ImageSource> onImageSourceSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48 * 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              dense: true,
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                onImageSourceSelected(ImageSource.camera);
              },
            ),
            ListTile(
              dense: true,
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                onImageSourceSelected(ImageSource.gallery);
              },
            ),
            ListTile(
              dense: true,
              title: const Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
}
