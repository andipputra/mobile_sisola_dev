import 'package:flutter/material.dart';
import 'package:mobile_sisola_dev/utils/style/text_style_resource.dart';

// widget untuk loading
Widget loading = Center(
  child: Column(
    children: [
      CircularProgressIndicator(),
      Text("Mohon Ditunggu", style: TextStyleResource.textTitle(Colors.black87),),
    ],
  ),
);


// widget untuk list satu baris
Widget cardSingleLine(String title, String caption) => Card(
  clipBehavior: Clip.antiAlias,
  child: ListTile(
      leading: Icon(Icons.data_usage),
      title: Text(title),
      subtitle: Text(caption),
    ),
);
