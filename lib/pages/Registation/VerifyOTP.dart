import 'dart:async';
import 'dart:developer';

import 'package:care_mother_connect/pages/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../UI/CustomButton.dart';
import '../../UI/CustomTextField.dart';

class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  Timer? timer;
  bool isTimerActive = true;
  int remainingTimer = 10;
  bool isLoading = false;

  toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    remainingTimer = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTimer > 0) {
          remainingTimer--;
          isTimerActive = true;
        } else {
          isTimerActive = false;
          timer.cancel();
        }
      });
    });
  }

  moveToHome() {
    toggleLoading();
    timer?.cancel();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  "assets/images/Baby Shark-bro.png",
                ),
              )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/CareMotherLogo.png",
                      width: 150,
                      errorBuilder: (context, error, stackTrace) =>
                          Text(error.toString()),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Enter your verification code.",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("We have sent you a 6 digit OTP on",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+91 1234567890",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "CHANGE",
                            style: GoogleFonts.poppins(
                                color: Colors.teal,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    borderColor: Colors.teal,
                    focusedBorderColor: Colors.teal,
                    enabledBorderColor: Colors.teal.shade100,
                    onSubmit: (value) {
                      moveToHome();
                    },
                  ),
                  isTimerActive
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "RESEND IN ${remainingTimer.toString()}",
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            startTimer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              "RESEND",
                              style: GoogleFonts.poppins(
                                  color: Colors.teal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: "VERIFY",
                    onTap: moveToHome,
                    isLoading: isLoading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  Center(
                    child: Text("© 2022 Care Mother",
                        style: GoogleFonts.poppins(fontSize: 12)),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
