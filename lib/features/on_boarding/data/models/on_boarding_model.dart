import 'package:dalel_app/core/utils/app_assets.dart';

class OnBoardingmodel {
  final String image;
  final String title;

  final String subTitle;

  OnBoardingmodel(
      {required this.image, required this.title, required this.subTitle});
}

List<OnBoardingmodel> onBoardingData = [
  OnBoardingmodel(
      image: Assets.imagesOnBoarding1,
      title: 'Explore The history with Dalel in a smart way',
      subTitle:
          'Using our app’s history libraries you can find many historical periods'),
  OnBoardingmodel(
      image: Assets.imagesOnBoarding2,
      title: 'From every place on earth',
      subTitle: 'A big variety of ancient places from all over the world'),
  OnBoardingmodel(
      image: Assets.imagesOnBoarding3,
      title: 'Using modern AI technology for better user experience',
      subTitle:
          'AI provide recommendations and helps you to continue the search journey'),
];
