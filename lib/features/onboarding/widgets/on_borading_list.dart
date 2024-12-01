import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';

List<OnBoardingModel> getOnBoardingList() {
  return [
    OnBoardingModel(
      imagePath: 'assets/images/first_onboarding.png',
      title: 'Welcome to Cretec!',
      body: 'Your all-in-one platform for concrete\nproduction, combining suppliers,\nsmart shopping, and AI-powered\nsupport',
    ),
    OnBoardingModel(
      imagePath: 'assets/images/second_onboarding.png',
      title: 'Choose with Confidence',
      body: 'Compare prices and quality from\nvarious suppliers to find the best deal',
    ),
    OnBoardingModel(
      imagePath: 'assets/images/last_onboarding.png',
      title: 'AI-Driven Concrete Analysis',
      body: 'Monitor and analyze compressive\nstrength with AI to ensure optimal results',
    ),
  ];
}
