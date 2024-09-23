// ignore_for_file: lines_longer_than_80_chars

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ortog_citas/app/core/utils/constants/app_const_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../../../../global_widgets/app_text_style.dart';
import 'app_dialog_generic.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfVistaPreviaDialog extends StatefulWidget {
  const PdfVistaPreviaDialog({super.key});

  @override
  State<PdfVistaPreviaDialog> createState() => _PdfVistaPreviaDialogState();
}

class _PdfVistaPreviaDialogState extends State<PdfVistaPreviaDialog> {
  double _scaleFactor = 1.75;
  String value = '80mm';
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black38,
      child: DialogGeneric(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConstTextApp.labelLightText(
              text: 'title',
              colorText: AppConstColors.blueSecondary,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: PdfPreview(
                maxPageWidth: (_scaleFactor * 300).clamp(100, 1500),
                onShared: (context) {},
                useActions: false,
                // actions: [Text("data")],
                // canChangeOrientation: false,
                canChangePageFormat: false,
                onZoomChanged: (value) {},
                dpi: 300,
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.zoom_in),
                            onPressed: () {
                              setState(() {
                                _scaleFactor += 0.1; // Aumenta el zoom
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.zoom_out),
                            onPressed: () {
                              setState(() {
                                _scaleFactor = (_scaleFactor > 0.1) ? _scaleFactor - 0.1 : 0.1; // Reduce el zoom
                              });
                            },
                          ),
                        ],
                      ),
                      const PdfPrintAction(),
                      PdfShareAction(icon: const Icon(Icons.remove_red_eye_sharp)),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: DropdownButton<String>(
                          dropdownColor: AppConstColors.blueSecondary,
                          items: const [
                            DropdownMenuItem<String>(
                              value: '80mm',
                              child: Text(
                                '80mm',
                                style: TextStyle(color: AppConstColors.white),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: '60mm',
                              child: Text(
                                '60mm',
                                style: TextStyle(color: AppConstColors.white),
                              ),
                            ),
                          ],
                          onChanged: (s) {
                            setState(() {
                              value = s!;
                            });
                          },
                          value: value,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ],
                enableScrollToPage: true,
                canDebug: false,
                build: (format) {
                  return show(format).save();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  pw.Document show(PdfPageFormat pdfFormat) {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'Ticket Title',
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Item 1: 10',
              ),
              pw.Text(
                'Item 2: 15',
              ),
              // Agrega más contenido aquí
            ],
          ); // Center
        },
      ),
    );
    // final ttf = await fontFromAssetBundle('assets/open-sans.ttf');

    // doc.addPage(pw.Page(build: (pw.Context context) {
    //   return pw.Center(
    //     child: pw.Text('Dart is awesome', style: pw.TextStyle(fontSize: 40)),
    //   ); // Center
    // }));
    return doc;
  }
}
