import 'package:exploring_localdbs/Src/Domain/Models/photos_hive_model.dart';
import 'package:exploring_localdbs/Src/Presentation/Common/app_text.dart';
import 'package:exploring_localdbs/Src/Presentation/Widgets/PhotosView/Controller/photos_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PhotosViewScreen extends StatefulWidget {
  const PhotosViewScreen({super.key});

  @override
  State<PhotosViewScreen> createState() => _PhotosViewScreenState();
}

class _PhotosViewScreenState extends State<PhotosViewScreen> {
  PhotosViewController photosController = PhotosViewController();
  ValueNotifier<String> selectedVal = ValueNotifier('sqlite');

  @override
  void initState() {
    photosController.getData(fromWhere: 'sqlite');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: selectedVal,
              builder: (context, value, child) => DropdownButton(
                value: value,
                items: const [
                  DropdownMenuItem(
                      value: 'hive',
                      child: Apptext(text: 'Hive', style: TextStyle())),
                  DropdownMenuItem(
                      value: 'sqlite',
                      child: Apptext(text: 'Sqlite', style: TextStyle())),
                  DropdownMenuItem(
                      value: 'isar',
                      child: Apptext(text: 'Isar', style: TextStyle())),
                ],
                onChanged: (v) {
                  if (v != null && v.isNotEmpty) {
                    selectedVal.value = v;
                    photosController.clearPreviousData();
                    photosController.getData(fromWhere: v);
                  }
                },
              ),
            ),
            ValueListenableBuilder(
                valueListenable: photosController.photosData,
                builder: (context, value, child) {
                  print("Builder building");
                  return Expanded(
                    child: value.isNotEmpty
                        ? SfCartesianChart(
                            primaryXAxis: const DateTimeAxis(interval: 1),
                            series: <CartesianSeries>[
                                // Renders line chart
                                LineSeries<PhotosHiveModel, DateTime>(
                                  dataSource: value,
                                  xValueMapper: (PhotosHiveModel v, _) =>
                                      DateTime.now().add(Duration(days: v.id!)),
                                  yValueMapper: (PhotosHiveModel v, _) =>
                                      v.albumId,
                                )
                              ])
                        : const Center(child: CircularProgressIndicator()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
