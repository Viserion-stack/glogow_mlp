import 'package:flutter/material.dart';
import 'package:glogow_mlp/presentation/screens/auth_gate/auth_gate.dart';

import '../../application/app_insets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> _logoAnimation;
  late AnimationController _logoController;

  @override
  void initState() {
    _logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );

    _logoAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_logoController);

    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {}
      });
    _animationController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/landingGlogow2.png',
              fit: BoxFit.cover,
              alignment: FractionalOffset(_animation.value, 0),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromRGBO(0, 0, 0, 120),
          ),
          Align(
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: _logoAnimation,
              child: SizedBox(
                height: AppInsets.xxxxmLarge,
                width: AppInsets.xxxxmLarge,
                child: Image.asset(
                  'assets/logo_glogow.png',
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              const Center(
                child: Text(
                  'Głogów Małopolski',
                  style: TextStyle(
                    fontSize: AppInsets.xxLarge,
                    color: Colors.white,
                    letterSpacing: AppInsets.xSmall,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .35,
              ),
              Container(
                //color: Colors.transparent,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    onPrimary: Colors.white,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: AppInsets.mLarge,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppInsets.small)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AuthGate.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: AppInsets.xLarge,
                        right: AppInsets.xLarge,
                        top: AppInsets.xMedium,
                        bottom: AppInsets.xMedium),
                    child: Text(
                      'Przejdź dalej',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppInsets.xMedium,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
