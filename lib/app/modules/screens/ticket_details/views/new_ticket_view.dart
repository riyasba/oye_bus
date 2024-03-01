
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/data/api_service/models/booking_model/booking_history_model.dart';
import 'package:oye_bus/app/modules/screens/busbooking/bookinghistory/controllers/bookinghistory_controller.dart';
import 'package:oye_bus/app/modules/screens/passenger_info/controllers/passenger_info_controller.dart';
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
                width:400,
                decoration:  pdfLib.BoxDecoration(
                  color: PdfColors.white,
                  boxShadow: [
                    pdfLib.BoxShadow(
                      blurRadius: 5,
                      //offset: Offset(, dy),
                      color: PdfColors.grey,
                      
                    )
                  ],
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
                              pdfLib.Text('${widget.bookingDetail.busRoute!.arrivalTime}  ${widget.bookingDetail.bookingData!.dateOfJourney}',
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
                              pdfLib.Text("${widget.bookingDetail.busRoute!.departureTime} - ${widget.bookingDetail.busRoute!.arrivalTime}",
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
                          pdfLib.Text('₹ ${widget.bookingDetail.bookingData!.totalPrice}',
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
              width: 400,
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
    pdfLib.Page(
      build: (pdfLib.Context context) =>
         pdfLib.Center(
          child:
pdfLib.Stack(
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
                width:400,
                decoration:  pdfLib.BoxDecoration(
                  color: PdfColors.white,
                  boxShadow: [
                    pdfLib.BoxShadow(
                      blurRadius: 5,
                      //offset: Offset(, dy),
                      color: PdfColors.grey,
                      
                    )
                  ],
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
                    pdfLib.Text('${widget.bookingDetail.busData!.busType} - ${widget.bookingDetail.bookingData!.seats} Seat'),
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
                              pdfLib.Text('${widget.bookingDetail.busRoute!.departureTime}  ${widget.bookingDetail.bookingData!.dateOfJourney}',
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
                              pdfLib.Text('${widget.bookingDetail.busRoute!.arrivalTime}  ${widget.bookingDetail.bookingData!.dateOfJourney}',
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
                              pdfLib.Text("${widget.bookingDetail.busRoute!.departureTime} - ${widget.bookingDetail.busRoute!.arrivalTime}",
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
                              pdfLib.Text('LA345678',
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
                              pdfLib.Text('1234567890',
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
                              pdfLib.Text('LA345678',
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
                              pdfLib.Text('KPR Klaimagal Travels',
                              style: pdfLib.TextStyle(
                                fontWeight: pdfLib.FontWeight.bold
                              ),),
                              pdfLib.Text('TN 28 BC1234',
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
                          pdfLib.Text('₹ ${widget.bookingDetail.bookingData!.totalPrice}',
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
              width: 400,
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
                                    Text(widget.bookingDetail.busRoute!.totalHours.toString()),
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
                              Text('-------------------'),
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
                                   Text('-------------------'),
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
                    
                           final bookingcancelController = Get.find<TicketDetailsController>().
                           bookingCancellation(bookingid:bookingHistoryController.bookinghistorydata!.isNotEmpty?
                            bookingHistoryController.bookinghistorydata!.first.bookingData!.bookingId.toString():'');
                            final bookinghistoryController = Get.find<BookinghistoryController>().bookinghistory(); 
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