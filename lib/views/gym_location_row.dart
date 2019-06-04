import 'package:flutter/material.dart';
import 'package:hello_world_f_orm_m8/models/independent/gym_location.g.m8.dart';

typedef GymLocationRowActionCallback = void Function(
    GymLocationProxy gymLocation);

class GymLocationRow extends StatelessWidget {
  GymLocationRow({this.gymLocation, this.onPressedEdit, this.onPressedDelete})
      : super(key: ObjectKey(gymLocation));

  final GymLocationProxy gymLocation;

  final GymLocationRowActionCallback onPressedEdit;
  final GymLocationRowActionCallback onPressedDelete;

  GestureTapCallback _getHandler(GymLocationRowActionCallback callback) {
    return callback == null ? null : () => callback(gymLocation);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 6.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Text(gymLocation.description)),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline:
                      DefaultTextStyle.of(context).style.textBaseline),
            ),
            IconButton(
              key: Key('delBtnGymPlace${gymLocation.id}'),
              icon: const Icon(Icons.delete),
              color: Theme.of(context).accentColor,
              onPressed: _getHandler(onPressedDelete),
            ),
            IconButton(
              key: Key('edtBtnGymPlace${gymLocation.id}'),
              icon: const Icon(Icons.edit),
              color: Theme.of(context).accentColor,
              onPressed: _getHandler(onPressedEdit),
            ),
          ],
        ),
      ),
    );
  }
}
