import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:theme/colors.dart';

Future<void> main() async {
  await Common.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  List<IconData> icons = [
    // FontAwesomeIcons.house,
    // FontAwesomeIcons.magnifyingGlass,
    // FontAwesomeIcons.addressBook,
    // FontAwesomeIcons.faceDizzy,
    // FontAwesomeIcons.streetView,
    Icons.home,
    Icons.search,
    Icons.wallet_giftcard,
    Icons.chat,
    Icons.account_circle,
  ];

  List<Widget> buildTabs(int currentPage) {
    return icons.asMap().entries.map((entry) {
      int index = entry.key;
      IconData icon = entry.value;
      return SizedBox(
        height: 50,
        width: 30,
        child: Center(
          child: Icon(
            icon,
            color: currentPage == index ? AppColor.primary : Colors.white,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        shadowColor: AppColor.secondary,
        title: const Text(
          "ホーム",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BottomBar(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                borderRadius: BorderRadius.circular(50),
                barColor: const Color.fromARGB(255, 57, 60, 68),
                width: MediaQuery.of(context).size.width * 0.8,
                start: 2,
                end: 0,
                offset: 20,
                iconHeight: 35,
                iconWidth: 35,
                reverse: false,
                hideOnScroll: true,
                scrollOpposite: false,
                onBottomBarHidden: () {},
                onBottomBarShown: () {},
                body: (context, controller) => TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                    SizedBox.shrink(),
                  ],
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                  controller: tabController,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return states.contains(MaterialState.focused)
                          ? null
                          : Colors.transparent;
                    },
                  ),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 4,
                    ),
                    insets: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                  ),
                  tabs: buildTabs(currentPage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
