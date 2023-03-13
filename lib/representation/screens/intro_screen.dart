import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/constants/text_styles_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = 'intro_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              _ItemIntroScreen(
                image: AssetHelper.imageIntro_1,
                title: 'Book a flight',
                description:
                    'Found a flight that matches your destination and schedule? Book it instantly.',
                alignment: Alignment.centerRight,
              ),
              _ItemIntroScreen(
                image: AssetHelper.imageIntro_2,
                title: 'Find a hotel room',
                description:
                    'Select the day, book your room. We give you the best price.',
                alignment: Alignment.center,
              ),
              _ItemIntroScreen(
                image: AssetHelper.imageIntro_3,
                title: 'Enjoy your trip',
                description:
                    'Easy discovering new places and share these between your friends and travel together.',
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
          Positioned(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.orange,
                        dotWidth: kMinPadding,
                        dotHeight: kMinPadding,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: ButtonWidget(
                      title: 'Next',
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class _ItemIntroScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final AlignmentGeometry alignment;

  const _ItemIntroScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: alignment,
            child: ImageHelper.loadFromAssets(image,
                height: 400, fit: BoxFit.fitHeight)),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(height: kMediumPadding),
              Text(description, style: TextStyles.defaultStyle),
            ],
          ),
        ),
      ],
    );
  }
}
