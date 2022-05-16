import 'dart:io';

import 'package:application/providers.dart';
import 'package:domain/post/post.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../tag_chip_widget.dart';
import 'search_tag_delegate.dart';
import 'select_image_source_dialog.dart';
import 'select_times_widget.dart';

class CreatePostPage extends ConsumerWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPostState = ref.watch(createPostControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ask for help',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.send_rounded,
            ),
            onPressed: () {
              final user = ref.read(myUserProvider).asData?.value;
              if (user != null) {
                final post = Post(
                  name: createPostState.name,
                  userName: user.name,
                  userId: user.id,
                  userPhotoUrl: user.photoUrl,
                  text: createPostState.text,
                  tags: createPostState.tags,
                  createdDate: DateTime.now(),
                  images: createPostState.imageUrls,
                  timeSlots: createPostState.timeSlots,
                  commentCount: 0,
                  id: '',
                  likedUserIds: [],
                );
                ref
                    .read(createPostControllerProvider.notifier)
                    .createPost(post);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "What's the problem?",
                    hintStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLength: 50,
                  onChanged: (text) {
                    ref.read(createPostControllerProvider.notifier).name(text);
                  },
                ),
                const Divider(height: 0),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Describe it',
                    ),
                    maxLength: 1000,
                    onChanged: (text) {
                      ref
                          .read(createPostControllerProvider.notifier)
                          .write(text);
                    },
                  ),
                ),
                const Divider(height: 0),
                Column(
                  children: List.generate(
                    createPostState.imageUrls.length,
                    (index) => Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            child: Image.file(
                              File(createPostState.imageUrls[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: IconButton(
                              onPressed: () {
                                ref
                                    .read(
                                      createPostControllerProvider.notifier,
                                    )
                                    .removeImage(index);
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
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
                                    createPostControllerProvider.notifier,
                                  )
                                  .addImage(file.path);
                            }
                          },
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.attach_file_outlined,
                          ),
                        ),
                        Text('Attach'),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 0),
                InkWell(
                  focusColor: Colors.black,
                  onTap: () async {
                    final times = await showModalBottomSheet<List<DateTime>>(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      builder: (context) => FractionallySizedBox(
                        heightFactor: 0.95,
                        child: SelectTimesWidget(
                          timeSlots: createPostState.timeSlots,
                        ),
                      ),
                    );
                    if (times != null) {
                      ref
                          .read(createPostControllerProvider.notifier)
                          .selectTimeSlots(times);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.calendar_today_rounded,
                          ),
                        ),
                        if (createPostState.timeSlots.isNotEmpty)
                          Expanded(
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 2,
                              children: createPostState.timeSlots
                                  .map(
                                    (e) => TagChipWidget(
                                      text: TimeOfDay.fromDateTime(e)
                                          .format(context),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        else
                          const Text('Add times'),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 0),
                InkWell(
                  focusColor: Colors.black,
                  onTap: () async {
                    await showSearch<void>(
                      context: context,
                      delegate: SearchTagDelegate(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.tag,
                          ),
                        ),
                        if (createPostState.tags.isNotEmpty)
                          Expanded(
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 2,
                              children: createPostState.tags
                                  .map(
                                    (e) => TagChipWidget(
                                      text: e,
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        else
                          const Text('Add tags'),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
