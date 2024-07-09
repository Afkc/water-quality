import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/model/quality_model.dart';
import '../controllers/ph_controller.dart';

class PhView extends GetView<PhController> {
  const PhView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shrimp Farm Condition'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: controller.qualityJson(),
            builder: (context, data) {
              if (data.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.hasError) {
                return Text('Error: ${data.error}');
              } else {
                List<Quality> quality = data.data!;
                return PaginatedDataTable(
                  columns: const [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('Temp')),
                    DataColumn(label: Text('Turbidity')),
                    DataColumn(label: Text('pH')),
                    DataColumn(label: Text('Water')),
                  ],
                  source: DataSource(quality),
                  rowsPerPage: 15,
                );
              }
            }),
      ),
    );
  }
}

class DataSource extends DataTableSource {
  final List<Quality> quality;
  final controller = Get.put(PhController());
  DataSource(this.quality);
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final _quality = quality[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${_quality.no}')),
      DataCell(Text('${_quality.tanggal}')),
      DataCell(
        Text('${_quality.jamWaktu}'),
      ),
      DataCell(
        Text(controller.convertToEnglish(_quality.kualitasTemperatur!)),
      ),
      DataCell(
        Text(controller.convertToEnglish(_quality.kualitasKekeruhan!)),
      ),
      DataCell(
        Text(
          controller.convertToEnglish(_quality.kualitasPh!),
        ),
      ),
      DataCell(
        Text(controller.convertToEnglish(_quality.kualitasAir!)),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => quality.length;

  @override
  int get selectedRowCount => _selectedCount;
}
