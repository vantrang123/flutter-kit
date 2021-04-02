import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starterkit/models/movie.dart';
import 'package:starterkit/utils/size_config.dart';

class ItemBanner extends StatelessWidget {
  final Movie data;

  ItemBanner(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// handle click here
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Card(
          elevation: 0,
          borderOnForeground: false,
          child: Stack(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) =>
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                imageUrl: 'https://image.tmdb.org/t/p/w500${data.backdropPath}',
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                fit: BoxFit.none,
              )
            ],
          ),
        ),
      ),
    );
  }
}