import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final String tableTitle;
  final Widget? widget;

  const DataTableWidget({
    super.key,
    required this.columns,
    required this.rows,
    this.tableTitle = '',
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
      return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tableTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
              widget??const SizedBox.shrink(),
              DataTable(
                columns: columns,
                rows: rows,
                headingRowHeight: 30,
                dataRowMaxHeight: 30,
                dataRowMinHeight: 30,
                border: const TableBorder(
                  verticalInside: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey)
                ),
              ),
            ],
          ),
      );
  }
}
