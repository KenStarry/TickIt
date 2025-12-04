import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tickit/core/presentation/components/custom_text_field.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/dashboard/presentation/components/global_overlay.dart';

import '../../../../../core/presentation/components/blob_clipper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showNavigation.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            /// Carousel Slider for Onboarding Screens
            ClipPath(
              clipper: BottomBlobClipper(),
              child: Container(
                height: context.screenHeight * 0.45,
                child: Image.asset(
                  "assets/images/bg3.png",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: context.colors.backgroundColor,
                ),
                child: Column(
                  // spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      spacing: 8,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(fontSize: 32),
                        ),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: .w700),
                              ),

                              TextSpan(
                                text: "Sign up",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: context.colors.primaryColor,
                                      fontWeight: .w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: .center,
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: [
                        CustomTextField(
                          controller: emailController,
                          prefixIcon: SvgPicture.asset(
                            "assets/svg/email.svg",
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              context.colors.iconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          hintText: "Enter Email",
                        ),
                        CustomTextField(
                          controller: passwordController,
                          obscureText: true,
                          prefixIcon: UnconstrainedBox(
                            child: SvgPicture.asset(
                              "assets/svg/lock.svg",
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                context.colors.iconColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: UnconstrainedBox(
                              child: SvgPicture.asset(
                                "assets/svg/eye.svg",
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                  context.colors.iconColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          hintText: "Enter Password",
                        ),
                        Row(children: []),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Row(
                          spacing: 24,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                color: context.colors.grey200,
                              ),
                            ),
                            Text(
                              "Or Continue with",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: .w700),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                color: context.colors.grey200,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: UnconstrainedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 16,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: context.colors.grey100,
                                      boxShadow: [],
                                    ),
                                    child: UnconstrainedBox(
                                      child: SvgPicture.asset(
                                        "assets/svg/google.svg",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
