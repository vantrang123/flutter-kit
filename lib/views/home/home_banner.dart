import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:starterkit/api/api_response.dart';
import 'package:starterkit/blocs/banner_bloc.dart';
import 'package:starterkit/models/movie.dart';
import 'package:starterkit/theme/colors.dart';
import 'package:starterkit/utils/size_config.dart';
import 'package:starterkit/views/home/item_banner.dart';

// ignore: must_be_immutable
class BannerHome extends StatefulWidget {
  @override
  _BannerHomeState createState() => _BannerHomeState();
}
class _BannerHomeState extends State<BannerHome> with SingleTickerProviderStateMixin{

  BannerBloc _bannerBloc = BannerBloc();

  PageController pageController =
  PageController(viewportFraction: 0.8, keepPage: true);
  AnimationController _animationController;
  Animation<double> _nextPage;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _bannerBloc.fetchBannerList();
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 10));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        final int page = 4; //Number of pages in your PageView
        if (_currentPage < page) {
          _currentPage++;
          pageController.animateToPage(_currentPage,
              duration: Duration(milliseconds: 200), curve: Curves.easeInSine);
        } else {
          _currentPage = 0;
          pageController.jumpToPage(0);
        }
      }
    });
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
                return Container(
                  height: 220.0,
                  child: PageIndicatorContainer(
                    align: IndicatorAlign.bottom,
                    length: snapshot.data.data.take(5).length ?? 0,
                    indicatorSpace: 8.0,
                    padding: const EdgeInsets.all(5.0),
                    indicatorColor: titleColor,
                    indicatorSelectorColor: red,
                    shape: IndicatorShape.circle(size: 5.0),
                    pageView: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        _animationController.forward();
                        _currentPage = value;
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.data.take(5).length ?? 0,
                      itemBuilder: (context, index) {
                        return ItemBanner(snapshot.data.data[index]);
                      },
                    ),
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
