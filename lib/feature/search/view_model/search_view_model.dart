import '../../../core/_core_exports.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel({
    required this.searchRepo,
  });

  SearchRepository searchRepo;

  SearchArguments searchArguments = SearchArguments();

  UIState<WeatherModel> searchedData = UIState.idle();

  TextEditingController searchTextController = TextEditingController();

  Timer? debounce;

  onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 700), () {
      query = searchTextController.text;
      fetchSearchedData();
    });
  }

  Future<void> fetchSearchedData() async {
    searchedData.data = null;
    searchedData = UIState.loading();
    notifyListeners();

    if (searchTextController.text.isEmpty) {
      searchedData = UIState.idle();
      notifyListeners();
    } else {
      try {
        final res = await searchRepo.searchLocation(searchArguments: SearchArguments(q: searchTextController.text));

        res.fold((l) {
          searchedData = UIState.error(l.errorMessage);
          notifyListeners();
          showCustomMessenger(CustomMessengerState.ERROR, l.errorMessage);
        }, (data) {
          searchedData = UIState.success(data);

          notifyListeners();
        });
      } catch (_) {}
    }
  }

  void showSearchDetails() async {
    Go.to.page(PageRoutes.homePage);

    sl<HomeViewModel>().refreshPage(query: searchTextController.text);
  }
}
