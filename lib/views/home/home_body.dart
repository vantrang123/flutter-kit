import 'package:flutter/material.dart';
import 'package:starterkit/views/home/home_banner.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [BannerHome()],
          ),
        ),
      ),
    );*/
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
        child: Container(
          child: Column(
            children: [BannerHome()],
          ),
        ),
      ));
    });
  }
}
