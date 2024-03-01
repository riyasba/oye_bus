import 'dart:io';
import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/booking_cancellation/controllers/booking_cancellation_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share/share.dart'; 
import '../controllers/ticket_details_controller.dart';
import 'package:open_file/open_file.dart';
// import 'package:share_plus/share_plus.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {
   BookingDetail bookingDetail;
   TicketDetailsView({Key? key,required this.bookingDetail}) : super(key: key);

  final bookinghistoryController = Get.find<BookinghistoryController>();
  final passengerController = Get.find<PassengerInfoController>();
  String getActualTime(String time){
    var temptime = time.split(':');
    String actualTime = '${temptime[0]}:${temptime[1]}';

    return actualTime;
   }

  String getSeatsDetail(List<String>? seats){
    String getseatdetails = "";
     seats!.forEach((element) {
      getseatdetails = getseatdetails + "$element ";
      });
     return getseatdetails;
  }
  Future<Uint8List?> generatePDF() async {
  final pdfLib.Document pdf = pdfLib.Document();
  pdf.addPage(
    pdfLib.Page(
      build: (pdfLib.Context context) =>
         pdfLib.Center(
          child:
      pdfLib.ListView(
        children: [
          pdfLib.Padding(
           padding: pdfLib. EdgeInsets.only(left: 8,right: 8),
           child: pdfLib.Column(
            children: [
             pdfLib.Container(
              height: 532,
              width: 374,
              decoration: pdfLib.BoxDecoration(
                color: PdfColors.yellow
              ),
              child: pdfLib.Column(
                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                children: [
                  
                  pdfLib.Padding(
                    padding: pdfLib. EdgeInsets.only(left: 10,top: 10),
                    child: pdfLib.Column(
                      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                      children: [
                        pdfLib.Text(
                          bookingDetail.busData!.busName.toString(),
                        style: pdfLib.TextStyle(
                          fontSize: 20,
                          
                        
                        ),),
                        pdfLib.Text('${bookingDetail.busData!.busType} - Seat ${getSeatsDetail(bookingDetail.bookingData!.seats)}')
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,top: 15),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Column(
                          children: [
                            pdfLib.Container(
                              height: 130,
                              child: pdfLib.Column(
                                mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Column(
                                    children: [
                                      pdfLib.Text(
                                        bookingDetail.busRoute!.arrivalTime.toString()),
                                        pdfLib.Text(bookingDetail.bookingData!.dateOfJourney.toString(),
                                  style: pdfLib.TextStyle(
                                    fontSize: 10
                                  ),)
                                    ],
                                  ),
                                   pdfLib.Text(' ${bookingDetail.busRoute!.totalHours.toString()} Hr',
                                   style: pdfLib.TextStyle(
                                    fontSize: 10
                                   ),),
                                   pdfLib.Column(
                                    children: [
                                      pdfLib.Text(bookingDetail.busRoute!.departureTime.toString()),
                                      pdfLib.Text(bookingDetail.bookingData!.dateOfJourney.toString(),
                                      style: pdfLib.TextStyle(
                                        fontSize: 10
                                      ),)
                                    ],
                                   )
                                ],
                              ),
                            ),
                          ],
                        ),
                        pdfLib.Padding(
                          padding:pdfLib.EdgeInsets.only(left: 15),
                          child: pdfLib.Column(
                            children: [
                              pdfLib.Container(
                                height: 15,
                                width: 20,
                                decoration: pdfLib.BoxDecoration(
                                  color: PdfColors.black,
                                  shape: pdfLib.BoxShape.circle
                                ),
                              ),
                              pdfLib.Container(
                                height: 92,
                                width: 5,
                                decoration: pdfLib.BoxDecoration(
                                  color: PdfColors.black
                                ),
                              ),
                                 pdfLib.Container(  
                                height: 15,
                                width: 20,
                                decoration: pdfLib.BoxDecoration(
                                  color: PdfColors.black,
                                  shape: pdfLib.BoxShape.circle
                                ),
                              ),
                            ],
                          ),
                        ),
                        pdfLib.Padding(
                          padding: pdfLib.EdgeInsets.only(left: 15),
                          child: pdfLib.Column(
                            mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Container(
                                height: 130,
                                child: pdfLib.Column(
                                  mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                         pdfLib.Text('${bookingDetail.busRoute!.startLocation} ${bookingDetail.bookingData!.pickupPoint}'),
                                         pdfLib.Text('${bookingDetail.busRoute!.endLocation.toString()} ${bookingDetail.bookingData!.droppingPoint}'),
                                      
                                  ],
                                ),
                              )  
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(top: 10),
                    child: pdfLib.Container(
                      width: 374,
                      decoration: pdfLib.BoxDecoration(
                      ),
                      child: pdfLib.Text('-----------------------------------------------------------------------------------',
                      style: pdfLib.TextStyle(
                        color:PdfColors.white
                      ),),
                    ),
                  ),
                 pdfLib. Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,top: 10),
                    child: pdfLib.Text('${bookingDetail.busRoute!.arrivalTime} - ${bookingDetail.busRoute!.departureTime}',
                    style: pdfLib.TextStyle( 
                      fontSize: 15,
                    ),),
                  ), 
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(top: 2,left: 10),
                    child: pdfLib.Text(bookingDetail.bookingData!.dateOfJourney.toString(),
                    style: pdfLib.TextStyle(
                    ),),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Text('Seat Number : ${getSeatsDetail(bookingDetail.bookingData!.seats)}', 
                        style: pdfLib.TextStyle(
                        ),),
                        pdfLib.Row(
                          children: [
                            pdfLib.Text('Ticket ID : ',
                            style: pdfLib.TextStyle(
                            ),),
                            pdfLib.Text("",
                            style: pdfLib.TextStyle(     
                            ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(left: 10,top: 10,right: 10),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Text('PNR : '),
                        pdfLib.Text('5565456679',
                        style: pdfLib.TextStyle(
                        ),)
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(left: 10,right: 10),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Text('Booking ID: '),
                        pdfLib.Text(bookingDetail.bookingData!.bookingId.toString(),
                        style: pdfLib.TextStyle(  
                        ),)
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(top: 10),
                    child: pdfLib.Container(
                      width: 374,
                      decoration: pdfLib.BoxDecoration(
                      ),
                      child: pdfLib.Text('-----------------------------------------------------------------------------------',
                      style: pdfLib.TextStyle(
                        color: PdfColors.white
                      ),),
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(left: 10),
                    child: pdfLib.Container(
                      width: 200,
                      child: pdfLib.Text('${bookingDetail.busData!.busName} ${bookingDetail.busData!.busRegisterNumber}',
                      style: pdfLib.TextStyle( 
                      ),)),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(top: 10),
                    child: pdfLib.Container(
                      width: 374,
                      decoration: pdfLib.BoxDecoration(
                      ),
                      child: pdfLib.Text('-----------------------------------------------------------------------------------',
                      style: pdfLib.TextStyle(
                        color: PdfColors.white
                      ),),
                    ),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Text('TOTAL:',
                        style: pdfLib.TextStyle(
                        ),),
                        pdfLib.Text(bookingDetail.bookingData!.totalPrice.toString(),
                        style: pdfLib.TextStyle(
                        ),)
                      ],
                    ),
                  )
                ],
              ),
             )
            ],
           ),
         )
            ]
      ),
        )
    )
        );
        Directory root = await getTemporaryDirectory(); 
        final file= File('${root.path}/busticket.pdf');
        await file.writeAsBytes(await pdf.save());
        print("------------------------>>");
        print(file.path);
       //DownloadFile.downloadAndSafeFile(downloadFileOptions: DownloadFileOptions(), context: context)
        OpenFile.open(file.path);
      
        
//       List<XFile> fileList = [XFile(file.path)];
// Share.shareXFiles(fileList);
        

  
}


  Future<Uint8List?> sharePdfgeneration() async {
  final pdfLib.Document pdf = pdfLib.Document();
  pdf.addPage(
    pdfLib.Page(
      build: (pdfLib.Context context) =>
         pdfLib.Center(
          child:
      pdfLib.ListView(
        children: [
          pdfLib.Padding(
           padding: pdfLib. EdgeInsets.only(left: 8,right: 8),
           child: pdfLib.Column(
            children: [
             pdfLib.Container(
              height: 532.h,
              width: 374.w,
              decoration: pdfLib.BoxDecoration(
                color: PdfColors.yellow
              ),
              child: pdfLib.Column(
                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                children: [
                  pdfLib.Padding(
                    padding: pdfLib. EdgeInsets.only(left: 10,top: 10),
                    child: pdfLib.Column(
                      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                      children: [
                        pdfLib.Text(bookingDetail.busData!.busName.toString(),
                        style: pdfLib.TextStyle(
                          fontSize: 20.sp,
                        ),),
                        pdfLib.Text('${bookingDetail.busData!.busType} / ${bookingDetail.bookingData!.seats}')
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,top: 15),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Column(
                          children: [
                            pdfLib.Container(
                              height: 130.h,
                              child: pdfLib.Column(
                                mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Column(
                                    children: [
                                      pdfLib.Text(bookingDetail.busRoute!.startLocation.toString()),
                                        pdfLib.Text(bookingDetail.bookingData!.dateOfJourney.toString(),
                                  style: pdfLib.TextStyle(
                                    fontSize: 10.sp
                                  ),)
                                    ],
                                  ),
                                   pdfLib.Text('${bookingDetail.busRoute!.totalHours}Hours',
                                   style: pdfLib.TextStyle(
                                    fontSize: 10.sp
                                   ),),
                                   pdfLib.Column(
                                    children: [
                                      pdfLib.Text(bookingDetail.bookingData!.boardingTime.toString()),
                                      pdfLib.Text(bookingDetail.bookingData!.dateOfJourney.toString(),
                                      style: pdfLib.TextStyle(
                                        fontSize: 10.sp
                                      ),)
                                    ],
                                   )
                                ],
                              ),
                            ),
                          ],
                        ),
                        pdfLib.Padding(
                          padding:pdfLib.EdgeInsets.only(left: 15),
                          child: pdfLib.Column(
                            children: [
                              pdfLib.Container(
                                height: 15.h,
                                width: 20.w,
                                decoration: pdfLib.BoxDecoration(
                                  color: PdfColors.black,
                                  shape: pdfLib.BoxShape.circle
                                ),
                              ),
                              pdfLib.Container(
                                height: 92.h,
                                width: 5.w,
                                decoration: pdfLib.BoxDecoration(
                                  color: PdfColors.black
                                ),
                              ),
                                 pdfLib.Container(
                                height: 15.h,
                                width: 20.w,
                                decoration: pdfLib.BoxDecoration(
                                  color: PdfColors.black,
                                  shape: pdfLib.BoxShape.circle
                                ),
                              ),
                            ],
                          ),
                        ),
                        pdfLib.Padding(
                          padding: pdfLib.EdgeInsets.only(left: 15),
                          child: pdfLib.Column(
                            mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Container(
                                height: 130.h,
                                child: pdfLib.Column(
                                  mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Text('${bookingDetail.busRoute!.startLocation} ${bookingDetail.bookingData!.pickupPoint}'),
                                    pdfLib.Text('${bookingDetail.busRoute!.endLocation} ${bookingDetail.bookingData!.droppingPoint}')
                                  ],
                                ),
                              )        
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(top: 10),
                    child: pdfLib.Container(
                      width: 374.w,
                      decoration: pdfLib.BoxDecoration(
                      ),
                      child: pdfLib.Text('-----------------------------------------------------------------------------------',
                      style: pdfLib.TextStyle(
                        color:PdfColors.white
                      ),),
                    ),
                  ),
                 pdfLib. Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,top: 10),
                    child: pdfLib.Text('${bookingDetail.bookingData!.boardingTime} - ${bookingDetail.bookingData!.droppingTime}',
                    style: pdfLib.TextStyle(
                      fontSize: 15.sp,
                    ),),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(top: 2,left: 10),
                    child: pdfLib.Text(bookingDetail.bookingData!.dateOfJourney.toString(),
                    style: pdfLib.TextStyle(
                    ),),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Text('Seat Number : ${bookingDetail.bookingData!.seats}', 
                        style: pdfLib.TextStyle(
                        ),),
                        pdfLib.Row(
                          children: [
                            pdfLib.Text('Ticket ID : ',
                            style: pdfLib.TextStyle(
                            ),),
                            pdfLib.Text('',
                            style: pdfLib.TextStyle(
                            ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(left: 10,top: 10,right: 10),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Text('PNR : '),
                        pdfLib.Text('5565456679',
                        style: pdfLib.TextStyle(
                        ),)
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(left: 10,right: 10),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Text('Booking ID: '),
                        pdfLib.Text(bookingDetail.bookingData!.bookingId.toString() ,
                        style: pdfLib.TextStyle(  
                        ),)
                      ],
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(top: 10),
                    child: pdfLib.Container(
                      width: 374.w,
                      decoration: pdfLib.BoxDecoration(
                        
                      ),
                      child: pdfLib.Text('-----------------------------------------------------------------------------------',
                      style: pdfLib.TextStyle(
                        color: PdfColors.white
                      ),),
                    ),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(left: 10),
                    child: pdfLib.Container(
                      width: 200.w,
                      child: pdfLib.Text('${bookingDetail.busData!.busName} ${bookingDetail.busData!.busRegisterNumber}',
                      style: pdfLib.TextStyle(
                      ),)),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(top: 10),
                    child: pdfLib.Container(
                      width: 374.w,
                      decoration: pdfLib.BoxDecoration(
                      ),
                      child: pdfLib.Text('-----------------------------------------------------------------------------------',
                      style: pdfLib.TextStyle(
                        color: PdfColors.white
                      ),),
                    ),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Text('TOTAL:',
                        style: pdfLib.TextStyle(),),
                        pdfLib.Text(bookingDetail.bookingData!.totalPrice.toString(),
                        style: pdfLib.TextStyle(
                        ),)
                      ],
                    ),
                  )
                ],
              ),
             )
            ],
           ),
         )
            ]
      ),
        )
    )
        );


        Directory root = await getTemporaryDirectory(); 
        
        final file= File('${root.path}/busticket.pdf');
        await file.writeAsBytes(await pdf.save());
        print("------------------------>>");
        print(file.path);
        Share.share(file.path);
        
//       List<XFile> fileList = [XFile(file.path)];
// Share.shareXFiles(fileList);
        

  
}


  @override
  Widget build(BuildContext context) {
    
         final bookingHistoryController = Get.find<BookinghistoryController>();
    return Scaffold(
     
      
       
      body: ListView(
        children: [
         Padding(
           padding: const EdgeInsets.only(left: 0,right: 0),
          child: Stack(
            children:[ 
              Expanded(
                flex: 1,
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                color: kred,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5,left: 3,right: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back,
                            color: kwhite,)),
                          Text('Your Ticket Details',
                            style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kwhite
                                  ),), 
                                  SvgPicture.asset('assets/home_pagebell_icons.svg',
                                  color: kwhite,)
                      
                        ],
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
            Expanded(
              child: Positioned(
                child: Container(
                height: 500,
                color: kwhite,
              )),
            )
            ]
          ),
          //  child: GetBuilder<BookinghistoryController>(
          //    builder: (_) {
          //      return Column(
          //       children: [
          //        Container(
          //         height: 532.h,
          //         width: 374.w,
          //         decoration: const BoxDecoration(
          //           color: Color(0xffFFD400)
          //         ),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             ksizedbox10,
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(bookingDetail.busData!.busName.toString(),
          //                   style: TextStyle(
          //                     fontSize: 20.sp,
          //                     fontWeight: FontWeight.w500
          //                   ),),
          //                   Text('${bookingDetail.busData!.busType} - Seats ${getSeatsDetail(bookingDetail.bookingData!.seats)}')
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10,top: 15),
          //               child: Row(
          //                 children: [
          //                   Column(
          //                     children: [
          //                       Container(
          //                         height: 130.h,
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: [
          //                             Column(
          //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(bookingDetail.busRoute!.arrivalTime.toString()),
          //                                   Text(
          //                                     bookingDetail.bookingData!.dateOfJourney.toString(), 
                                           
          //                             style: TextStyle(
          //                               fontSize: 10.sp
          //                             ),)
          //                               ],
          //                             ),
          //                              Text('${bookingDetail.busRoute!.totalHours.toString()} hours',
          //                              style: TextStyle(
          //                               fontSize: 10.sp
          //                              ),),
          //                              Column(
          //                               crossAxisAlignment: CrossAxisAlignment.start,
          //                               children: [
          //                                 Text(bookingDetail.busRoute!.departureTime.toString()),
          //                                 Text(bookingDetail.bookingData!.dateOfJourney.toString(),
          //                                 style: TextStyle(
          //                                   fontSize: 10.sp
          //                                 ),)
          //                               ],
          //                              )
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.only(left: 15),
          //                     child: Column(
          //                       children: [
          //                         Container(
          //                           height: 15.h,
          //                           width: 20.w,
          //                           decoration: const BoxDecoration(
          //                             color: Colors.black,
          //                             shape: BoxShape.circle
          //                           ),
          //                         ),
          //                         Container(
          //                           height: 92.h,
          //                           width: 5.w,
          //                           decoration: const BoxDecoration(
          //                             color: Colors.black
          //                           ),
          //                         ),
          //                            Container(
          //                           height: 15.h,
          //                           width: 20.w,
          //                           decoration: const BoxDecoration(
          //                             color: Colors.black,
          //                             shape: BoxShape.circle
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.only(left: 15),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Container(
          //                           height: 130.h,
          //                           child: Column(
          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [

          //                                    Text('${bookingDetail.busRoute!.startLocation}\n${bookingDetail.bookingData!.pickupPoint}'),
          //                                    Text('${bookingDetail.busRoute!.endLocation} \n${bookingDetail.bookingData!.droppingPoint}')
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             ksizedbox10,
          //             Container(
          //               width: 374.w,
          //               decoration: BoxDecoration(
          //               ),
          //               child: Text('-----------------------------------------------------------------------------------',
          //               style: TextStyle(
          //                 color: kwhite
          //               ),),
          //             ),
          //             ksizedbox10,
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10),
          //               child: Text('${bookingDetail.bookingData!.boardingTime} - ${bookingDetail.bookingData!.droppingTime}',
          //               style: TextStyle(
          //                 fontSize: 15.sp,
          //                 fontWeight: FontWeight.w600
          //               ),),
          //             ),
          //              Padding(
          //               padding: EdgeInsets.only(top: 2,left: 10),
          //               child: Text(
          //                 bookingDetail.bookingData!.dateOfJourney.toString()
          //                 ,
          //                 //'10 Nov 2023, Saturday',
          //               style: TextStyle(
          //               ),),
          //             ),
          //             ksizedbox10,
          //              Padding(
          //               padding: EdgeInsets.only(left: 10,right: 10),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text('Seat Number : ${getSeatsDetail(bookingDetail.bookingData!.seats)}',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w700
          //                   ),),
          //                   Row(
          //                     children: [
          //                       Text('Ticket ID : ',
          //                       style: TextStyle(),),
          //                       Text('LA345678',
          //                       style: TextStyle(
          //                         fontWeight: FontWeight.w700
          //                       ),
          //                       )
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ),
          //             ksizedbox10,
          //             const Padding(
          //               padding: EdgeInsets.only(left: 10,top: 0,right: 10),
          //               child: Row(
          //                 children: [
          //                   Text('PNR : '),
          //                   Text('5565456679',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w600
          //                   ),)
          //                 ],
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10,right: 10),
          //               child: Row(
          //                 children: [
          //                   Text('Booking ID: '),
          //                   Text(bookingDetail.bookingData!.bookingId.toString(),
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.w600
          //                   ),)
          //                 ],
          //               ),
          //             ),
          //             ksizedbox10,
          //             Container(
          //               width: 374.w,
          //               decoration: BoxDecoration(
          //               ),
          //               child: Text('-----------------------------------------------------------------------------------',
          //               style: TextStyle(
          //                 color: kwhite
          //               ),),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10),
          //               child: Container(
          //                 width: 200.w,
          //                 child: Text('${bookingDetail.busData!.busName}  ${bookingDetail.busData!.busRegisterNumber}',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.w700
          //                 ),)),
          //             ),
          //                ksizedbox10,
          //             Container(
          //               width: 374.w,
          //               decoration: BoxDecoration( 
          //               ),
          //               child: Text('-----------------------------------------------------------------------------------',
          //               style: TextStyle(
          //                 color: kwhite
          //               ),),
          //             ),
          //             ksizedbox20,
          //             Padding(
          //               padding: const EdgeInsets.only(left: 10,right: 10),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text('TOTAL:',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w700
          //                   ),),
          //                   Text('₹ ${bookingDetail.busRoute!.price}',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w700
          //                   ),)
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //        ),
          //        ksizedbox10,
          //        Container(
          //         width: 374.w,
          //        child: Column(
          //          children: [
          //            Text('Bus information will be shared on the following number on the day trip of journey.',
          //            style: TextStyle(
          //             height: 1.5.h,
          //             fontFamily: 'Proxima '
          //            ),),   
          //          ],
          //        ),),
          //        ksizedbox20,
          //        Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           GestureDetector(
          //               onTap: (){
          //               sharePdfgeneration();
          //               },
          //             child: Image.asset('assets/offers_icon/shareicon.png')),
          //           GestureDetector(
          //             onTap: (){
          //             generatePDF();
          //             },
          //             child: Image.asset('assets/offers_icon/downloadicon.png')),
          //           GestureDetector(
          //             onTap: (){
          //                final bookingcancelController = Get.find<TicketDetailsController>().
          //                bookingCancellation(bookingid:bookingHistoryController.bookinghistorydata!.isNotEmpty?
          //                 bookingHistoryController.bookinghistorydata!.first.bookingData!.bookingId.toString():'');
          //                 final bookinghistoryController = Get.find<BookinghistoryController>().bookinghistory(); 
          //             },
          //             child: Image.asset('assets/offers_icon/cancelicon.png'))
          //         ],
          //        ), 
          //        ksizedbox10,
          //        Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Text('Share'),
          //           Text('Download'),
          //           Text('Cancel')
          //         ],
          //        ),
          //        ksizedbox10
          //       ],
          //      );
          //    }
          //  ),
         )
        ],
      ),
    );
  }

  
}

