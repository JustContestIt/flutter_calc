import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../models/data.dart';

Future<Uint8List> makePdf(Data data) async {
  final pdf = Document();
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Container(height: 50),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    Padding(
                      child: Text(
                        'Company: ${data.company}',
                        style: Theme.of(context).header4,
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                    Padding(
                      child: Text(
                        'Model:  ${data.model}',
                        style: Theme.of(context).header4,
                        textAlign: TextAlign.left,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
                ...data.items.map(
                  (e) => TableRow(
                    children: [
                      Expanded(
                        child: PaddedText(e.description),
                        flex: 2,
                      ),
                      Expanded(
                        child: PaddedText("${e.value} ${e.unit}"),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
