import 'package:weather/core/_core_exports.dart';
import 'package:weather/core/shared_widgets/app_tab_controller/utils/sliver_app_bar_delegate.dart';

class AppTabController extends StatelessWidget {
  AppTabController({
    super.key,
    required this.minTabHeight,
    required this.maxTabHeight,
    required this.tabs,
    required this.tabViews,
    this.pinned = false,
    this.onTap,
  }) : assert(tabViews.length == tabs.length);

  final double minTabHeight;
  final double maxTabHeight;
  final List<Widget> tabs;
  final List<Widget> tabViews;
  final bool pinned;
  void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, index) => [
          SliverPersistentHeader(
            pinned: pinned,
            delegate: SliverAppBarDelegate(
              minHeight: minTabHeight,
              maxHeight: maxTabHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.secondaryColor,
                        width: 2.h,
                      ),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: AppColors.primaryColor,
                    indicatorWeight: 2.h,
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: Colors.red,
                    labelStyle: AppTextStyles.medium15W500,
                    unselectedLabelStyle: AppTextStyles.medium15W500,
                    labelPadding: EdgeInsets.zero,
                    tabs: tabs,
                    onTap: onTap,
                  ),
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          children: tabViews,
        ),
      ),
    );
  }
}
