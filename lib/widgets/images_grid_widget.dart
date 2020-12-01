import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsteam/models/photo_vm.dart';
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

class ImagePage extends StatelessWidget {
  final PhotoViewModel vm;

  ImagePage(this.vm) : assert(vm != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedNetworkImage(imageUrl: vm.fullImage, fit: BoxFit.fill),
      appBar: AppBar(
        title: Text(vm?.title ?? 'image description'),
      ),
    );
  }
}
