import 'package:flutter/material.dart';
import '../../../config/app_router.dart';
import '../../../constants/login_screen/login_screen_data.dart';
import '../../widgets/login_screen_item.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 752,
                child: Image.network(
                    fit: BoxFit.cover,
                    'https://images.squarespace-cdn.com/content/v1/5982fa4fe58c62cb28091fa4/1583424203893-6HL2VVUIXK3PEIBXKSVL/image-asset.jpeg?format=1500w'),
              ),
              Positioned(
                top: 50,
                left: 50,
                child: SizedBox(
                  height: 82,
                  width: 253,
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://images.squarespace-cdn.com/content/v1/5982fa4fe58c62cb28091fa4/1583424203893-6HL2VVUIXK3PEIBXKSVL/image-asset.jpeg?format=1500w'),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello Again!',
                    style: TextStyle(
                        fontSize: 48,
                        color: Color(0xff111827),
                        fontWeight: FontWeight.w800),
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.dashboard);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0566BD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
