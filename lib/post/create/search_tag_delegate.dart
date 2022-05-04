import 'package:application/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchTagDelegate extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            query = '';
          },
        ),
      ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    if (theme.brightness == Brightness.light) {
      return super.appBarTheme(context);
    }

    return theme;
  }

  @override
  Widget buildLeading(BuildContext context) => BackButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
      );

  @override
  Widget buildResults(BuildContext context) => _build();

  @override
  Widget buildSuggestions(BuildContext context) => _build();

  Widget _build() => Consumer(
        builder: (context, ref, child) {
          final selectedTags = ref.watch(createPostControllerProvider).tags;
          var tagNames = ref.watch(appTagProvider).when(
                data: (tags) => tags.map((e) => e.name).toList(),
                loading: () => <String>[],
                error: (_, __) => <String>[],
              );
          tagNames = tagNames
              .where(
                (element) =>
                    element.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();

          return Column(
            children: [
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedTags.length,
                  itemBuilder: (context, index) => InputChip(
                    padding: const EdgeInsets.all(4),
                    label: Text(selectedTags[index]),
                    onDeleted: () {
                      ref
                          .read(createPostControllerProvider.notifier)
                          .removeTag(selectedTags[index]);
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tagNames.length,
                  itemBuilder: (context, index) => CheckboxListTile(
                    title: Text(tagNames[index]),
                    value: selectedTags.contains(tagNames[index]),
                    onChanged: (isSelected) {
                      if (isSelected!) {
                        ref
                            .read(createPostControllerProvider.notifier)
                            .addTag(tagNames[index]);
                      } else {
                        ref
                            .read(createPostControllerProvider.notifier)
                            .removeTag(tagNames[index]);
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      );
}
