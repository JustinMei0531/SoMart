import "package:flutter/material.dart";
import "package:management_system/widgets/custom_textfield.dart";

class NutritionTable extends StatelessWidget {
  NutritionTable(
      {required this.paddingValue,
      required this.controllerList,
      required this.labelList,
      super.key});

  final EdgeInsets paddingValue;

  final List<TextEditingController> controllerList;

  List<String> labelList;

  List<TableRow> initTableContent() {
    List<TableRow> result = [
      const TableRow(
        decoration: BoxDecoration(
          color: Colors.grey, // Add color or other decoration if needed
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Label",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "Per serving",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "Per 100g",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ];

    for (var label in labelList) {
      result.add(TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: CustomTextField(),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: CustomTextField(),
          ),
        ],
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingValue,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2), // Label column width
          1: FlexColumnWidth(3), // Per serving column width
          2: FlexColumnWidth(3),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: initTableContent(),
      ),
    );
  }
}
