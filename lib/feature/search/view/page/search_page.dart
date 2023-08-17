import 'package:lottie/lottie.dart';

import '../../../../core/_core_exports.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Consumer<SearchViewModel>(
      builder: (context, searchViewModel, child) {
        return AppScaffold(
          body: AppBackground(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppTextFormField.standart(
                    controller: searchViewModel.searchTextController,
                    hintText: "Ara",
                    onChanged: (query) {
                      searchViewModel.onSearchChanged(query);
                    },
                    suffixIcon: const Icon(Icons.search),
                  ),
                  if (!searchViewModel.searchedData.isSuccess) ...[
                    const Spacer(),
                  ],
                  AppWidgetBuilderByState(
                    idleWidget: Transform.scale(
                      scale: 2.5.w,
                      child: Lottie.asset(
                        AssetPaths().searchSomething,
                      ),
                    ),
                    errorWidget: Transform.scale(
                      scale: .8.w,
                      child: Lottie.asset(
                        AssetPaths().notFound,
                      ),
                    ),
                    response: searchViewModel.searchedData,
                    builder: (searchedData) {
                      return InkWell(
                        onTap: searchViewModel.showSearchDetails,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AssetPaths().search,
                                height: 32,
                              ),
                              AppSizedBox.w(8),
                              AppText(
                                searchedData.name!,
                                style: AppTextStyles.medium18W500,
                              ),
                              const Spacer(),
                              AppText(
                                "${searchedData.main!.temp!.toString().substring(0, 2)}°",
                                style: AppTextStyles.medium18W500,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
