import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:oye_bus/app/components/const.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share/share.dart'; 
import '../controllers/ticket_details_controller.dart';
import 'package:open_file/open_file.dart';
// import 'package:share_plus/share_plus.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {
  const TicketDetailsView({Key? key}) : super(key: key);

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
                        pdfLib.Text('KMRL Kalaimakal',
                        style: pdfLib.TextStyle(
                          fontSize: 20,
                          
                        
                        ),),
                        pdfLib.Text('A/C Seater / Sleepr (2+1) - 1 Seat')
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
                                      pdfLib.Text('21:50'),
                                        pdfLib.Text('10 Nov',
                                  style: pdfLib.TextStyle(
                                    fontSize: 10
                                  ),)
                                    ],
                                  ),
                                   pdfLib.Text('7h 15m',
                                   style: pdfLib.TextStyle(
                                    fontSize: 10
                                   ),),
                                   pdfLib.Column(
                                    children: [
                                      pdfLib.Text('05:05'),
                                      pdfLib.Text('11 Nov',
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
                                         pdfLib.Text('Chennai \nAirport (Meenambakkam Metro)'),
                                         pdfLib.Text('Bangalore \nBommasandra')
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
                    child: pdfLib.Text('21:50 PM - 06:15AM',
                    style: pdfLib.TextStyle( 
                      fontSize: 15,
                    ),),
                  ), 
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(top: 2,left: 10),
                    child: pdfLib.Text('10 Nov 2023, Saturday',
                    style: pdfLib.TextStyle(
                    ),),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Text('Seat Number : L19', 
                        style: pdfLib.TextStyle(
                        ),),
                        pdfLib.Row(
                          children: [
                            pdfLib.Text('Ticket ID : ',
                            style: pdfLib.TextStyle(
                            ),),
                            pdfLib.Text('LA345678',
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
                        pdfLib.Text('PHR : '),
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
                        pdfLib.Text('86J8645JE75',
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
                      child: pdfLib.Text('KMPL Kalaimakal Travels TN 01 BC 3432',
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
                        pdfLib.Text(' 4,558.00',
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
        final file= File('${root.path}/sharmi.pdf');
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
                        pdfLib.Text('KMRL Kalaimakal',
                        style: pdfLib.TextStyle(
                          fontSize: 20.sp,
                        ),),
                        pdfLib.Text('A/C Seater / Sleepr (2+1) - 1 Seat')
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
                                      pdfLib.Text('21:50'),
                                        pdfLib.Text('10 Nov',
                                  style: pdfLib.TextStyle(
                                    fontSize: 10.sp
                                  ),)
                                    ],
                                  ),
                                   pdfLib.Text('7h 15m',
                                   style: pdfLib.TextStyle(
                                    fontSize: 10.sp
                                   ),),
                                   pdfLib.Column(
                                    children: [
                                      pdfLib.Text('05:05'),
                                      pdfLib.Text('11 Nov',
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
                                    pdfLib.Text('Chennai \nAirport (Meenambakkam Metro)'),
                                    pdfLib.Text('Bangalore \nBommasandra')
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
                    child: pdfLib.Text('21:50 PM - 06:15AM',
                    style: pdfLib.TextStyle(
                      fontSize: 15.sp,
                    ),),
                  ),
                  pdfLib.Padding(
                    padding: pdfLib.EdgeInsets.only(top: 2,left: 10),
                    child: pdfLib.Text('10 Nov 2023, Saturday',
                    style: pdfLib.TextStyle(
                    ),),
                  ),
                  pdfLib.Padding(
                    padding:pdfLib.EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: pdfLib.Row(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                      children: [
                        pdfLib.Text('Seat Number : L19', 
                        style: pdfLib.TextStyle(
                        ),),
                        pdfLib.Row(
                          children: [
                            pdfLib.Text('Ticket ID : ',
                            style: pdfLib.TextStyle(
                            ),),
                            pdfLib.Text('LA345678',
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
                        pdfLib.Text('PHR : '),
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
                        pdfLib.Text('86J8645JE75',
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
                      child: pdfLib.Text('KMPL Kalaimakal Travels TN 01 BC 3432',
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
                        pdfLib.Text(' 4,558.00',
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
        
        final file= File('${root.path}/sharmi.pdf');
        await file.writeAsBytes(await pdf.save());
        print("------------------------>>");
        print(file.path);
        Share.share(file.path);
        
//       List<XFile> fileList = [XFile(file.path)];
// Share.shareXFiles(fileList);
        

  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:     GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back)),
        title:  Text('Your Ticket Details',
          style:appbarfont,
        ),
        actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset('assets/offers_icon/bellicon.png'),
            )
        ],
      ),
       
      body: ListView(
        children: [
         Padding(
           padding: const EdgeInsets.only(left: 8,right: 8),
           child: Column(
            children: [
             Container(
              height: 532.h,
              width: 374.w,
              decoration: BoxDecoration(
                color: Color(0xffFFD400)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('KMRL Kalaimakal',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500
                        ),),
                        Text('A/C Seater / Sleepr (2+1) - 1 Seat')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 15),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 130.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text('21:50'),
                                        Text('10 Nov',
                                  style: TextStyle(
                                    fontSize: 10.sp
                                  ),)
                                    ],
                                  ),
                                   Text('7h 15m',
                                   style: TextStyle(
                                    fontSize: 10.sp
                                   ),),
                                   Column(
                                    children: [
                                      Text('05:05'),
                                      Text('11 Nov',
                                      style: TextStyle(
                                        fontSize: 10.sp
                                      ),)
                                    ],
                                   )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Container(
                                height: 15.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Container(
                                height: 92.h,
                                width: 5.w,
                                decoration: BoxDecoration(
                                  color: Colors.black
                                ),
                              ),
                                 Container(
                                height: 15.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                         Text('Chennai \nAirport (Meenambakkam Metro)'),
                                         Text('Bangalore \nBommasandra')
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Container(
                    width: 374.w,
                    decoration: BoxDecoration(
                    ),
                    child: Text('-----------------------------------------------------------------------------------',
                    style: TextStyle(
                      color: kwhite
                    ),),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('21:50 PM - 06:15AM',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,left: 10),
                    child: Text('10 Nov 2023, Saturday',
                    style: TextStyle(
                    ),),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Seat Number : L19',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),),
                        Row(
                          children: [
                            Text('Ticket ID : ',
                            style: TextStyle(),),
                            Text('LA345678',
                            style: TextStyle(
                              fontWeight: FontWeight.w700
                            ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 0,right: 10),
                    child: Row(
                      children: [
                        Text('PHR : '),
                        Text('5565456679',
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: [
                        Text('Booking ID: '),
                        Text('86J8645JE75',
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                  ksizedbox10,
                  Container(
                    width: 374.w,
                    decoration: BoxDecoration(
                    ),
                    child: Text('-----------------------------------------------------------------------------------',
                    style: TextStyle(
                      color: kwhite
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 200.w,
                      child: Text('KMPL Kalaimakal Travels TN 01 BC 3432',
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),)),
                  ),
                     ksizedbox10,
                  Container(
                    width: 374.w,
                    decoration: BoxDecoration( 
                    ),
                    child: Text('-----------------------------------------------------------------------------------',
                    style: TextStyle(
                      color: kwhite
                    ),),
                  ),
                  ksizedbox20,
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('TOTAL:',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),),
                        Text('₹ 4,558.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                  )
                ],
              ),
             ),
             ksizedbox10,
             Container(
              width: 374.w,
             child: Column(
               children: [
                 Text('Bus information will be shared on the following number on the day trip of journey.',
                 style: TextStyle(
                  height: 1.5.h,
                  fontFamily: 'Proxima '
                 ),),   
               ],
             ),),
             ksizedbox20,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: (){
                    sharePdfgeneration();
                    },
                  child: Image.asset('assets/offers_icon/shareicon.png')),
                GestureDetector(
                  onTap: (){
                    generatePDF();
                  },
                  child: Image.asset('assets/offers_icon/downloadicon.png')),
                Image.asset('assets/offers_icon/cancelicon.png')
              ],
             ),
             ksizedbox10,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Share'),
                Text('Download'),
                Text('Cancel')
              ],
             ),
             ksizedbox10
            ],
           ),
         )
        ],
      ),
    );
  }

  
}

