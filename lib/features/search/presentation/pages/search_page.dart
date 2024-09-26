import 'package:biblio/core/theming/app_colors.dart';
import 'package:biblio/features/search/presentation/widgets/search_result_categories.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColors.primaryInverseColor,
                        width: 1.5,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Find a book that suits your taste',
                  hintStyle:
                      TextStyle(color: AppColors.secondaryColor, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TabBar(
                controller: tabController,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                labelPadding: const EdgeInsets.only(left: 0, right: 30),
                labelColor: AppColors.primaryInverseColor,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.secondaryColor,
                tabs: const [
                  Tab(text: "All results"),
                  Tab(text: "Free"),
                  Tab(text: "Author"),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                  height: 570,
                  child: SearchResultCategories(tabController: tabController)),
            ],
          ),
        ),
      ),
    );
  }
}
