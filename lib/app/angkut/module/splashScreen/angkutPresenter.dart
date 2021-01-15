import 'package:enerren/module/splashScreen/presenter.dart';

mixin AngkutPresenter on PresenterState {
  @override
  void initState() {
    super.autoStart = false;
    super.initState();
  }
}
