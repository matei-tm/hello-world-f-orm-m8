// GENERATED CODE - DO NOT MODIFY THIS HEADER
// **************************************************************************
// Generator: vscode-f-orm-m8
// Version: 0.1.6
// Database: Sqlite
// Timestamp: 1559633795240
// **************************************************************************
//
// WARNING: If you alter the lines above, on future updates
//          the extension will skip this file
//
// USER CODE - FROM THIS LINE YOU ARE FREE TO MODIFY THE CONTENT
//
// The model respect f-orm-m8 framework annotations system
// More info on: https://github.com/matei-tm/f-orm-m8
//
// You are free and also responsible to add your own fields
//   and annotate according to f-orm-m8
//
// If you changed this file you must
//   re-run the extension
//   f-orm-m8: Generate Sqlite Fixture
//   from the command pallette

import 'package:f_orm_m8/f_orm_m8.dart';

@DataTable("gym_locations")
class GymLocation implements DbEntity {
  @DataColumn("id",
      metadataLevel: ColumnMetadata.primaryKey | ColumnMetadata.autoIncrement)
  @override
  int id;

  @DataColumn("description", metadataLevel: ColumnMetadata.unique)
  String description;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_bigint_column", metadataLevel: ColumnMetadata.ignore)
  BigInt bigintFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_bool_column", metadataLevel: ColumnMetadata.ignore)
  bool boolFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_datetime_column", metadataLevel: ColumnMetadata.ignore)
  DateTime datetimeFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_double_column", metadataLevel: ColumnMetadata.ignore)
  double doubleFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_duration_column", metadataLevel: ColumnMetadata.ignore)
  Duration durationFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_int_column", metadataLevel: ColumnMetadata.ignore)
  int intFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_num_column", metadataLevel: ColumnMetadata.ignore)
  num numFutureField;

  /* The next field is annotated as `ignore`. Feel free to adjust or delete it according to your requirements. */
  @DataColumn("my_future_string_column", metadataLevel: ColumnMetadata.ignore)
  String stringFutureField;
}
