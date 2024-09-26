import 'package:biblio/core/theming/app_colors.dart';
import 'package:biblio/features/home/presentation/widgets/categorised_books_list.dart';
import 'package:biblio/features/home/presentation/widgets/continue_reading_card.dart';
import 'package:biblio/features/home/presentation/widgets/popular_books_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

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
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const PopularBooksCard(),
              const SizedBox(height: 38),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                labelPadding: const EdgeInsets.only(left: 0, right: 30),
                labelColor: AppColors.primaryInverseColor,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.secondaryColor,
                tabAlignment: TabAlignment.center,
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
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 48),
                  child: Text(
                    "Continue Reading",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ContinueReadingCard(),
            ],
          ),
        ),
      ),
    );
  }
}
