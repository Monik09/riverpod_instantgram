enum LottieAnimation {
  dataNotFound(name: "data_n0t_found"),
  empty(name: "empty"),
  error(name: "error"),
  loading(name: "loading"),
  smallError(name: "small_rror");

  final String name;
  const LottieAnimation({required this.name});
}
