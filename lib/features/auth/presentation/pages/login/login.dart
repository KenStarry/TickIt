import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class _LoginState extends State<Login> with TickerProviderStateMixin {
  bool passVisible = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final AnimationController? _titleAnimation;
  late final AnimationController? _descriptionAnimation;
  late final AnimationController? _emailAnimation;
  late final AnimationController? _passwordAnimation;
  late final AnimationController? _loginBtnAnimation;
  late final AnimationController? _continueAnimation;
  late final AnimationController? _googleAnimation;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showNavigation.value = false;
    });

    _titleAnimation = AnimationController(vsync: this);
    _descriptionAnimation = AnimationController(vsync: this);
    _emailAnimation = AnimationController(vsync: this);
    _passwordAnimation = AnimationController(vsync: this);
    _loginBtnAnimation = AnimationController(vsync: this);
    _continueAnimation = AnimationController(vsync: this);
    _googleAnimation = AnimationController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _forwardAnimation();
    });
  }

  Future<void> _forwardAnimation() async {
    await Future.wait([
      Future.delayed(200.milliseconds, () => _titleAnimation!.forward()),
      Future.delayed(400.milliseconds, () => _descriptionAnimation!.forward()),
      Future.delayed(600.milliseconds, () => _emailAnimation!.forward()),
      Future.delayed(800.milliseconds, () => _passwordAnimation!.forward()),
      Future.delayed(1000.milliseconds, () => _loginBtnAnimation!.forward()),
      Future.delayed(1200.milliseconds, () => _continueAnimation!.forward()),
      Future.delayed(1400.milliseconds, () => _googleAnimation!.forward()),
    ]);
  }

  Future<void> _reverseAnimation() async {
    await Future.wait([
      Future.delayed(200.milliseconds, () => _googleAnimation!.reverse()),
      Future.delayed(400.milliseconds, () => _continueAnimation!.reverse()),
      Future.delayed(600.milliseconds, () => _loginBtnAnimation!.reverse()),
      Future.delayed(800.milliseconds, () => _passwordAnimation!.reverse()),
      Future.delayed(1000.milliseconds, () => _emailAnimation!.reverse()),
      Future.delayed(1200.milliseconds, () => _descriptionAnimation!.reverse()),
      Future.delayed(1400.milliseconds, () => _titleAnimation!.reverse()),
    ]);
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
                              )
                              .animate(
                                autoPlay: false,
                                controller: _titleAnimation,
                              )
                              .moveY(
                                begin: 100,
                                end: -10,
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .fadeIn(
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .then()
                              .moveY(
                                duration: 300.milliseconds,
                                begin: 0,
                                end: 10,
                                curve: Curves.ease,
                              ),

                          Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Don't have an account? ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(fontWeight: .w700),
                                    ),

                                    TextSpan(
                                      text: "Sign up",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: context.colors.primaryColor,
                                            fontWeight: .w700,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                              .animate(
                                autoPlay: false,
                                controller: _descriptionAnimation,
                              )
                              .moveY(
                                begin: 100,
                                end: -20,
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .fadeIn(
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .then()
                              .moveY(
                                duration: 300.milliseconds,
                                begin: 0,
                                end: 20,
                                curve: Curves.ease,
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
                              )
                              .animate(
                                autoPlay: false,
                                controller: _emailAnimation,
                              )
                              .moveY(
                                begin: 100,
                                end: -20,
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .fadeIn(
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .then()
                              .moveY(
                                duration: 300.milliseconds,
                                begin: 0,
                                end: 20,
                                curve: Curves.ease,
                              ),

                          CustomTextField(
                                controller: passwordController,
                                obscureText: !passVisible,
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
                                  onPressed: () {
                                    setState(() {
                                      passVisible = !passVisible;
                                    });
                                  },
                                  icon: UnconstrainedBox(
                                    child: SvgPicture.asset(
                                      "assets/svg/${passVisible ? "eye_closed" : "eye"}.svg",
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
                              )
                              .animate(
                                autoPlay: false,
                                controller: _passwordAnimation,
                              )
                              .moveY(
                                begin: 100,
                                end: -20,
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .fadeIn(
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .then()
                              .moveY(
                                duration: 300.milliseconds,
                                begin: 0,
                                end: 20,
                                curve: Curves.ease,
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
                                  ) async {
                                    if (loginState is LoginSuccess) {
                                      context.read<FeedbackCubit>().show(
                                        "Logged In Successfully!",
                                        type: FeedbackType.success,
                                      );

                                      //  Reverse the animations first
                                      await _reverseAnimation();

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

                                        if (loginFormKey.currentState!
                                            .validate()) {
                                          context.read<LoginBloc>().add(
                                            LoginUserEvent(
                                              userEmail: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );

                                          context.unFocus();
                                        }
                                      },
                                      child: AnimatedContainer(
                                        duration: 200.milliSeconds,
                                        curve: Curves.easeIn,
                                        width: isLoading ? 60 : 150,
                                        height: isLoading ? 60 : 55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
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
                                    )
                                    .animate(
                                      autoPlay: false,
                                      controller: _loginBtnAnimation,
                                    )
                                    .moveY(
                                      begin: 100,
                                      end: -20,
                                      duration: 300.milliseconds,
                                      curve: Curves.ease,
                                    )
                                    .fadeIn(
                                      duration: 300.milliseconds,
                                      curve: Curves.ease,
                                    )
                                    .then()
                                    .moveY(
                                      duration: 300.milliseconds,
                                      begin: 0,
                                      end: 20,
                                      curve: Curves.ease,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: .w700),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 2,
                                      color: context.colors.grey200,
                                    ),
                                  ),
                                ],
                              )
                              .animate(
                                autoPlay: false,
                                controller: _continueAnimation,
                              )
                              .moveY(
                                begin: 100,
                                end: -20,
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .fadeIn(
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .then()
                              .moveY(
                                duration: 300.milliseconds,
                                begin: 0,
                                end: 20,
                                curve: Curves.ease,
                              ),
                          GestureDetector(
                                onTap: () {
                                  context.read<FeedbackCubit>().show(
                                    "My first task as your new Engineer: finish this screen. ✅",
                                    type: FeedbackType.success,
                                  );
                                },
                                child: UnconstrainedBox(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                      horizontal: 24,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              )
                              .animate(
                                autoPlay: false,
                                controller: _googleAnimation,
                              )
                              .moveY(
                                begin: 100,
                                end: -20,
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .fadeIn(
                                duration: 300.milliseconds,
                                curve: Curves.ease,
                              )
                              .then()
                              .moveY(
                                duration: 300.milliseconds,
                                begin: 0,
                                end: 20,
                                curve: Curves.ease,
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 200)),
            ],
          ),
        ),
      ),
    );
  }
}
