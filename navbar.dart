import 'package:book/profile.dart';
import 'package:flutter/material.dart';
import 'challenge.dart';
import 'favorite.dart';
import 'intro_screen.dart';
import 'main.dart';


class Navbar extends StatefulWidget {
  const Navbar( {Key? key}) : super(key: key);


  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'المنزل',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assessment_rounded),
        label: 'التحدي',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'المفضلة',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'صفحتي',
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children:[
         const MyHomePage(),
        const Challenge(),
        const FavoritePage(),
        IntroScreen(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.indigo,
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}



