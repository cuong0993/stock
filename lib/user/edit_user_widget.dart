import 'dart:io';

import 'package:application/providers.dart';
import 'package:domain/user/user.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../post/create/select_image_source_dialog.dart';

class EditUserWidget extends HookConsumerWidget {
  const EditUserWidget({
    required this.user,
    super.key,
  });
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editUserController = ref.watch(editUserControllerProvider(user));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(editUserControllerProvider(user).notifier).editUser();
              Navigator.pop(context);
            },
            child: const Text(
              'Save',
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Stack(
              children: <Widget>[
                DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage:
                        (editUserController.newProfileImagePath != null
                            ? FileImage(
                                File(
                                  editUserController.newProfileImagePath!,
                                ),
                              )
                            : NetworkImage(
                                editUserController.user.photoUrl,
                              )) as ImageProvider,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    onPressed: () async {
                      await showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => SafeArea(
                          child: SelectImageSourceDialog(
                            onImageSourceSelected: (imageSource) async {
                              final file = await ImagePicker()
                                  .pickImage(source: imageSource);
                              if (file != null) {
                                ref
                                    .read(
                                      editUserControllerProvider(user).notifier,
                                    )
                                    .setImage(file.path);
                              }
                            },
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Display name',
                  hintStyle: Theme.of(context).textTheme.headline5,
                ),
                style: Theme.of(context).textTheme.headline5,
                maxLength: 30,
                onChanged: (text) {
                  ref
                      .read(editUserControllerProvider(user).notifier)
                      .setUsername(text);
                },
              ),
              TextField(
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'About you',
                ),
                maxLength: 200,
                onChanged: (text) {
                  ref
                      .read(editUserControllerProvider(user).notifier)
                      .setBio(text);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
