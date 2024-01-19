import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';

class ListviewwidgetView extends GetView {
  ListviewwidgetView({Key? key}) : super(key: key);

  final List<ListItemModel> dummyData = [
    ListItemModel(
      isSelected: false,
      title: 'Tambaram',
      subtitle: '''Infront of Valluvar Gurukulam school 
towards chrompet''',
      time: '10:00 AM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'Task 2',
      subtitle: 'Description for Task 2',
      time: '12:00 PM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'Your Next Location',
      subtitle: 'Description of the next location',
      time: '12:30 PM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'Another Location',
      subtitle: 'Description of another location',
      time: '3:45 PM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'Central Park',
      subtitle: 'Manhattan, New York City, NY',
      time: '9:00 AM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'Golden Gate Bridge',
      subtitle: 'San Francisco, CA',
      time: '11:30 AM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'Disneyland Resort',
      subtitle: 'Anaheim, CA',
      time: '2:00 PM',
    ),
    ListItemModel(
      isSelected: false,
      title: 'The White House',
      subtitle: 'Washington D.C.',
      time: '4:30 PM',
    ),
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        ListItemModel item = dummyData[index];

        return GetBuilder<BusseatmapingController>(
          builder: (_) {
            return Card(
              child: ListTile(
            leading:Checkbox(
                    value: item.isSelected,
                    checkColor: Color(0xffFFC107),
                    onChanged: (newValue) {
                      // Update the isSelected property of the corresponding item
                      // when the checkbox value changes
                      
                       controller.updateCheckbox(item, newValue);
                      
                    },
                  
            ),
                title: Text(
                  item.title,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 14.sp, color: kblack),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.subtitle,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 11.sp,
                          color: kblack),
                    ),
                  ],
                ),
                trailing: Text(
                  item.time,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w300, fontSize: 9.sp, color: kgrey),
                ),
                onTap: () {
                  // Handle onTap event
                },
              ),
            );
          }
        );
      },
    );
  }
}

class ListItemModel {
  bool isSelected;
  String title;
  String subtitle;
  String time;

  ListItemModel({
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.time,
  });
}
