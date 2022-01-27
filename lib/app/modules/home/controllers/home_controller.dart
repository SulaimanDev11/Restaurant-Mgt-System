import 'package:get/get.dart';
import 'package:rest_mgt_systm/app/data/services/datebase_helper.dart';
import 'package:rest_mgt_systm/app/modules/constants/constant.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  final dbHelper = DatabaseHelper.instance;
  var datalist = [];

  var backColor = AppColors.sampleColor.obs;
  var backTableColor = AppColors.sampleColor.obs;
  var emptyTableColor = AppColors.sampleColor.obs;
  var amountColor = AppColors.sampleColor.obs;

  void insertPortion(String itemName, int itemPrice) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.dataName: itemName,
      DatabaseHelper.dataPrice: itemPrice,
      DatabaseHelper.portionId: 3,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void queryPortion() async {
    final allRows = await dbHelper.queryAll();
    print('query all rows: ${allRows[0]['dataName']}');
    datalist = allRows;
    // allRows.forEach(print);
  }

  // void _updatePortion() async {
  //   // row to update
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.columnId: 1,
  //     DatabaseHelper.columnName: 'Mary',
  //     DatabaseHelper.columnAge: 32
  //   };
  //   final rowsAffected = await dbHelper.update(row);
  //   print('updated $rowsAffected row(s)');
  // }

  void deletePortion() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }

  @override
  void onInit() {
    insertPortion('chicken', 70);
    queryPortion();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
