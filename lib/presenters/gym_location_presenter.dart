import 'package:hello_world_f_orm_m8/presenters/abstract_presenter.dart';
import 'package:hello_world_f_orm_m8/main.adapter.g.m8.dart';
import 'package:hello_world_f_orm_m8/models/independent/gym_location.g.m8.dart';
import 'package:hello_world_f_orm_m8/views/abstract_view.dart';

class GymLocationPresenter
    extends TextEditingPresenter<GymLocationProxy> {
  int currentGymLocationId;
  bool isNotValid = false;
  final View _view;
  List<GymLocationProxy> workSet = [];
  DatabaseProvider databaseProvider;

  GymLocationPresenter(this._view) : super() {
    DatabaseAdapter dbAdapter = DatabaseAdapter();
    this.databaseProvider = DatabaseProvider(dbAdapter);
  }

  get workSetLength => workSet.length;

  bool get textIsEmpty => text.isEmpty;

  bool get needUpdate => (currentGymLocationId ?? 0) > 0;

  Future<bool> loadCurrentData() async {
    if (currentGymLocationId == null) {
      print("Init State load is called");

      workSet = await databaseProvider.getGymLocationProxiesAll();
      currentGymLocationId = 0;
    }

    return true;
  }

  Future<void> addOrUpdate() async {
    try {
      if (textIsEmpty) {
        isNotValid = true;
        _view.setState(() {});
        return;
      }

      if (currentGymLocationId > 0) {
        GymLocationProxy updatedGymLocation =
            workSet.where((g) => g.id == currentGymLocationId).first;
        updatedGymLocation.description = text;
        await databaseProvider.updateGymLocation(updatedGymLocation);
        clear();
      } else {
        GymLocationProxy newGymLocation = GymLocationProxy();
        newGymLocation.description = text;
        int newId = await databaseProvider.saveGymLocation(newGymLocation);
        newGymLocation.id = newId;

        workSet.add(newGymLocation);
        clear();
      }

      currentGymLocationId = 0;
      isNotValid = false;

      _view.setState(() {});
    } catch (e) {
      _view.showErrorMessage(e.toString());
    }
  }

  Future<void> edit(GymLocationProxy h) async {
    try {
      clear();
      text = h.description;
      currentGymLocationId = h.id;

      _view.setState(() {});
    } catch (e) {
      _view.showErrorMessage(e.toString());
    }
  }

  Future<void> delete(GymLocationProxy h) async {
    try {
      await databaseProvider.deleteGymLocation(h.id);
      workSet.remove(h);

      _view.setState(() {});
    } catch (e) {
      _view.showErrorMessage(e.toString());
    }
  }

  void cancelUpdate() {
    try {
      clear();
      currentGymLocationId = 0;
      _view.setState(() {});
    } catch (e) {
      _view.showErrorMessage(e.toString());
    }
  }
}
