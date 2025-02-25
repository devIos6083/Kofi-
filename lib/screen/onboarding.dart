import 'package:coffe_shop/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 48,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Text(
                    "'Fall in Love with\nCoffee in Blissful\nDelight!',",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Welcome to our cozy coffee corner,\nwhere every cup is a delightful for you.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      color: Color(0xFFEDEDED),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => HomeScreen(),
                          ),
                        );
                      },
                      height: 56,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minWidth: double.infinity,
                      color: Color(0xFFC67C4E),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.sora(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
