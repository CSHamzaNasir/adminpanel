import 'package:flutter/material.dart';
import '../../../config/app_router.dart';
import '../../../constants/login_screen/login_screen_data.dart';
import '../../widgets/login_screen_item.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const backgroundImageURL =
      'https://images.squarespace-cdn.com/content/v1/5982fa4fe58c62cb28091fa4/1583424203893-6HL2VVUIXK3PEIBXKSVL/image-asset.jpeg?format=1500w';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildBackgroundImage(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _calculateHorizontalPadding(context)),
              child: _buildContent(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth =
        screenWidth < 700 ? 200 : (screenWidth < 1100 ? 300 : 752);
    double imageHeight = screenWidth < 700
        ? double.infinity
        : (screenWidth < 1100 ? double.infinity : double.infinity);
    double secondImageTop = 50;
    double secondImageLeft = 30;

    return Stack(
      children: [
        SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: Image.network(
            backgroundImageURL,
            fit: BoxFit.cover,
          ),
        ),
        Visibility(
          visible: screenWidth >= 700,
          child: Positioned(
            top: secondImageTop,
            left: secondImageLeft,
            child: SizedBox(
              height: 82,
              width: 253,
              child: Image.network(
                'https://i.ibb.co/3RnTNSc/SPCA-Logo-1-2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _calculateHorizontalPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.07;
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello Again!',
          style: TextStyle(
            fontSize: 48,
            color: Color(0xff111827),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff111827),
          ),
        ),
        const SizedBox(height: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: inputFields.map((field) {
            return TextFieldWithIconAndText(
              icon: field['icon'],
              hint: field['hint'],
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        _buildLoginButton(context),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          AppRouter.dashboard,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0566BD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        width: screenWidth < 1100 ? 300 : double.infinity,
        height: 40,
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
