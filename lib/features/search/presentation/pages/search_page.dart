import 'package:biblio/core/theming/app_colors.dart';
import 'package:biblio/features/search/presentation/bloc/search_bloc.dart';
import 'package:biblio/features/search/presentation/widgets/search_result_categories.dart';
import 'package:biblio/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    bloc.add(SearchInitialEvent());
    tabController = TabController(length: 3, vsync: this);
  }

  final bloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<SearchBloc, SearchState>(
        bloc: bloc,
        listener: (context, state) {
          // todo: implement listener
        },
        builder: (context, state) {
          if (state is SearchInitialState) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        const SearchTextField(),
                        SizedBox(height: size.height * 0.3),
                        // todo : implement recent searches
                        Text(
                          "Start typing to find a book that suits you",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.secondaryColor,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchLoadedState) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const SearchTextField(),
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
                        child: SearchResultCategories(
                            tabController: tabController)),
                  ],
                ),
              ),
            );
          } else if (state is SearchErrorState) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
