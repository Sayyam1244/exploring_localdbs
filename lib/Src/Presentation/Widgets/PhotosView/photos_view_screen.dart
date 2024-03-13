import 'package:exploring_localdbs/Src/Presentation/Widgets/PhotosView/Controller/photos_view_controller.dart';
import 'package:flutter/material.dart';

class PhotosViewScreen extends StatefulWidget {
  const PhotosViewScreen({super.key});

  @override
  State<PhotosViewScreen> createState() => _PhotosViewScreenState();
}

class _PhotosViewScreenState extends State<PhotosViewScreen> {
  PhotosViewController photosController = PhotosViewController();

  @override
  void initState() {
    photosController.getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                // controller: tabController,
                tabs: [
                  Tab(text: 'HIVE'),
                  Tab(text: 'SQLITE'),
                  Tab(text: 'ISAR'),
                  Tab(text: 'DRIFT'),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  ValueListenableBuilder(
                      valueListenable: photosController.hivePhotosData,
                      builder: (context, value, child) {
                        return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: ListTile(
                              tileColor: Colors.deepPurpleAccent.shade100,
                              leading: Text(value[index].id.toString()),
                              title: Text(value[index].title ?? ''),
                            ),
                          ),
                        );
                      }),
                  Text('SQLITE'),
                  Text('ISAR'),
                  Text('DRIFT'),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
