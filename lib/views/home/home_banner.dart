import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:starterkit/api/api_response.dart';
import 'package:starterkit/blocs/banner_bloc.dart';
import 'package:starterkit/models/movie.dart';
import 'package:starterkit/views/home/item_banner.dart';

// ignore: must_be_immutable
class BannerHome extends StatelessWidget {
  BannerBloc _bannerBloc = BannerBloc();

  @override
  Widget build(BuildContext context) {
    _bannerBloc.fetchBannerList();
    return Container(
      child: StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _bannerBloc.bannerListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                break;
              case Status.ERROR:
                break;
              case Status.COMPLETED:
                return CarouselSlider.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemBanner(snapshot.data.data[index]);
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    disableCenter: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 1.1,
                    // enlargeCenterPage: true,
                  ),
                );
                break;
            }
          }
          return Container();
        },
      ),
    );
  }
}
