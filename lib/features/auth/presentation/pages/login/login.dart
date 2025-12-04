import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tickit/core/presentation/components/custom_text_field.dart';
import 'package:tickit/core/utils/extensions/context_extensions.dart';
import 'package:tickit/features/dashboard/presentation/components/global_overlay.dart';
import 'package:tickit/features/dashboard/presentation/cubit/feedback_cubit.dart';

import '../../../../../core/presentation/components/blob_clipper.dart';
import '../../../../dashboard/domain/enum/feedback_enum.dart';
import '../bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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
        child: Form(
          key: loginFormKey,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: context.screenHeight * 0.4,
                backgroundColor: context.colors.backgroundColor,
                surfaceTintColor: context.colors.backgroundColor,
                automaticallyImplyLeading: false,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      ClipPath(
                        clipper: BottomBlobClipper(),
                        child: SizedBox(
                          height: double.infinity,
                          child: Image.asset(
                            "assets/images/bg3.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const .only(top: 50.0),
                          child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: SvgPicture.asset(
                              "assets/svg/arrow_back.svg",
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const .symmetric(horizontal: 16),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
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
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 32)),

                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: .center,
                        mainAxisAlignment: .center,
                        spacing: 24,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }

                              if (!value.isEmailValid()) {
                                return "Invalid Email Format";
                              }

                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 32)),

                    SliverToBoxAdapter(
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                            BlocConsumer<LoginBloc, LoginState>(
                              listener:
                                  (
                                    BuildContext context,
                                    LoginState loginState,
                                  ) {
                                    if (loginState is LoginSuccess) {
                                      context.read<FeedbackCubit>().show(
                                        "Logged In Successfully!",
                                        type: FeedbackType.success,
                                      );

                                      context.goNamed('tickets');
                                    }

                                    if (loginState is LoginFailure) {
                                      context.read<FeedbackCubit>().show(
                                        "Incorrect email or password. Try Again",
                                        type: FeedbackType.error,
                                      );
                                    }
                                  },
                              builder: (context, loginState) {
                                final isLoading = loginState is LoginLoading;
                                return GestureDetector(
                                  onTap: () async {
                                    // _triggerAnimation();

                                    if (loginFormKey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(
                                        LoginUserEvent(
                                            userEmail: emailController.text,
                                            password: passwordController.text
                                        ),
                                      );
                                    }
                                    //
                                    // // setState(() {
                                    // //   _ticketLoading = true;
                                    // // });
                                    //
                                    // // Simulate a network request (e.g., 2 seconds)
                                    //
                                    // //  Save Token to SharedPrefs
                                    // final repo = locator
                                    //     .get<SharedPrefsRepository>();
                                    //
                                    // await repo.setLoginToken(
                                    //   Uuid().v4(),
                                    //   email: emailController.text,
                                    // );

                                    // Reset back to button (optional)
                                    // if (mounted) {
                                    //   setState(() {
                                    //     _ticketLoading = false;
                                    //   });
                                    // }
                                  },
                                  child: AnimatedContainer(
                                    duration: 200.milliSeconds,
                                    curve: Curves.easeIn,
                                    width: isLoading ? 60 : 150,
                                    height: isLoading ? 60 : 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: context.colors.primaryColor,
                                    ),
                                    child: Center(
                                      child: AnimatedSwitcher(
                                        duration: 300.milliSeconds,
                                        switchInCurve: Curves.easeIn,
                                        switchOutCurve: Curves.easeOut,
                                        child: isLoading
                                            ? UnconstrainedBox(
                                                child: SpinKitSpinningLines(
                                                  color: context
                                                      .colors
                                                      .onPrimaryColor,
                                                  size: 45,
                                                ),
                                              )
                                            : Text(
                                                "Login",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      color: context
                                                          .colors
                                                          .onPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 32)),

                    SliverToBoxAdapter(
                      child: Column(
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
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 200)),

              // Expanded(
              //   child: Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     decoration: BoxDecoration(
              //       color: context.colors.backgroundColor,
              //     ),
              //     child: Column(
              //       // spacing: 16,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
