import 'dart:io';

import 'package:custom_clippers/custom_clippers.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:oye_bus/app/modules/screens/busbooking/busseatmaping/views/paymentsuccesfull_view.dart';

import 'package:oye_bus/app/modules/screens/busseatmaping/views/paymentsuccesfull_view.dart';
import 'package:oye_bus/app/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../controllers/reservation_details_controller.dart';

class ReservationDetailsView extends GetView<ReservationDetailsController> {
  const ReservationDetailsView({Key? key}) : super(key: key);



Future<void> pdfdownload() async {
  
  final pdf = pw.Document();
  final img = await rootBundle.load('assets/offers_icon/resershareicon.png');
final imageBytes = img.buffer.asUint8List();
pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
final qrimage = await rootBundle.load('assets/images/qrimage.png');
final imgeBytes = qrimage.buffer.asUint8List();
pw.Image image2 = pw.Image(pw.MemoryImage(imgeBytes));

  pdf.addPage(
    
    pw.Page(
      
      build: (pw.Context context) => pw.Center(
        child:  pw.Column(
              crossAxisAlignment:pw. CrossAxisAlignment.start,
              children: [
                pw.Stack(
                  children: [
                    pw.Container(
                                
                      width: 374,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.red,
                        borderRadius: pw.BorderRadius.circular(20)
                      ),
                      child: pw.Padding(
                        padding:pw.EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text('Chennai  - Bengaluru',
                                style: pw.TextStyle(
                                  //pw.fontFamily: 'Proxima',
                                  fontSize: 20.5,
                                  //fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.white
                                ),),
                                pw.Container(
                                  height: 40,
                                  width: 40,
                                  decoration: pw.BoxDecoration(
                                    shape: pw.BoxShape.circle,
                                    color: PdfColors.white
                                  ),
                                  child: image1,
                                )
                              ],
                            ),
                            pw.Text('10 Nov 2023, Saturday',
                            style: pw.TextStyle(
                              fontSize: 16,
                              //fontFamily: 'Proxima',
                              //fontWeight: pw.FontWeight.bold,
                              color:PdfColors.white
                            ),),
                           pw.SizedBox(
                            height: 20
                           ),
                           pw.Divider(
                            color: PdfColors.white
                           ),
                            // pw.Container(
                             
                            //   child: pw.Padding(
                            //     padding:pw.EdgeInsets.only(left: 4,right: 4),
                            //     child: pw.Text('------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',
                            //     style: pw.TextStyle(
                            //       color: PdfColors.white
                            //     ),),
                            //   )),
                                pw.SizedBox(
                            height: 20
                           ),
                              pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text('Bus Name',
                                  style: pw.TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white
                                  ),),
                                  pw.Text('Seat Number',
                                    style: pw.TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white))
                                ],
                              ),
                              pw.Padding(
                                padding:pw.EdgeInsets.only(top: 8),
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Container(
                                      width: 150,
                                      child: pw.Text('KMPL Kalaimakal Travels',
                                      style: pw.TextStyle(
                                        //fontFamily: 'Proxima ',
                                        color: PdfColors.white,
                                        fontSize: 16,
                                        //fontWeight: pw.FontWeight.bold
                                      ),),
                                    ),
                                    pw.Text('L17',
                                    textAlign: pw.TextAlign.start,
                                     style: pw.TextStyle(
                                      
                                      color: PdfColors.white,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16,
                                        //fontWeight: pw.FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                               pw.SizedBox(
                                height: 20
                               ),
                              pw.Row(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text('Ticket ID',
                                  style: pw.TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    color:PdfColors.white
                                  ),),
                                  pw.Text('Bus Number',
                                    style: pw.TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white))
                                ],
                              ),
                                 pw.Padding(
                                padding: pw.EdgeInsets.only(top: 8),
                                child: pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text('LA345678',
                                    style: pw.TextStyle(
                                      //fontFamily: 'Proxima ',
                                      color: PdfColors.white,
                                      fontSize: 16,
                                      //fontWeight: pw.FontWeight.bold
                                    ),),
                                    pw.Text('TN 01 BC 3432',
                                    textAlign: pw.TextAlign.start,
                                     style: pw.TextStyle(
                                      
                                      color: PdfColors.white,
                                       // fontFamily: 'Proxima ',
                                        fontSize: 16,
                                        //fontWeight: pw.FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                           pw.SizedBox(
                            height: 20
                           ),
                                   pw.Row(
                                crossAxisAlignment:pw.CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text('Arrival',
                                  style: pw.TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white
                                  ),),
                                  pw.Text('Drop',
                                    style: pw.TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    color: PdfColors.white))
                                ],
                              ),
                              pw.Padding(
                                padding: pw.EdgeInsets.only(top: 8),
                                child: pw.Row(
                                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text('21:50 PM',
                                    style: pw.TextStyle(
                                      //fontFamily: 'Proxima ',
                                      color: PdfColors.white,
                                      fontSize: 16,
                                      //fontWeight: pw.FontWeight.bold
                                    ),),
                                    pw.Text('06:15AM',
                                    textAlign: pw.TextAlign.start,
                                     style: pw.TextStyle(
                                      
                                      color: PdfColors.white,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16,
                                        //fontWeight: pw.FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ),
                             pw.SizedBox(
                              height: 30
                             ),
                             pw.Divider(color: PdfColors.white),
                              //  pw.Container(
                              // width: 374,
                              // child: pw.Padding(
                              //   padding: pw. EdgeInsets.only(left: 4,right: 4),
                              //   child: pw.Text('---------------------------------------------------------------------------',
                              //   style: pw.TextStyle(
                              //     color: PdfColors.white
                              //   ),),
                              // )),
                             pw.SizedBox(
                              height: 20
                             ),
                              pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text('TOTAL:',
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                    //fontWeight: pw.FontWeight.bold,
                                    //fontFamily: 'Proxima ',
                                    color: PdfColors.white
                                  ),),
                                   pw.Text('Rs 4,558.00',
                                  style: pw.TextStyle(
                                    fontSize: 16,
                                    //fontWeight:pw. FontWeight.bold,
                                    //fontFamily: 'Proxima ',
                                    color: PdfColors.white
                                  ),)
                                ],
                              ),
                              pw.SizedBox(
                                height: 30
                              ),
                              pw.Divider(color: PdfColors.white),
                                // pw.Padding(
                                //   padding: pw.EdgeInsets.only(left: 4,right: 4),
                                //   child: pw.Container(
                                //   width: 374,
                                //   child: pw.Text('---------------------------------------------------------------------------',
                                //   style: pw.TextStyle(
                                //   color: PdfColors.white
                                //     ),)),
                                // ),
                             pw.SizedBox(
                              height: 20
                             ),
                              pw.Center(
                                child: image2
                              ),
                          
                          ],
                        ),
                      ),
                    ),
                //    pw.Positioned(
                //     top: 56,
                //     right: 330,
                //     child: pw.Container(
                //  height: 28,
                //  width: 28,
                //  decoration: pw.BoxDecoration(
                //   shape: pw.BoxShape.circle,
                //      color: PdfColors.white,
                //  ),
              
                // )
                // ),
                //     pw.Positioned(
                //       top: 56,

                //       left: 33,
                //       child:pw.Container(
                //  height: 28,
                //  width: 28,
                //  decoration: pw.BoxDecoration(
                //   shape: pw.BoxShape.circle,
                //      color: PdfColors.white,
                //  ),
              
                // )), 
                //        pw.Positioned(
                //       top: 357,
                //       right: 330,
                //       child: pw.Container(
                //  height: 28,
                //  width: 28,
                //  decoration: pw.BoxDecoration(
                //   shape: pw.BoxShape.circle,
                //      color: PdfColors.white,
                //  ),
              
                // )
                //       ),
                //         pw.Positioned(
                //       top: 357,
                //       left: 330,
                //       child: pw.Container(
                //  height: 28,
                //  width: 28,
                //  decoration: pw.BoxDecoration(
                //   shape: pw.BoxShape.circle,
                //      color: PdfColors.white,
                //  ),
              
                // )),
                //        pw.Positioned(
                //       top: 450,
                //       right: 330,
                //       child:pw.Container(
                //  height: 28,
                //  width: 28,
                //  decoration: pw.BoxDecoration(
                //   shape: pw.BoxShape.circle,
                //      color: PdfColors.white,
                //  ),
              
                // )
                //       ),
                //         pw.Positioned(
                //       top: 450,
                //       left: 330,
                //       child: pw.Container(
                //  height: 28,
                //  width: 28,
                //  decoration: pw.BoxDecoration(
                //   shape: pw.BoxShape.circle,
                //      color: PdfColors.white,
                //  ),
              
                // )
                //       ),
                  ],
                ), 
                    pw.Padding(
                      padding: pw.EdgeInsets.only(top: 5),
                      child: pw.Row(
                              children: [
                                pw.Text('Note: ',
                                style: pw.TextStyle(
                                  color: PdfColors.red
                                ),),
                                pw.Column(
                                  children: [
                                    pw.Text('Just show your QR code while boarding bus.',
                                                                 ),
                                  ],
                                )
                              ],
                            ),
                    ),
                          
              ],
            ),
      ),
    ),
  );
final directory = await getExternalStorageDirectory();
final file = File("${directory?.path}/travelticket.pdf");
print('file_path::::::::::::::::');
print(file.path);

final pdfBytes = await pdf.save();
OpenFile.open(file.path);
await file.writeAsBytes(pdfBytes.toList());



DocumentFileSavePlus().saveMultipleFiles(
  dataList: [pdfBytes,],
  fileNameList: ["travelticket.pdf",],
  mimeTypeList: ["travelticket/pdf",],
);

}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Details',
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                                
                      width: 374.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFF0000),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Chennai  - Bengaluru',
                                style: TextStyle(
                                  //fontFamily: 'Proxima',
                                  fontSize: 20.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kwhite
                                ),),
                                Container(
                                  height: 35.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kwhite
                                  ),
                                  child: Image.asset('assets/offers_icon/resershareicon.png'),
                                )
                              ],
                            ),
                            Text('10 Nov 2023, Saturday',
                            style: TextStyle(
                              fontSize: 16.sp,
                              //fontFamily: 'Proxima',
                              fontWeight: FontWeight.w400,
                              color: kwhite
                            ),),
                            ksizedbox10,
                            Container(
                              width: 374.w,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4,right: 4),
                                child: Text('---------------------------------------------------------------------------',
                                style: TextStyle(
                                  color: kwhite
                                ),),
                              )),
                              ksizedbox20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Bus Name',
                                  style: TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite
                                  ),),
                                  Text('Seat Number',
                                    style: TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150.w,
                                      child: Text('KMPL Kalaimakal Travels',
                                      style: TextStyle(
                                        //fontFamily: 'Proxima ',
                                        color: kwhite,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),),
                                    ),
                                    Text('L17',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                 ksizedbox20,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ticket ID',
                                  style: TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite
                                  ),),
                                  Text('Bus Number',
                                    style: TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite))
                                ],
                              ),
                                 Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('LA345678',
                                    style: TextStyle(
                                      //fontFamily: 'Proxima ',
                                      color: kwhite,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('TN 01 BC 3432',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox20,
                                   Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Arrival',
                                  style: TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite
                                  ),),
                                  Text('Drop',
                                    style: TextStyle(
                                    //fontFamily: 'Proxima ',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: kwhite))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('21:50 PM',
                                    style: TextStyle(
                                      //fontFamily: 'Proxima ',
                                      color: kwhite,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700
                                    ),),
                                    Text('06:15AM',
                                    textAlign: TextAlign.start,
                                     style: TextStyle(
                                      
                                      color: kwhite,
                                        //fontFamily: 'Proxima ',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ksizedbox30,
                               Container(
                              width: 374.w,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4,right: 4),
                                child: Text('---------------------------------------------------------------------------',
                                style: TextStyle(
                                  color: kwhite
                                ),),
                              )),
                              ksizedbox20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TOTAL:',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    //fontFamily: 'Proxima ',
                                    color: kwhite
                                  ),),
                                   Text('₹ 4,558.00',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                    //fontFamily: 'Proxima ',
                                    color: kwhite
                                  ),)
                                ],
                              ),
                              ksizedbox30,
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right: 4),
                                  child: Container(
                                  width: 374.w,
                                  child: Text('---------------------------------------------------------------------------',
                                  style: TextStyle(
                                  color: kwhite
                                    ),)),
                                ),
                              ksizedbox20,
                              Center(
                                child: Image.asset('assets/images/qrimage.png'),
                              ),
                          
                          ],
                        ),
                      ),
                    ),
                   Positioned(
                    top: 56,
                    right: 330,
                    child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                )),
                    Positioned(
                      top: 56,

                      left: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )), 
                       Positioned(
                      top: 357,
                      right: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                        Positioned(
                      top: 357,
                      left: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                       Positioned(
                      top: 450,
                      right: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                        Positioned(
                      top: 450,
                      left: 330,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                      )),
                  ],
                ), 
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                              children: [
                                Text('Note: ',
                                style: TextStyle(
                                  color: kred
                                ),),
                                Column(
                                  children: [
                                    Text('Just show your QR code while boarding bus.',
                                                                 ),
                                  ],
                                )
                              ],
                            ),
                    ),
                          ksizedbox20,
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 12,top: 3),
        child: GestureDetector(
          onTap: (){
            pdfdownload();
            // Get.toNamed(
            //     Routes.BOTTUMNAVIGATION,
            //      );
          },
          child: Container(
            height: 51.h,
            width: 374.w,
            decoration: BoxDecoration(
              color: kred,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text('Download PDF',
              style: TextStyle(
                //fontFamily: 'Proxima ',
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: kwhite
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
