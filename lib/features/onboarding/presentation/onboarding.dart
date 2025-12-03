import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/bg3.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 50, top: 100),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .start,
                spacing: 24,
                children: [
                  Text(
                    "Hey\nready for Tonight?",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Resolve Tickets with ease",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
