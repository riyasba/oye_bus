
import 'dart:io';
import 'dart:typed_data';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';
import 'package:oye_bus/app/data/api_service/models/profile/profile_model.dart';
import 'package:oye_bus/app/modules/home/controllers/home_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/controllers/busseatmaping_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
import 'package:oye_bus/app/modules/screens/profile/controllers/profile_controller.dart';
import 'package:oye_bus/app/modules/screens/settingsscreens/copassengers/controllers/copassengers_controller.dart';
import 'package:oye_bus/app/modules/screens/ticket_details/controllers/ticket_details_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share/share.dart'; 
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

class NewTicketView extends StatefulWidget {
   BookingDetail bookingDetail;
 
   NewTicketView({super.key,required this.bookingDetail});

  @override
  State<NewTicketView> createState() => _NewTicketViewState();
}

 
class _NewTicketViewState extends State<NewTicketView> {

  final passengerController = Get.find<PassengerInfoController>();
    final bookingHistoryController = Get.find<BookinghistoryController>();
    final profileController = Get.find<ProfileController>();
    final homeController = Get.find<HomeController>();
     final copassangersController = Get.find<CopassengersController>();
     final whybookingbusController = Get.find<BusseatmapingController>();
    
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
          child:pdfLib.Stack(
        children: [
         pdfLib.Column(
            children: [
              pdfLib.Expanded(
                flex: 1,
                child: pdfLib.Container(
                  color: PdfColors.red,
                
                ),
              ),
              pdfLib. Expanded(
                flex: 2,
                 child: pdfLib.Container(
                  color: PdfColors.white,
                 
                           ),
               ),
               
            ],
          ),
         pdfLib.Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: pdfLib.Padding(
              padding: pdfLib. EdgeInsets.symmetric(horizontal: 20),
              child: pdfLib.Container(
                height: 470,
              
                decoration:  pdfLib.BoxDecoration(
                  color: PdfColors.white,
               
                  borderRadius: pdfLib.BorderRadius.circular(20)
                ),
               child: pdfLib.Padding(
                 padding: pdfLib.EdgeInsets.only(top: 5,),
                 child: pdfLib.Column(
                  children: [
                    pdfLib.Text(widget.bookingDetail.busData!.busName.toString(),
                     style: pdfLib.TextStyle(
                                fontSize: 20.sp,
                                fontWeight: pdfLib.FontWeight.bold
                              )),
                    pdfLib.Text('${widget.bookingDetail.busData!.busType} - ${getSeatsDetail(widget.bookingDetail.bookingData!.seats)}'),
                   pdfLib.SizedBox(
                    height: 20,
                   ),
                    pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text(widget.bookingDetail.busRoute!.startLocation.toString(),
                              style: pdfLib.TextStyle(
                                fontSize: 16.5,
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(widget.bookingDetail.bookingData!.pickupPoint.toString(),
                              ),
                              pdfLib.Text('${getActualTime(widget.bookingDetail.busRoute!.departureTime)} ${widget.bookingDetail.bookingData!.dateOfJourney}',
                              style: pdfLib.TextStyle(
                                fontSize: 12
                              ),)
                            ],
                          ),
                          
                          pdfLib.Padding(
                            padding:  pdfLib.EdgeInsets.only(bottom: 8),
                            child: pdfLib.Column(
                              children: [
                                pdfLib.Text(widget.bookingDetail.busRoute!.totalHours.toString()),
                                pdfLib.Row(
                                                      
                                  children: [
                                    pdfLib.Container(
                                      height: 13,
                                      width: 13,
                                      decoration: pdfLib.BoxDecoration(
                                        shape: pdfLib.BoxShape.circle,
                                        color: PdfColors.red
                                      ),
                                    ),
                                    pdfLib.Container(
                                                              height: 2,
                                                              width: 90,
                                                              decoration: pdfLib.BoxDecoration(
                                    color: PdfColors.red
                                                              ),
                                                            ),
                                                            pdfLib.Container(
                                      height: 13,
                                      width: 13,
                                      decoration: pdfLib.BoxDecoration(
                                        border: pdfLib.Border.all(
                                          color: PdfColors.red,
                                          width: 1.5
                                        ),
                                        shape: pdfLib.BoxShape.circle,
                                    
                                      ),
                                    ),
                                                      
                                  ],
                                ),
                              ],
                            ),
                          ),
                          pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text(widget.bookingDetail.busRoute!.endLocation.toString(),
                              style: pdfLib.TextStyle(
                                fontSize: 16.5,
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(widget.bookingDetail.bookingData!.droppingPoint.toString()),
                              pdfLib.Text('${getActualTime(widget.bookingDetail.busRoute!.arrivalTime)}  ${widget.bookingDetail.bookingData!.dateOfJourney}',
                              style: pdfLib.TextStyle(
                                fontSize: 12
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  pdfLib.SizedBox(
                    height: 20,
                  ),
                    pdfLib.Padding(
                      padding:  pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Text('-----------------'),
                          pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text("${getActualTime(widget.bookingDetail.busRoute!.departureTime)} - ${getActualTime(widget.bookingDetail.busRoute!.arrivalTime)}",
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(widget.bookingDetail.bookingData!.dateOfJourney.toString(),
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),)
                            ],
                          ),
                               pdfLib.Text('-----------------'),
                        ],
                      ),
                    ),
                   pdfLib.SizedBox(
                    height: 20,
                   ),
                    pdfLib.Padding(
                      padding:  pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text('Seat Number :',
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(getSeatsDetail(widget.bookingDetail.bookingData!.seats),
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),)
                            ],
                          ),
                             pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text('Ticket ID :',
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text('',
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                    pdfLib.Padding(
                      padding:pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Container(
                      //  width: size.width,
                        child: pdfLib.Text('--------------------------------------------------------------------------',
                        style: pdfLib.TextStyle(
                          color:PdfColors.grey
                        ),)),
                    ),
                     pdfLib.SizedBox(
                      height: 10,
                     ),
                    pdfLib.Padding(
                      padding:  pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text('PNR Number :',
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(widget.bookingDetail.bookingData!.pnrNumber,
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),)
                            ],
                          ),
                             pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text('Booking ID :',
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(widget.bookingDetail.bookingData!.bookingId.toString(),
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),)
                            ],
                          )
                        ],
                      ),
                    ),
                      pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Container(
                       //width: size.wid,
                        child: pdfLib.Text('--------------------------------------------------------------------------',
                        style: pdfLib.TextStyle(
                          color: PdfColors.grey
                        ),)),
                    ),
                       pdfLib.SizedBox(
                        height: 10,
                       ),
                    pdfLib.Padding(
                      padding:pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Column(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              pdfLib.Text(widget.bookingDetail.busData!.busName.toString(),
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text(widget.bookingDetail.busData!.busRegisterNumber.toString(),
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),)
                            ],
                          ),
                            
                        ],
                      ),
                    ),
                     pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Container(
                       //width: size.width,
                        child: pdfLib.Text('--------------------------------------------------------------------------',
                        style: pdfLib.TextStyle(
                          color: PdfColors.grey
                        ),)),
                    ),
                   pdfLib.SizedBox(
                    height: 10,
                   ),
                    pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 7,right: 7),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Text('TOTAL: ',
                          style: pdfLib.TextStyle(
                            fontWeight: pdfLib.FontWeight.bold
                          ),),
                          pdfLib.Text(widget.bookingDetail.bookingData!.totalPrice.toString(),
                          style: pdfLib.TextStyle(
                            fontWeight: pdfLib.FontWeight.bold,
                          ),)
                        ],
                      ),
                    )
                  ],
                 ),
               ),
              ),
            ),
          ),
          pdfLib.Positioned(
            top: 50,

            child: pdfLib.Container(
            
              child: pdfLib.Padding(
                padding:pdfLib.EdgeInsets.only(left: 6,right: 6),
                child: pdfLib.Row(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                children: [
                  // pdfLib.InkWell(
                  //   onTap: (){
                  //     Get.back();
                  //   },
                  //   child: Icon(Icons.arrow_back,
                  //   color: kwhite,),
                  // ),
                  pdfLib.Text('Your Ticket Details',
                   style: pdfLib.TextStyle( 
                                        fontSize: 18.sp,
                                        fontWeight: pdfLib.FontWeight.bold,
                                        color: PdfColors.white
                                      ),),
                                      // pdfLib.SvgPicture.asset('assets/home_page/bell_icons.svg',
                                      // color: kwhite,)
                ],
                          ),
              ),
            ))
        ],
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
    pdfLib.MultiPage(
      build: ( pdfLib.Context context){ 
      return [ pdfLib.Column(
            children: [
              pdfLib.Container(
                height: 160,
                 //width:pdfLib. size.width,
                decoration: pdfLib.BoxDecoration(
                  color: PdfColors.red
                ),
                child: pdfLib.Column(
                 
                  mainAxisAlignment: pdfLib.MainAxisAlignment.center,
                  children: [
                    pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                   child:pdfLib.Row(
                      children: [
                      
                        pdfLib.Column(
                          crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                          children: [
                            pdfLib.Text('OyeBus Ticket Information',
                            style: pdfLib.TextStyle(
                              color: PdfColors.white,
                              fontSize: 16.8,
                              fontWeight: pdfLib.FontWeight.bold
                            ),),
                            pdfLib.Text('${widget.bookingDetail.busRoute!.startLocation} - ${widget.bookingDetail.busRoute!.endLocation} on ${widget.bookingDetail.bookingData!.dateOfJourney}',
                            style: pdfLib.TextStyle(
                              color: PdfColors.white
                            ),),
                            
                          ],
                        )
                      ],
                    ),
                    ),
                    pdfLib.SizedBox(
                      height: 7,
                    ),
                    pdfLib.Container(
                      height: 1,
                     // width: size.width,
                      decoration: pdfLib.BoxDecoration(
                        color: PdfColors.white
                      ),
                    ),
                    pdfLib.SizedBox(
                      height: 10,
                    ),
                    pdfLib.Row(
                      children: [
                        pdfLib.Text('Ticket Number : 1234567',
                        style: pdfLib.TextStyle(
                          color: PdfColors.white
                        ),),
                        pdfLib.Padding(
                          padding:pdfLib.EdgeInsets.only(left: 5),
                          child: pdfLib.Text('|',
                          style: pdfLib.TextStyle(
                            color: PdfColors.white
                          ),),
                        ),
                        pdfLib.Padding(
                          padding:pdfLib.EdgeInsets.only(left: 5),
                          child: pdfLib.Text('PNR NO : ${widget.bookingDetail.bookingData!.pnrNumber}',
                          style: pdfLib.TextStyle(
                            color: PdfColors.white
                          ),),
                        )
                      ],
                    )
                    
                  ],
                ),
              ),
              pdfLib.SizedBox(
                height: 20
              ),
              pdfLib.Row(
                children: [
                  pdfLib.Text('Hey ${profileController.profiledata.first.name},',
                  ),
                ],
              ),
               pdfLib.SizedBox(
                height: 10
              ),
              pdfLib.Text('Thank you for booking your bus ticket with Oyebus. Here are the ticket details for your upcoming trip from Coimbature to Chennai on Thursday, january 16, 2024'),
             
              pdfLib.SizedBox(
              height: 10,
              ),              
              pdfLib.Container(
                 height:600 ,
                
                decoration: pdfLib.BoxDecoration(
                  border: pdfLib.Border.all(
                    color: PdfColors.black,
                    width: 1
                  )
                  
                ),
                child: pdfLib.Column(
                  children: [
                  pdfLib.Container(
                    height: 50,
                    
                    decoration: pdfLib.BoxDecoration(
                      color: PdfColors.blueGrey100
                    ),
                    child:pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),
                    child: pdfLib.Row(
                      children: [
                        pdfLib.Text('Ticket Details',
                        style: pdfLib.TextStyle(
                          fontSize: 16,
                          fontWeight: pdfLib.FontWeight.bold
                        ),)
                      ],
                    ),
                    ),
                  ),
                  pdfLib.SizedBox(
                    height: 15,
                  ),
                  pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),
                 child: pdfLib.Column(
                    crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                    children: [
                      pdfLib.Text('Journey Date and Time'),
                      pdfLib.Padding(
                        padding:pdfLib.EdgeInsets.only(top: 5),
                        child: pdfLib.Row(
                          children: [
                            //pdfLib.Icon(Icons.calendar_month,
                            //color: PdfColors.red,),
                            pdfLib.Text('${widget.bookingDetail.bookingData!.dateOfJourney}, ${widget.bookingDetail.bookingData!.boardingTime}',
                            style: pdfLib.TextStyle(
                              fontWeight: pdfLib.FontWeight.bold
                            ),),
                          
                          ],
                        ),
                      )
          
                    ],
                 ),
                  ),
                    pdfLib.SizedBox(
                    height: 15,
                  ),
                 
                 pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),
                      child: pdfLib.Column(   
                   
                    crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                    children: [
                      pdfLib.Text('Travels'),
                      pdfLib.Padding(
                        padding:pdfLib.EdgeInsets.only(top: 5),
                        child: pdfLib.Row(
                          children: [
                            //pdfLib.Icon(Icons.bus_alert,color: PdfColors.red),
                            pdfLib.Padding(
                              padding:pdfLib.EdgeInsets.only(left: 6),
                              child: pdfLib.Column(
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Text(widget.bookingDetail.busData!.busName.toString(),
                                  style: pdfLib.TextStyle(
                                    fontWeight: pdfLib.FontWeight.bold
                                  ),),
                                  pdfLib.Text(widget.bookingDetail.busData!.busType.toString()),
                                  pdfLib.Text(widget.bookingDetail.busData!.contactNumber.toString(),
                                  style: pdfLib.TextStyle(
                                    color: PdfColors.blueAccent200,
                                    fontWeight:pdfLib. FontWeight.bold
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                         
                    
                    ],
                  ),
                 ),
                  pdfLib.SizedBox(
                    height: 15,
                  ),
                 pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),
                  child:pdfLib.Column(   
                    crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                    children: [
                      pdfLib.Text('Ticket Price'),
                      pdfLib.Padding(
                        padding:pdfLib.EdgeInsets.only(top: 5),
                        child: pdfLib.Row(
                          children: [
                            //pdfLib.Icon(Icons.bus_alert,color: PdfColors.red),
                            pdfLib.Padding(
                              padding: pdfLib.EdgeInsets.only(left: 6),
                              child: pdfLib.Column(
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Text('Rs. ${widget.bookingDetail.bookingData!.ticketPrice}',
                                  style: pdfLib.TextStyle(
                                    fontWeight: pdfLib.FontWeight.bold
                                  ),),
                                  pdfLib.Text('(inclusive of GST)'),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                 ),
                    pdfLib.SizedBox(
                    height: 15,
                  ),
                 pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),
                 child: pdfLib.Column(   
                    crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                    children: [
                      pdfLib.Text('Boarding Point'),
                     pdfLib. Padding(
                        padding: pdfLib.EdgeInsets.only(top: 5),
                        child: pdfLib.Row(
                          children: [
                            //pdfLib.Icon(Icons.location_on,color: PdfColors.red),
                            pdfLib.Padding(
                              padding: pdfLib.EdgeInsets.only(left: 6),
                              child: pdfLib.Column(
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Row(
                                    children: [
                                      pdfLib.Text(widget.bookingDetail.busRoute!.startLocation.toString(),
                                      style: pdfLib.TextStyle(
                                        fontWeight: pdfLib.FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                  pdfLib.Text(widget.bookingDetail.bookingData!.pickupPoint.toString()),
                                  pdfLib.Container(
                                    width: 260,
                                    child: pdfLib.Text('BSP Bus. C/o Guru Travels, 2nd Street Gandhipuram, Next to Cross Cut Signal,12345678')),
                                  pdfLib.Container(
                                    width: 260,
                                    child: pdfLib.Text('Landmark : BSP Bus. C/o Guru Travels, 2nd Street Gandhipuram')) ,
                                    pdfLib.Text('123456789  123456789',
                                    style: pdfLib.TextStyle(
                                      color: PdfColors.blueAccent200,
                                      fontWeight: pdfLib.FontWeight.bold
                                    ),), 
                                    pdfLib.Text('123456789  123456789',
                                    style: pdfLib.TextStyle(
                                      color: PdfColors.blueAccent200,
                                      fontWeight: pdfLib.FontWeight.bold
                                    ))                                
                                 ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                 ),
                      pdfLib.SizedBox(
                    height: 15,
                  ),
                 pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),
                 child: pdfLib.Column(   
                    crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                    children: [
                      pdfLib.Text('Dropping Point'),
                      pdfLib.Padding(
                        padding: pdfLib.EdgeInsets.only(top: 5),
                        child: pdfLib.Row(
                          children: [
                            //pdfLib.Icon(Icons.location_on,color: PdfColors.red),
                            pdfLib.Padding(
                              padding: pdfLib.EdgeInsets.only(left: 6),
                              child: pdfLib.Column(
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Row(
                                    children: [
                                      pdfLib.Text(widget.bookingDetail.busRoute!.endLocation.toString(),
                                      style: pdfLib.TextStyle(
                                        fontWeight: pdfLib.FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                  pdfLib.Text(widget.bookingDetail.bookingData!.droppingPoint.toString()),
                                  pdfLib.Text('BSP Bus. C/o Guru Travels, 2nd Street Gandhipuram, Next to Cross Cut Signal'),
                                 pdfLib.Text('DROPPING DATE & TIME:'),
                                 pdfLib.Text('17/01/2024, 06:15 AM ',
                                 style: pdfLib.TextStyle(
                                  fontWeight: pdfLib.FontWeight.bold
                                 ),)
                                                                  
                                 ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                 ),
                  pdfLib.SizedBox(
                    height: 20,
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 5),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Column(
                          children: [
                            pdfLib.Text('Passenger Details'),
                                  pdfLib.Row(
                    children: [
                      //pdfLib.Icon(Icons.person),
                      pdfLib.Column(
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Text(copassangersController.passengersdata.isNotEmpty? copassangersController.passengersdata.first.name:'',
                          style: pdfLib.TextStyle(
                            fontWeight: pdfLib.FontWeight.bold
                          ),),
                          pdfLib.Text('${copassangersController.passengersdata.isNotEmpty?copassangersController.passengersdata.first.age:''}Yrs,${copassangersController.passengersdata.isNotEmpty?copassangersController.passengersdata.first.gender:''}')
                        ],
                      )
                    ],
                  )
                          ],
                        ),
                       pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(right: 5),
                      child: pdfLib.Column(
                      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                          children: [
                            pdfLib.Padding(
                              padding:pdfLib.EdgeInsets.only(bottom: 18),
                              child: pdfLib.Text('Seat No'),
                            ),
                            pdfLib.Text(getSeatsDetail(widget.bookingDetail.bookingData!.seats),
                            style: pdfLib.TextStyle(
                              color: PdfColors.red
                            ),)
                          ],  
                        )
                       )
                      ],
                    ),
                  ),
            
          
                ]),
              ),
              pdfLib.SizedBox(
                height: 10,
              ),
              pdfLib.Container(
                  height: 380,
               
                decoration: pdfLib.BoxDecoration(
                 border: pdfLib.Border.all(
                  color: PdfColors.black,
                  width: 1
                 )
                ),
                child: pdfLib.Column(
                  children: [
                    pdfLib.Container(
                      height: 50,
                     
                      decoration: pdfLib.BoxDecoration(
                        color: PdfColors.blueGrey100
                      ),
                      child:pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                      child:pdfLib.Row(
                        children: [
                          pdfLib.Text('Date Change',
                          style: pdfLib.TextStyle(
                            fontSize: 15.8,
                            fontWeight: pdfLib.FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                    ),
                    pdfLib.SizedBox(
                      height: 8,
                    ),
                    pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                   child: pdfLib.Text('The journey date for this ticket can be changed, you can advance or postpone ticket to a different date as per your convenience.'
                    ),),
                    pdfLib.SizedBox(
                      height: 12,
                    ),
                    pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                   child: pdfLib.Row(children: 
                    [
                       pdfLib.Text('Date change time and charges for this operator is shown below.'),
                    ]),),
                    
                    pdfLib.Padding(
                      padding:pdfLib.EdgeInsets.only(left: 5,top: 15),
                      child: pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                        children: [
                          pdfLib.Text('Time',
                          style: pdfLib.TextStyle(
                            fontSize: 15.6,
                            fontWeight: pdfLib.FontWeight.bold
                          ),),
                          pdfLib.Padding(
                            padding:pdfLib.EdgeInsets.only(right: 5),
                            child: pdfLib.Text('Charges',
                             style: pdfLib.TextStyle(
                              fontSize: 15.6,
                              fontWeight: pdfLib.FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                    pdfLib.SizedBox(
                      height: 10,
                    ),
                    pdfLib.Row(
                      children: [
                        pdfLib.Container(
                          height: 62,
                          
                          decoration: pdfLib.BoxDecoration(
                            border: pdfLib.Border.all(
                              color: PdfColors.black,
                              width: 1
                            )
                          ),
                          child:pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                          child:pdfLib.Center(
                            child: pdfLib.Text(
                              'Date change allowed till 16 jan 2024 12:30:00 PM (8 hours before depature)'
                            ),
                        ),
                        ),
                        ),
                         pdfLib.Container(
                          height: 62,
                           width: 74,
                          decoration: pdfLib.BoxDecoration(
                            color: PdfColors.grey100,
                            border: pdfLib.Border.all(
                              color: PdfColors.black,
                             
                            )
                          ),
                          child: pdfLib.Center( 
                            child: pdfLib.Text('FREE',
                          style: pdfLib.TextStyle(
                            fontWeight: pdfLib.FontWeight.bold
                          ),)),
                        )
                      ],
                    ),
                    pdfLib.SizedBox(
                      height: 10,
                    ),
                    pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                   child: pdfLib.Row(
                      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                      children: [
                        pdfLib.Text('Note : ',
                        style: pdfLib.TextStyle(
                          color: PdfColors.red 
                        ),),
                        pdfLib.Column(
                          children: [
                            pdfLib.Text('Rescheduling a ticket can be availed only per \nbooking, if applicabel. Once the travel date \nchange option is availed,the ticket cannot be \nfurther cancelled.'),
                          ],
                        )
                      ],
                    ),
                    ),
                    pdfLib.SizedBox(
                      height: 30,
                    ),
                    pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                    child:pdfLib.Row(children: [
                         pdfLib.Column(
                      
                      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                      children: [
                        pdfLib.Text('How to Change the journey date of your ticket in Oyebus app',
                        style: pdfLib.TextStyle(
                          fontWeight: pdfLib.FontWeight.bold
                        ),),
                        pdfLib.SizedBox(
                          height: 5,
                        ),
                         pdfLib.Text('Go to my bookings, choose the journey & change date')
                      ],
                    ),
                    ]),
                    ),
                   
                   
                    pdfLib.SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
                 pdfLib.SizedBox(
                height: 30,
              ),
              pdfLib.Column(
                children: [
                  pdfLib.Container(
                     height: 450,
                    
                    decoration: pdfLib.BoxDecoration(
                      border: pdfLib.Border.all(
                        color: PdfColors.black,
                        width: 1
                      )
                    ),
                    child: pdfLib.Column(
                      children: [
                        pdfLib.Container(
                          height: 50,
                          //width: size.width,
                          decoration: pdfLib.BoxDecoration(
                            color: PdfColors.blueGrey100
                          ),
                          child:pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),child: pdfLib.Row(
                            children: [
                              pdfLib.Text('Cancellation policy',
                                style: pdfLib.TextStyle(
                            fontSize: 15.8,
                            fontWeight: pdfLib.FontWeight.bold
                          ),), 
                            ],
                          ),
                          ),
                        ),
                        pdfLib.SizedBox(
                          height: 15
                        ),
                        pdfLib.Text(
                          'Our current cancellation charges according to the cancellation policy is highlighted below'
                        ),
                        pdfLib.Padding(
                          padding:pdfLib.EdgeInsets.only(top: 15,left: 5,right: 5),
                          child: pdfLib.Row(
                            mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                            children: [
                             pdfLib.Text('Cancellation time',
                              style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
                               pdfLib.Text('Cancellation charges',
                                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
                          
                            ],
                          ),
                        ),
                        pdfLib.SizedBox(height: 10),
                        pdfLib.Row(children: [
                          pdfLib.Container(
                              height: 150,
                              width: 331,
                              decoration: pdfLib.BoxDecoration(
                                border: pdfLib.Border.all(
                                  color: PdfColors.black,
                                  width: 1
                                )
                              ),
                              child: pdfLib.Column(
                          
                                crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                children: [
                                  pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                 child: pdfLib.Text('Before 15th Jan 09:00 PM')),
                                  pdfLib.Divider(),
                                  pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                   child:pdfLib.Text('After 15th Jan 09:00 PM & Before 16th Jan 09:00 AM')),
                                  pdfLib.Divider(),
                                  pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                     child: pdfLib.Text('After 16th Jan 09:00 AM & Before 16th Jan 03:00 PM')),
                                  pdfLib.Divider(),
                                   pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                     child: pdfLib.Text('After 16th Jan 03:00 PM & Before 16th Jan 09:00 PM')),
                               
                                    
                                ])
                          ),
                          pdfLib.Container(
                                  height: 150,
                                  width: 150,
                                  decoration:pdfLib.BoxDecoration(
                                    border: pdfLib.Border.all(
                                      color: PdfColors.black,
                                      width: 1
                                    )),
                                    child: pdfLib.Column(
                                     crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                      children:[
                                        pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                     child: pdfLib.Text('Rs. 164.85(15%)',
                                     style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold))),
                                  pdfLib.Divider(),
                                  pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                     child: pdfLib.Text('Rs. 329.7(30%)',
                                      style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold))),
                                  pdfLib.Divider(),
                                  pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                     child: pdfLib.Text('Rs. 329.7(30%)',
                                      style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold))),
                                  pdfLib.Divider(),
                                  pdfLib.Padding(padding: pdfLib.EdgeInsets.only(top: 5,left: 5),
                                     child: pdfLib.Text('Rs. 1099.0(100%)',
                                      style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold))),
                                 
                                    ])
                          )
                        ]),
                        pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                        child:
                        pdfLib.Row(
                          children:[
                         pdfLib.Column(
                          mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                          children: [
                            pdfLib.SizedBox(
                              height: 10
                            ),
                          pdfLib.Text('Cancellation charges are computed on per seat basis.'),
                           pdfLib.SizedBox(
                              height: 10
                            ),
                          pdfLib.Text('For Group bookings, cancellation of individual seats is not allowed.'),
                           pdfLib.SizedBox(
                              height: 10
                            ),
                          pdfLib.Text('Note: Cancellation charges mentioned above are excluding GST.')
                         ]),
                        
                          ]
                        ),
                        ),
                        pdfLib.SizedBox(
                          height: 20
                        ),
                        pdfLib.Padding(padding: pdfLib.EdgeInsets.only(left: 5),
                        child:
                        pdfLib.Row(children: [
                                pdfLib.Column(
                          crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                          children: [
                                pdfLib.Text('How to cancel your ticket on redbus app',
                        style: pdfLib.TextStyle(
                          fontWeight: pdfLib.FontWeight.bold
                        )),
                        pdfLib.SizedBox(
                          height: 10
                        ),
                        pdfLib.Text('Go to my bookings and choose the journey and cancel the ticket')
                        ])
                        ]),
                       
                        )
                      ],
                    ),
                  )
                ],
              ),
              pdfLib.SizedBox(
                height: 30,
              ),
              pdfLib.Column(
                children: [
                  pdfLib.Container(
                     height: 470,
                    
                    decoration: pdfLib.BoxDecoration(
                      border: pdfLib.Border.all(
                        color: PdfColors.black,
                        width: 1
                      )
                    ),
                    child: pdfLib.Column(
                      children: [
                        pdfLib.Container(
                          height: 50,
                          //width: size.width,
                          decoration: pdfLib.BoxDecoration(
                            color: PdfColors.blueGrey100
                          ),
                          child:pdfLib.Padding(
                      padding: pdfLib.EdgeInsets.only(left: 5),child: pdfLib.Row(
                            children: [
                              pdfLib.Text('Booking Policies',
                                style: pdfLib.TextStyle(
                            fontSize: 15.8,
                            fontWeight: pdfLib.FontWeight.bold
                          ),), 
                            ],
                          ),
                          ),
                        ),
                        pdfLib.Padding(
                          padding:pdfLib.EdgeInsets.only(top: 15),
                          child: pdfLib.Row(crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            children: [
                              //pdfLib.Icon(Icons.child_care,color: PdfColors.red,),
                              pdfLib.Padding(
                                padding:pdfLib.EdgeInsets.only(left: 8),
                                child: pdfLib.Column(
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Text('Child passenger policy',
                                    style: pdfLib.TextStyle(
                                      fontWeight: pdfLib.FontWeight.bold,
                                      fontSize: 15.5
                                    ),),
                                    pdfLib.Padding(
                                      padding:pdfLib.EdgeInsets.only(top: 6),
                                      child: pdfLib.Text(whybookingbusController.policiesdata==null?"":whybookingbusController.policiesdata!.childPolicy),
                                    ),
                                 
                                  ],
                                ),
                              ),
                          
                            ],
                          ),
                        ),
                        pdfLib.Padding(
                          padding: pdfLib.EdgeInsets.only(top: 8),
                          child: pdfLib.Divider(),
                        ),
                         pdfLib.Padding(
                           padding: pdfLib.EdgeInsets.only(top: 5),
                           child: pdfLib.Row(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                            children: [
                              //pdfLib.Icon(Icons.luggage,color: PdfColors.red,),
                              pdfLib.Padding(
                                padding:pdfLib.EdgeInsets.only(left: 6),
                                child: pdfLib.Column(
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Text('Luggage Policy',
                                    style: pdfLib.TextStyle(
                                      fontWeight: pdfLib.FontWeight.bold,
                                      fontSize: 15.5
                                    ),),
                                    pdfLib.Padding(
                                      padding:pdfLib.EdgeInsets.only(top: 6),
                                      child: pdfLib.Column(children: [
                                     pdfLib.Text(whybookingbusController.policiesdata==null?'': whybookingbusController.policiesdata!.luggagePolicy),
                                      ]),

                                    ),
                                 
                                  ],
                                ),
                              ),
                                                   
                           
                            ],
                                                   ),
                         ), 
                            pdfLib.SizedBox(
                              height: 8,
                            ),
                            pdfLib.Divider(),
                             pdfLib.Padding(
                           padding:pdfLib.EdgeInsets.only(top: 5),
                           child: pdfLib.Row(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                            children: [
                              //pdfLib.Icon(Icons.pets,color: PdfColors.red,),
                              pdfLib.Padding(
                                padding:pdfLib.EdgeInsets.only(left: 6),
                                child: pdfLib.Column(
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Text('Pets Policy',
                                    style: pdfLib.TextStyle(
                                      fontWeight: pdfLib.FontWeight.bold,
                                      fontSize: 15.5
                                    ),),
                                    pdfLib.Padding(
                                      padding:pdfLib.EdgeInsets.only(top: 6),
                                      child: pdfLib.Text('Prts are not allowed'),
                                    ),
                                 
                                  ],
                                ),
                              ), 
                            ],
                           ),
                         ), 
                            pdfLib.SizedBox(
                              height: 8,
                            ),
                            pdfLib.Divider(),
                             pdfLib.Padding(
                           padding: pdfLib.EdgeInsets.only(top: 5),
                           child: pdfLib.Row(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                            children: [
                              //pdfLib.Icon(Icons.liquor,color: PdfColors.red,),
                              pdfLib.Padding(
                                padding:pdfLib.EdgeInsets.only(left: 6),
                                child: pdfLib.Column(
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Text('Liquor Policy',
                                    style: pdfLib.TextStyle(
                                      fontWeight: pdfLib.FontWeight.bold,
                                      fontSize: 15.5
                                    ),),
                                    pdfLib.Padding(
                                      padding:pdfLib.EdgeInsets.only(top: 6),
                                      child: pdfLib.Text('Carring or consuming liqour inside the bus \nis prohibited. Bus operators reserves the right \nto deboard durnk passengers'),
                                    ),
                                 
                                  ],
                                ),
                              ),
                                                   
                           
                            ],
                                                   ),
                         ), 
                            pdfLib.SizedBox(
                              height: 8,
                            ),
                            pdfLib.Divider(),
                             pdfLib.Padding(
                           padding:pdfLib.EdgeInsets.only(top: 5),
                           child: pdfLib.Row(
                            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                            children: [
                            //  pdfLib.Icon(Icons.hail,color: PdfColors.red,),
                              pdfLib.Padding(
                                padding:pdfLib.EdgeInsets.only(left: 6),
                                child: pdfLib.Column(
                                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                                  children: [
                                    pdfLib.Text('Pick up time policy',
                                    style: pdfLib.TextStyle(
                                      fontWeight: pdfLib.FontWeight.bold,
                                      fontSize: 15.5
                                    ),),
                                    pdfLib.Padding(
                                      padding:pdfLib.EdgeInsets.only(top: 6),
                                      child: pdfLib.Text('Bus operator is not obligated to wait beyond \nthe scheduled departure time of the bus. No \nrefund request will be entertained for late \narriving passengers'),
                                    ),
                                 
                                  ],
                                ),
                              ),
                                                   
                           
                            ],
                            ),
                         ), 
                      
                      ],
                    ),
                  )
                ],
              ),
              pdfLib.SizedBox(
                height: 10,
              )
            ],
          ),
      ];
      }
    )
        );
  // pdf.addPage(

  //   pdfLib.MultiPage(
  //     build: (pdfLib.Context context) {

  //     return[
  //        pdfLib.Column(
  //           children: [
  //             pdfLib.Container(
  //               height: 160,
  //                //width:pdfLib. size.width,
  //               decoration: pdfLib.BoxDecoration(
  //                 color: PdfColors.red
  //               ),
  //               child: pdfLib.Column(
                 
  //                 mainAxisAlignment: pdfLib.MainAxisAlignment.center,
  //                 children: [
  //                   pdfLib.Row(
  //                     children: [
  //                       //Text('bus image'),
  //                       pdfLib.Column(
  //                         crossAxisAlignment: pdfLib.CrossAxisAlignment.center,
  //                         children: [
  //                           pdfLib.Text('OyeBus Ticket Information',
  //                           style: pdfLib.TextStyle(
  //                             color: PdfColors.white,
  //                             fontSize: 16.8,
  //                             fontWeight: pdfLib.FontWeight.bold
  //                           ),),
  //                           pdfLib.Text('Coimbature - Chennai on Thursday January',
  //                           style: pdfLib.TextStyle(
  //                             color: PdfColors.white
  //                           ),),
  //                           pdfLib.Text('16,2024',
  //                           style: pdfLib.TextStyle(
  //                             color: PdfColors.white
  //                           ),)
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 7,
  //                   ),
  //                   pdfLib.Container(
  //                     height: 1,
  //                    // width: size.width,
  //                     decoration: pdfLib.BoxDecoration(
  //                       color: PdfColors.white
  //                     ),
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 10,
  //                   ),
  //                   pdfLib.Row(
  //                     children: [
  //                       pdfLib.Text('Ticket Number : 1234567',
  //                       style: pdfLib.TextStyle(
  //                         color: PdfColors.white
  //                       ),),
  //                       pdfLib.Padding(
  //                         padding:pdfLib.EdgeInsets.only(left: 5),
  //                         child: pdfLib.Text('|',
  //                         style: pdfLib.TextStyle(
  //                           color: PdfColors.white
  //                         ),),
  //                       ),
  //                       pdfLib.Padding(
  //                         padding:pdfLib.EdgeInsets.only(left: 5),
  //                         child: pdfLib.Text('PNR NO : 12345678',
  //                         style: pdfLib.TextStyle(
  //                           color: PdfColors.white
  //                         ),),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //             pdfLib.Row(
  //               children: [
  //                 pdfLib.Text('Hey Anas ,',
  //                 ),
  //               ],
  //             ),
  //             pdfLib.Text('Thank you for booking your bus ticket with Oyebus. Here are the ticket details for your upcoming trip from Coimbature to Chennai on Thursday, january 16, 2024'),
             
  //             pdfLib.SizedBox(
  //             height: 10,
  //             ),              
  //             pdfLib.Container(
  //                height:500 ,
  //               width: 280,
  //               decoration: pdfLib.BoxDecoration(
  //                 border: pdfLib.Border.all(
  //                   color: PdfColors.black,
  //                   width: 1
  //                 )
                  
  //               ),
  //               child: pdfLib.Column(
  //                 children: [
  //                 pdfLib.Container(
  //                   height: 50,
  //                   width: 280,
  //                   decoration: pdfLib.BoxDecoration(
  //                     color: PdfColors.blueGrey100
  //                   ),
  //                   child: pdfLib.Row(
  //                     children: [
  //                       pdfLib.Text('Ticket Details',
  //                       style: pdfLib.TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: pdfLib.FontWeight.bold
  //                       ),)
  //                     ],
  //                   ),
  //                 ),
  //                 pdfLib.SizedBox(
  //                   height: 15,
  //                 ),
  //                 pdfLib.Column(
  //                   crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                   children: [
  //                     pdfLib.Text('Journey Date and Time'),
  //                     pdfLib.Padding(
  //                       padding:pdfLib.EdgeInsets.only(top: 5),
  //                       child: pdfLib.Row(
  //                         children: [
  //                           //pdfLib.Icon(Icons.calendar_month,
  //                           //color: PdfColors.red,),
  //                           pdfLib.Text('16/03/2024, 9:00 PM',
  //                           style: pdfLib.TextStyle(
  //                             fontWeight: pdfLib.FontWeight.bold
  //                           ),),
                          
  //                         ],
  //                       ),
  //                     )
          
  //                   ],
  //                 ),
  //                   pdfLib.SizedBox(
  //                   height: 15,
  //                 ),
                 
  //                 pdfLib.Column(   
                   
  //                   crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                   children: [
  //                     pdfLib.Text('Travels'),
  //                     pdfLib.Padding(
  //                       padding:pdfLib.EdgeInsets.only(top: 5),
  //                       child: pdfLib.Row(
  //                         children: [
  //                           //pdfLib.Icon(Icons.bus_alert,color: PdfColors.red),
  //                           pdfLib.Padding(
  //                             padding:pdfLib.EdgeInsets.only(left: 6),
  //                             child: pdfLib.Column(
  //                               crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                               children: [
  //                                 pdfLib.Text('BSP Bus',
  //                                 style: pdfLib.TextStyle(
  //                                   fontWeight: pdfLib.FontWeight.bold
  //                                 ),),
  //                                 pdfLib.Text('non A/C,Seater Sleeper(2+1)'),
  //                                 pdfLib.Text('9633749714',
  //                                 style: pdfLib.TextStyle(
  //                                   color: PdfColors.blueAccent200,
  //                                   fontWeight:pdfLib. FontWeight.bold
  //                                 ),)
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
                         
                    
  //                   ],
  //                 ),
  //                 pdfLib.SizedBox(
  //                   height: 15,
  //                 ),
                 
  //                 pdfLib.Column(   
  //                   crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                   children: [
  //                     pdfLib.Text('Ticket Price'),
  //                     pdfLib.Padding(
  //                       padding:pdfLib.EdgeInsets.only(top: 5),
  //                       child: pdfLib.Row(
  //                         children: [
  //                           //pdfLib.Icon(Icons.bus_alert,color: PdfColors.red),
  //                           pdfLib.Padding(
  //                             padding: pdfLib.EdgeInsets.only(left: 6),
  //                             child: pdfLib.Column(
  //                               crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                               children: [
  //                                 pdfLib.Text('Rs. 1234.86',
  //                                 style: pdfLib.TextStyle(
  //                                   fontWeight: pdfLib.FontWeight.bold
  //                                 ),),
  //                                 pdfLib.Text('(inclusive of GST)'),
                                  
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                   pdfLib.SizedBox(
  //                   height: 15,
  //                 ),
                 
  //                 pdfLib.Column(   
  //                   crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                   children: [
  //                     pdfLib.Text('Boarding Point'),
  //                    pdfLib. Padding(
  //                       padding: pdfLib.EdgeInsets.only(top: 5),
  //                       child: pdfLib.Row(
  //                         children: [
  //                           //pdfLib.Icon(Icons.location_on,color: PdfColors.red),
  //                           pdfLib.Padding(
  //                             padding: pdfLib.EdgeInsets.only(left: 6),
  //                             child: pdfLib.Column(
  //                               crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                               children: [
  //                                 pdfLib.Row(
  //                                   children: [
  //                                     pdfLib.Text('Coimbatore',
  //                                     style: pdfLib.TextStyle(
  //                                       fontWeight: pdfLib.FontWeight.bold
  //                                     ),),
  //                                   ],
  //                                 ),
  //                                 pdfLib.Text('Gandhipuram'),
  //                                 pdfLib.Container(
  //                                   width: 260,
  //                                   child: pdfLib.Text('BSP Bus. C/o Guru Travels, 2nd Street Gandhipuram, Next to Cross Cut Signal,12345678')),
  //                                 pdfLib.Container(
  //                                   width: 260,
  //                                   child: pdfLib.Text('Landmark : BSP Bus. C/o Guru Travels, 2nd Street Gandhipuram')) ,
  //                                   pdfLib.Text('123456789  123456789',
  //                                   style: pdfLib.TextStyle(
  //                                     color: PdfColors.blueAccent200,
  //                                     fontWeight: pdfLib.FontWeight.bold
  //                                   ),), 
  //                                   pdfLib.Text('123456789  123456789',
  //                                   style: pdfLib.TextStyle(
  //                                     color: PdfColors.blueAccent200,
  //                                     fontWeight: pdfLib.FontWeight.bold
  //                                   ))                                
  //                                ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                     pdfLib.SizedBox(
  //                   height: 15,
  //                 ),
                 
  //                 pdfLib.Column(   
  //                   crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                   children: [
  //                     pdfLib.Text('Dropping Point'),
  //                     pdfLib.Padding(
  //                       padding: pdfLib.EdgeInsets.only(top: 5),
  //                       child: pdfLib.Row(
  //                         children: [
  //                           //pdfLib.Icon(Icons.location_on,color: PdfColors.red),
  //                           pdfLib.Padding(
  //                             padding: pdfLib.EdgeInsets.only(left: 6),
  //                             child: pdfLib.Column(
  //                               crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                               children: [
  //                                 pdfLib.Row(
  //                                   children: [
  //                                     pdfLib.Text('Chennai',
  //                                     style: pdfLib.TextStyle(
  //                                       fontWeight: pdfLib.FontWeight.bold
  //                                     ),),
  //                                   ],
  //                                 ),
  //                                 pdfLib.Text('Gandhipuram'),
  //                                 pdfLib.Container(
  //                                   width: 260,
  //                                   child: pdfLib.Text('BSP Bus. C/o Guru Travels, 2nd Street Gandhipuram, Next to Cross Cut Signal')),
  //                                pdfLib.Text('DROPPING DATE & TIME:'),
  //                                pdfLib.Text('17/01/2024, 06:15 AM ',
  //                                style: pdfLib.TextStyle(
  //                                 fontWeight: pdfLib.FontWeight.bold
  //                                ),)
                                                                  
  //                                ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 pdfLib.SizedBox(
  //                   height: 20,
  //                 ),
  //                 pdfLib.Padding(
  //                   padding:pdfLib.EdgeInsets.only(right: 15),
  //                   child: pdfLib.Row(
  //                     mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       pdfLib.Column(
  //                         children: [
  //                           pdfLib.Text('Passenger Details'),
  //                                 pdfLib.Row(
  //                   children: [
  //                     //pdfLib.Icon(Icons.person),
  //                     pdfLib.Column(
  //                       crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                       children: [
  //                         pdfLib.Text('Anas',
  //                         style: pdfLib.TextStyle(
  //                           fontWeight: pdfLib.FontWeight.bold
  //                         ),),
  //                         pdfLib.Text('24Yrs,MALE')
  //                       ],
  //                     )
  //                   ],
  //                 )
  //                         ],
  //                       ),
  //                       pdfLib.Column(
  //                     crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                         children: [
  //                           pdfLib.Padding(
  //                             padding:pdfLib.EdgeInsets.only(bottom: 18),
  //                             child: pdfLib.Text('Seat No'),
  //                           ),
  //                           pdfLib.Text('3',
  //                           style: pdfLib.TextStyle(
  //                             color: PdfColors.red
  //                           ),)
  //                         ],  
  //                       )
  //                     ],
  //                   ),
  //                 ),
            
          
  //               ]),
  //             ),
  //             pdfLib.SizedBox(
  //               height: 10,
  //             ),
  //             pdfLib.Container(
                  
  //               width: 280,
  //               decoration: pdfLib.BoxDecoration(
  //                border: pdfLib.Border.all(
  //                 color: PdfColors.black,
  //                 width: 1
  //                )
  //               ),
  //               child: pdfLib.Column(
  //                 children: [
  //                   pdfLib.Container(
  //                     height: 50,
  //                     width: 280,
  //                     decoration: pdfLib.BoxDecoration(
  //                       color: PdfColors.blueGrey100
  //                     ),
  //                     child: pdfLib.Row(
  //                       children: [
  //                         pdfLib.Text('Date Change',
  //                         style: pdfLib.TextStyle(
  //                           fontSize: 15.8,
  //                           fontWeight: pdfLib.FontWeight.bold
  //                         ),),
  //                       ],
  //                     ),
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 8,
  //                   ),
  //                   pdfLib.Text('The journey date for this ticket can be changed, you can advance or postpone ticket to a different date as per your convenience.'
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 12,
  //                   ),
  //                   pdfLib.Text('Date change time and charges for this operator is shown below.'),
  //                   pdfLib.Padding(
  //                     padding:pdfLib.EdgeInsets.only(right: 10,top: 15),
  //                     child: pdfLib.Row(
  //                       mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         pdfLib.Text('Time',
  //                         style: pdfLib.TextStyle(
  //                           fontSize: 15.6,
  //                           fontWeight: pdfLib.FontWeight.bold
  //                         ),),
  //                         pdfLib.Padding(
  //                           padding:pdfLib.EdgeInsets.only(right: 40),
  //                           child: pdfLib.Text('Charges',
  //                            style: pdfLib.TextStyle(
  //                             fontSize: 15.6,
  //                             fontWeight: pdfLib.FontWeight.bold
  //                           ),),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 10,
  //                   ),
  //                   pdfLib.Row(
  //                     children: [
  //                       pdfLib.Container(
  //                         height: 62,
  //                         width: 250,
  //                         decoration: pdfLib.BoxDecoration(
  //                           border: pdfLib.Border.all(
  //                             color: PdfColors.black,
  //                             width: 1
  //                           )
  //                         ),
  //                         child: pdfLib.Column(
  //                           children: [
  //                             pdfLib.Text(
  //                               'Date change allowed till 16 jan 2024 12:30:00 PM (8 hours before depature)'
  //                             ),
                                
  //                           ],
  //                         ),
  //                       ),
  //                        pdfLib.Container(
  //                         height: 62,
  //                         width: 100,
  //                         decoration: pdfLib.BoxDecoration(
  //                           color: PdfColors.grey100,
  //                           border: pdfLib.Border.all(
  //                             color: PdfColors.black,
                             
  //                           )
  //                         ),
  //                         child: pdfLib.Center(
  //                           child: pdfLib.Text('FREE',
  //                         style: pdfLib.TextStyle(
  //                           fontWeight: pdfLib.FontWeight.bold
  //                         ),)),
  //                       )
  //                     ],
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 10,
  //                   ),
  //                   pdfLib.Row(
  //                     crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                     children: [
  //                       pdfLib.Text('Note : ',
  //                       style: pdfLib.TextStyle(
  //                         color: PdfColors.red 
  //                       ),),
  //                       pdfLib.Column(
  //                         children: [
  //                           pdfLib.Text('Rescheduling a ticket can be availed only per \nbooking, if applicabel. Once the travel date \nchange option is availed,the ticket cannot be \nfurther cancelled.'),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                   pdfLib.SizedBox(
  //                     height: 30,
  //                   ),
  //                   pdfLib.Column(
  //                     crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                     children: [
  //                       pdfLib.Text('How to Change the journey date of your ticket in Oyebus app',
  //                       style: pdfLib.TextStyle(
  //                         fontWeight: pdfLib.FontWeight.bold
  //                       ),),
  //                       pdfLib.SizedBox(
  //                         height: 5,
  //                       ),
  //                        pdfLib.Text('Go to my bookings, choose the journey & change date')
  //                     ],
  //                   ),
                   
  //                   pdfLib.SizedBox(
  //                     height: 10,
  //                   )
  //                 ],
  //               ),
  //             ),
  //             pdfLib.SizedBox(
  //               height: 30,
  //             ),
  //             pdfLib.Column(
  //               children: [
  //                 pdfLib.Container(
  //                    height: 100,
  //                    width: 280,
  //                   decoration: pdfLib.BoxDecoration(
  //                     border: pdfLib.Border.all(
  //                       color: PdfColors.black,
  //                       width: 1
  //                     )
  //                   ),
  //                   child: pdfLib.Column(
  //                     children: [
  //                       pdfLib.Container(
  //                         height: 50,
  //                         //width: size.width,
  //                         decoration: pdfLib.BoxDecoration(
  //                           color: PdfColors.blueGrey100
  //                         ),
  //                         child: pdfLib.Row(
  //                           children: [
  //                             pdfLib.Text('Booking Policies',
  //                               style: pdfLib.TextStyle(
  //                           fontSize: 15.8,
  //                           fontWeight: pdfLib.FontWeight.bold
  //                         ),), 
  //                           ],
  //                         ),
  //                       ),
  //                       pdfLib.Padding(
  //                         padding:pdfLib.EdgeInsets.only(top: 15),
  //                         child: pdfLib.Row(crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                           children: [
  //                             //pdfLib.Icon(Icons.child_care,color: PdfColors.red,),
  //                             pdfLib.Padding(
  //                               padding:pdfLib.EdgeInsets.only(left: 8),
  //                               child: pdfLib.Column(
  //                                 crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                                 children: [
  //                                   pdfLib.Text('Child passenger policy',
  //                                   style: pdfLib.TextStyle(
  //                                     fontWeight: pdfLib.FontWeight.bold,
  //                                     fontSize: 15.5
  //                                   ),),
  //                                   pdfLib.Padding(
  //                                     padding:pdfLib.EdgeInsets.only(top: 6),
  //                                     child: pdfLib.Text('Children above the age of 3 will need a ticket'),
  //                                   ),
                                 
  //                                 ],
  //                               ),
  //                             ),
                          
  //                           ],
  //                         ),
  //                       ),
  //                       pdfLib.Padding(
  //                         padding: pdfLib.EdgeInsets.only(top: 8),
  //                         child: pdfLib.Divider(),
  //                       ),
  //                        pdfLib.Padding(
  //                          padding: pdfLib.EdgeInsets.only(top: 5),
  //                          child: pdfLib.Row(
  //                           crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                           mainAxisAlignment: pdfLib.MainAxisAlignment.start,
  //                           children: [
  //                             //pdfLib.Icon(Icons.luggage,color: PdfColors.red,),
  //                             pdfLib.Padding(
  //                               padding:pdfLib.EdgeInsets.only(left: 6),
  //                               child: pdfLib.Column(
  //                                 crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                                 children: [
  //                                   pdfLib.Text('Luggage Policy',
  //                                   style: pdfLib.TextStyle(
  //                                     fontWeight: pdfLib.FontWeight.bold,
  //                                     fontSize: 15.5
  //                                   ),),
  //                                   pdfLib.Padding(
  //                                     padding:pdfLib.EdgeInsets.only(top: 6),
  //                                     child: pdfLib.Text('1 pieces of luggage will be accepted free of \ncharges for passenger. Excess items will be \nchargeable Excess Baggage over 10 kgs \nper passanges will be chargeable'),
  //                                   ),
                                 
  //                                 ],
  //                               ),
  //                             ),
                                                   
                           
  //                           ],
  //                                                  ),
  //                        ), 
  //                           pdfLib.SizedBox(
  //                             height: 8,
  //                           ),
  //                           pdfLib.Divider(),
  //                            pdfLib.Padding(
  //                          padding:pdfLib.EdgeInsets.only(top: 5),
  //                          child: pdfLib.Row(
  //                           crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                           mainAxisAlignment: pdfLib.MainAxisAlignment.start,
  //                           children: [
  //                             //pdfLib.Icon(Icons.pets,color: PdfColors.red,),
  //                             pdfLib.Padding(
  //                               padding:pdfLib.EdgeInsets.only(left: 6),
  //                               child: pdfLib.Column(
  //                                 crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                                 children: [
  //                                   pdfLib.Text('Pets Policy',
  //                                   style: pdfLib.TextStyle(
  //                                     fontWeight: pdfLib.FontWeight.bold,
  //                                     fontSize: 15.5
  //                                   ),),
  //                                   pdfLib.Padding(
  //                                     padding:pdfLib.EdgeInsets.only(top: 6),
  //                                     child: pdfLib.Text('Prts are not allowed'),
  //                                   ),
                                 
  //                                 ],
  //                               ),
  //                             ), 
  //                           ],
  //                          ),
  //                        ), 
  //                           pdfLib.SizedBox(
  //                             height: 8,
  //                           ),
  //                           pdfLib.Divider(),
  //                            pdfLib.Padding(
  //                          padding: pdfLib.EdgeInsets.only(top: 5),
  //                          child: pdfLib.Row(
  //                           crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                           mainAxisAlignment: pdfLib.MainAxisAlignment.start,
  //                           children: [
  //                             //pdfLib.Icon(Icons.liquor,color: PdfColors.red,),
  //                             pdfLib.Padding(
  //                               padding:pdfLib.EdgeInsets.only(left: 6),
  //                               child: pdfLib.Column(
  //                                 crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                                 children: [
  //                                   pdfLib.Text('Liquor Policy',
  //                                   style: pdfLib.TextStyle(
  //                                     fontWeight: pdfLib.FontWeight.bold,
  //                                     fontSize: 15.5
  //                                   ),),
  //                                   pdfLib.Padding(
  //                                     padding:pdfLib.EdgeInsets.only(top: 6),
  //                                     child: pdfLib.Text('Carring or consuming liqour inside the bus \nis prohibited. Bus operators reserves the right \nto deboard durnk passengers'),
  //                                   ),
                                 
  //                                 ],
  //                               ),
  //                             ),
                                                   
                           
  //                           ],
  //                                                  ),
  //                        ), 
  //                           pdfLib.SizedBox(
  //                             height: 8,
  //                           ),
  //                           pdfLib.Divider(),
  //                            pdfLib.Padding(
  //                          padding:pdfLib.EdgeInsets.only(top: 5),
  //                          child: pdfLib.Row(
  //                           crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                           mainAxisAlignment: pdfLib.MainAxisAlignment.start,
  //                           children: [
  //                           //  pdfLib.Icon(Icons.hail,color: PdfColors.red,),
  //                             pdfLib.Padding(
  //                               padding:pdfLib.EdgeInsets.only(left: 6),
  //                               child: pdfLib.Column(
  //                                 crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
  //                                 children: [
  //                                   pdfLib.Text('Pick up time policy',
  //                                   style: pdfLib.TextStyle(
  //                                     fontWeight: pdfLib.FontWeight.bold,
  //                                     fontSize: 15.5
  //                                   ),),
  //                                   pdfLib.Padding(
  //                                     padding:pdfLib.EdgeInsets.only(top: 6),
  //                                     child: pdfLib.Text('Bus operator is not obligated to wait beyond \nthe scheduled departure time of the bus. No \nrefund request will be entertained for late \narriving passengers'),
  //                                   ),
                                 
  //                                 ],
  //                               ),
  //                             ),
                                                   
                           
  //                           ],
  //                                                  ),
  //                        ), 
  //                           pdfLib.SizedBox(
  //                             height: 8,
  //                           ),
  //                          pdfLib. Divider()
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //             pdfLib.SizedBox(
  //               height: 10,
  //             )
  //           ],
      
  //         ),
  //     ];
  //     }
  //   ),
   
  //       );

        Directory root = await getTemporaryDirectory(); 
        
        final file= File('${root.path}/busticket.pdf');
        await file.writeAsBytes(await pdf.save());
        print("------------------------>>");
        print(file.path);
        Share.shareFiles([file.path],subject: 'BusTicket');
        
//       List<XFile> fileList = [XFile(file.path)];
// Share.shareXFiles(fileList);
        

  
}
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<BookinghistoryController>(
        builder: (_) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                    
                    ),
                  ),
                   Expanded(
                    flex: 2,
                     child: Container(
                      color: Colors.white,
                     
                               ),
                   ),
                   
                ],
              ),
              Positioned(
                top: 130,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 470,
                    width: size.width,
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(0.5),
                          
                        )
                      ],
                      borderRadius: BorderRadius.circular(20)
                    ),
                   child: Padding(
                     padding: const EdgeInsets.only(top: 5,),
                     child: Column(
                      children: [
                        Text(widget.bookingDetail.busData!.busName.toString(),
                         style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600
                                  )),
                        Text('${widget.bookingDetail.busData!.busType} - ${getSeatsDetail(widget.bookingDetail.bookingData!.seats)}seat'),
                        ksizedbox20,
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text(widget.bookingDetail.busRoute!.startLocation.toString(),
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(widget.bookingDetail.bookingData!.pickupPoint.toString(),
                                    ),
                                  ),
                                  Text('${getActualTime(widget.bookingDetail.busRoute!.departureTime)}  ${widget.bookingDetail.bookingData!.dateOfJourney}',
                                  style: TextStyle(
                                    fontSize: 12
                                  ),)
                                ],
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    Text('${widget.bookingDetail.busRoute!.totalHours} hr'),
                                    Row(
                                                          
                                      children: [
                                        Container(
                                          height: 13,
                                          width: 13,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kred
                                          ),
                                        ),
                                        Container(
                                                                  height: 2,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                        color: kred
                                                                  ),
                                                                ),
                                                                Container(
                                          height: 13,
                                          width: 13,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kred,
                                              width: 1.5
                                            ),
                                            shape: BoxShape.circle,
                                        
                                          ),
                                        ),
                                                          
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text(widget.bookingDetail.busRoute!.endLocation.toString(),
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(widget.bookingDetail.bookingData!.droppingPoint.toString())),
                                  Text('${getActualTime(widget.bookingDetail.busRoute!.arrivalTime)}  ${widget.bookingDetail.bookingData!.dateOfJourney}',
                                  style: TextStyle(
                                    fontSize: 12
                                  ),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        ksizedbox20,
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('-------------------------'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${getActualTime(widget.bookingDetail.busRoute!.departureTime)} - ${getActualTime(widget.bookingDetail.busRoute!.arrivalTime)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600
                                  ),),
                                  Text(widget.bookingDetail.bookingData!.dateOfJourney.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400
                                  ),)
                                ],
                              ),
                                   Text('-------------------------'),
                            ],
                          ),
                        ),
                        ksizedbox20,
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Seat Number :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Text(getSeatsDetail(widget.bookingDetail.bookingData!.seats),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900
                                  ),)
                                ],
                              ),
                                 Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ticket ID :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Text('',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900
                                  ),)
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Container(
                           width: size.width,
                            child: Text('--------------------------------------------------------------------------',
                            style: TextStyle(
                              color: kgrey
                            ),)),
                        ),
                             ksizedbox10,
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PNR Number :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Text(widget.bookingDetail.bookingData!.pnrNumber,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900
                                  ),)
                                ],
                              ),
                                 Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Booking ID :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Text(widget.bookingDetail.bookingData!.bookingId.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900
                                  ),)
                                ],
                              )
                            ],
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Container(
                           width: size.width,
                            child: Text('--------------------------------------------------------------------------',
                            style: TextStyle(
                              color: kgrey
                            ),)),
                        ),
                            ksizedbox10,
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.bookingDetail.busData!.busName.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900
                                  ),),
                                  Text(widget.bookingDetail.busData!.busRegisterNumber.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900
                                  ),)
                                ],
                              ),
                                
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Container(
                           width: size.width,
                            child: Text('--------------------------------------------------------------------------',
                            style: TextStyle(
                              color: kgrey
                            ),)),
                        ),
                        ksizedbox10,
                        Padding(
                          padding: const EdgeInsets.only(left: 7,right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL: ',
                              style: TextStyle(
                                fontWeight: FontWeight.w900
                              ),),
                              Text('₹ ${widget.bookingDetail.bookingData!.totalPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),)
                            ],
                          ),
                        )
                      ],
                     ),
                   ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
          
                child: Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6,right: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,
                        color: kwhite,),
                      ),
                      Text('Your Ticket Details',
                       style: TextStyle( 
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: kwhite
                                          ),),
                                          SvgPicture.asset('assets/home_page/bell_icons.svg',
                                          color: kwhite,)
                    ],
                              ),
                  ),
                ))
            ],
          );
        }
      ),
      bottomNavigationBar:Container(
        height: 200,
        child: Column(
          children: [
               ksizedbox20,
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Container(
                    width: size.width,
                   child: Column( 
                     children: [
                       Text('Bus information will be shared on the following number on the day trip of journey.',
                       style: TextStyle(
                        height: 1.5.h,
                        fontFamily: 'Proxima '
                       ),),   
                     ],
                   ),),
                ),
                ksizedbox20,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: (){
                           sharePdfgeneration();
                          },
                        child: Image.asset('assets/offers_icon/shareicon.png',
                        color: Colors.blueAccent,)),
                      GestureDetector(
                        onTap: (){
                         generatePDF();
                        },
                        child: Image.asset('assets/offers_icon/downloadicon.png',
                        color: kgreen,)),
                      GestureDetector(
                        onTap: (){
                     showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: Colors.white,
                                            title: Column(
                                              children: [
                                                Lottie.asset(
                                                  'assets/images/deletepassengergif.json',
                                                  height: 80,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ],
                                            ),
                                            content: Container(
                                              width: 150.w,
                                              child: const Text(
                                                "Are you sure want to Cancel your booking?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 38,
                                                      width: 105,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          // ignore: unrelated_type_equality_checks
                                                          color: kgrey),
                                                      child: Center(
                                                          child: Text("No",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      kblack))),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                     final bookingcancelController = Get.find<TicketDetailsController>().
                           bookingCancellation(bookingid:bookingHistoryController.bookinghistorydata!.isNotEmpty?
                            bookingHistoryController.bookinghistorydata!.first.bookingData!.bookingId.toString():'');
                            final bookinghistoryController = Get.find<BookinghistoryController>().bookinghistory(); 
                                                    },
                                                    child: Container(
                                                      height: 38,
                                                      width: 105,
                                                      decoration: BoxDecoration(
                                                          color: kred,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Center(
                                                        child: Text("yes ",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: kwhite)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ksizedbox10
                                            ],
                                          );
                                        });
                           
                        },
                        child: Image.asset('assets/offers_icon/cancelicon.png',
                        color: kred,))
                    ],
                   ), 
            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Share'),
                                Text('Download'),
                                Text('Cancel')
                              ],
                             ),
          ],
        ),
      ),
              
    );
  }
}