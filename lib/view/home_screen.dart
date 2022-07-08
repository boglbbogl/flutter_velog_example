import 'package:flutter/material.dart';
import 'package:flutter_velog_example/_constant/theme.dart';
import 'package:flutter_velog_example/state/sign_in_provider.dart';
import 'package:flutter_velog_example/view/slider_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            backgroundColor: darkColor,
            title: Text(
              'GUEST',
              style: theme.textTheme.bodyText2!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: size.width,
                          height: 300,
                          color: const Color.fromRGBO(55, 55, 55, 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buttonForm(
                                title: 'Sign In With Kakao',
                                onTap: () {},
                              ),
                              const SizedBox(height: 20),
                              _buttonForm(
                                title: 'Sign In With Google',
                                onTap: () {
                                  context
                                      .read<SignInProvider>()
                                      .signInWithGoogle();
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 4, bottom: 4),
                  child: Container(
                    width: 45,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(55, 55, 55, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, _, __) => SliderScreen()));
                },
                child: Container(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'SLIDER',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buttonForm({
    required String title,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: darkColor),
          child: Center(
            child: Text(
              title,
              style: theme.textTheme.bodyText2!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
