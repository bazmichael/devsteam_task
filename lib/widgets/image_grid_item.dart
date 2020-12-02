import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget imageGridItem(String url) => ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, _) => Padding(
          padding: EdgeInsets.all(50),
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, _, widget) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
