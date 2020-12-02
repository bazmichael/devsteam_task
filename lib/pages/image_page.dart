import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsteam/constraints/styles.dart';
import 'package:devsteam/models/photo_vm.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImagePage extends StatefulWidget {
  final PhotoViewModel vm;
  bool panelClosed = true;

  ImagePage(this.vm) : assert(vm != null);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
              child: CachedNetworkImage(
                  imageUrl: widget.vm?.fullImage ?? widget.vm.thumbImage, fit: BoxFit.fill)),
          SlidingUpPanel(
            borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            maxHeight: 200,
            onPanelClosed: () {
              setState(() {
                widget.panelClosed = true;
              });
            },
            onPanelOpened: () {
              setState(() {
                widget.panelClosed = false;
              });
            },
            panel: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(widget.panelClosed
                        ? Icons.arrow_upward
                        : Icons.arrow_downward),
                  ),
                  Text(
                    Strings.authorInfo(widget.vm.author),
                    style: unsplash28,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.vm.title,
                      style: unsplash24,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}