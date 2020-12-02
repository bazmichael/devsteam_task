import 'package:devsteam/pages/image_page.dart';
import 'package:devsteam/providers/images_provider.dart';
import 'package:devsteam/widgets/image_grid_item.dart';
import 'package:flutter/cupertino.dart';
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
        child: InkWell(
            child: imageGridItem(provider.images[i].thumbImage),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImagePage(provider.images[i])))),
      ),
    ),
  ),
));


