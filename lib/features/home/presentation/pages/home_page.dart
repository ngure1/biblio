import 'package:biblio/core/theming/app_colors.dart';
import 'package:biblio/features/home/presentation/widgets/categorised_books_list.dart';
import 'package:biblio/features/home/presentation/widgets/continue_reading_card.dart';
import 'package:biblio/features/home/presentation/widgets/popular_books_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: SizedBox(
            width: size.width * 0.9,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Column(children: [
                  CarouselSlider(
                    items: const [
                      PopularBooksCard(),
                      PopularBooksCard(),
                      PopularBooksCard(),
                    ],
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        enlargeCenterPage: true,
                        onPageChanged: (value, reason) {
                          setState(() {
                            currentIndex = value;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOutCubic,
                          height: 4,
                          width: i == currentIndex ? 28 : 8,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: i == currentIndex
                                ? AppColors.primaryInverseColor
                                : AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                    ],
                  )
                ]),
                const SizedBox(height: 25),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  splashFactory: NoSplash.splashFactory,
                  labelPadding: const EdgeInsets.only(left: 0, right: 30),
                  labelColor: AppColors.primaryInverseColor,
                  indicator: const BoxDecoration(),
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: AppColors.secondaryColor,
                  tabAlignment: TabAlignment.start,
                  tabs: const [
                    Tab(text: "All genres"),
                    Tab(text: "Fiction"),
                    Tab(text: "Non-fiction"),
                  ],
                ),
                SizedBox(
                  height: 220,
                  child: CategorisedBooksList(tabController: _tabController),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Continue Reading",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ContinueReadingCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
