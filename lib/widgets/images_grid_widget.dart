import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsteam/providers/images_provider.dart';
import 'package:devsteam/widgets/image_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final imagesGridWidget = Container(
    child: Consumer<ImagesProvider>(
  builder: (context, provider, _) => RefreshIndicator(
    onRefresh: () => provider.refresh(),
    child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: provider.images.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: imageGridItem(provider.images[i].thumbImage),
      ),
    ),
  ),
));
