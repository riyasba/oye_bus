import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Checkbox ListView Example'),
        ),
        body: CheckboxListView(),
      ),
    );
  }
}

class ListItemModel {
  final ValueNotifier<bool> isSelected;
  final String title;
  final String subtitle;
  final String time;

  ListItemModel({
    required bool isSelected,
    required this.title,
    required this.subtitle,
    required this.time,
  }) : this.isSelected = ValueNotifier<bool>(isSelected);
}

class CheckboxListView extends StatefulWidget {
  @override
  _CheckboxListViewState createState() => _CheckboxListViewState();
}

class _CheckboxListViewState extends State<CheckboxListView> {
  late final List<ListItemModel> dummyData;

  @override
  void initState() {
    super.initState();
    dummyData = List.generate(
      10,
      (index) => ListItemModel(
        isSelected: false,
        title: 'Item ${index + 1}',
        subtitle: 'Description for Item ${index + 1}',
        time: '12:00 PM',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        ListItemModel item = dummyData[index];

        return Card(
          child: ListTile(
            leading: ValueListenableBuilder<bool>(
              valueListenable: item.isSelected,
              builder: (context, value, child) {
                return Checkbox(
                  value: value,
                  onChanged: (newValue) {
                    item.isSelected.value = newValue!;
                  },
                );
              },
            ),
            title: Text(
              item.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(item.subtitle),
            trailing: Text(item.time),
          ),
        );
      },
    );
  }
}
