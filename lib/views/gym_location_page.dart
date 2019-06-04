import 'package:flutter/material.dart';
import 'package:hello_world_f_orm_m8/presenters/abstract_presenter.dart';
import 'package:hello_world_f_orm_m8/presenters/gym_location_presenter.dart';
import 'package:hello_world_f_orm_m8/views/gym_location_row.dart';
import 'package:hello_world_f_orm_m8/models/independent/gym_location.g.m8.dart';
import 'package:hello_world_f_orm_m8/views/abstract_view.dart';

class GymLocationsPage extends StatefulWidget {
  GymLocationsPage({Key key}) : super(key: key);

  _GymLocationsPageState createState() => _GymLocationsPageState();
}

class _GymLocationsPageState extends State<GymLocationsPage> implements View {
  final _parentScaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingPresenter<GymLocationProxy> _gymLocationPresenter;

  @override
  void initState() {
    super.initState();
    _gymLocationPresenter = GymLocationPresenter(this);
    _gymLocationPresenter.loadCurrentData().then((result) {
      setState(() {
        print("Loading database result is $result");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _parentScaffoldKey,
      appBar: AppBar(
        title: Text("Gymspector"),
        actions: <Widget>[],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      key: Key('gymLocation'),
                      controller: _gymLocationPresenter,
                      decoration: InputDecoration(
                        hintText: "Type a short description",
                        labelText: "New Gym Location Entry",
                        errorText: _gymLocationPresenter.isNotValid
                            ? 'Value Can\'t Be Empty'
                            : null,
                      ),
                      onSubmitted: (text) async {
                        _gymLocationPresenter.addOrUpdate();
                      },
                    ),
                  ),
                ),
                _getContextButtons(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _gymLocationPresenter.workSetLength,
              itemBuilder: (BuildContext ctxt, int index) {
                return GymLocationRow(
                  gymLocation: _gymLocationPresenter.workSet[index],
                  onPressedEdit: (h) {
                    _gymLocationPresenter.edit(h);
                  },
                  onPressedDelete: (h) {
                    _gymLocationPresenter.delete(h);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showErrorMessage(String message) {
    _parentScaffoldKey.currentState.showSnackBar(SnackBar(
      key: Key('errorSnack'),
      content: ListTile(
        title: Text('Error:'),
        subtitle: Text(
          message,
        ),
      ),
      duration: Duration(seconds: 3),
    ));
  }

  _getContextButtons() {
    if (_gymLocationPresenter.needUpdate)
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              key: Key('cancelGymLocationButton'),
              onPressed: () {
                _gymLocationPresenter.cancelUpdate();
              },
              child: Icon(Icons.cancel,
                  color: Theme.of(context).accentIconTheme.color),
              shape: CircleBorder(),
              color: Theme.of(context).errorColor,
            ),
            RaisedButton(
              key: Key('updGymLocationButton'),
              onPressed: () {
                _gymLocationPresenter.addOrUpdate();
              },
              child: Icon(Icons.check,
                  color: Theme.of(context).accentIconTheme.color),
              shape: CircleBorder(),
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      );
    else
      return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: RaisedButton(
            key: Key('addGymLocationButton'),
            onPressed: () {
              _gymLocationPresenter.addOrUpdate();
            },
            child:
                Icon(Icons.add, color: Theme.of(context).accentIconTheme.color),
            shape: CircleBorder(),
            color: Theme.of(context).accentColor,
          ),
        ),
      );
  }
}
