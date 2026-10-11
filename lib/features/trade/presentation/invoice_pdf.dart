import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';

/// Builds a printable/shareable invoice PDF for a recorded sale — there is
/// no view/share option on the legacy app either, so this lays out a plain
/// invoice (party, line items, tax breakup, total) from the data already
/// captured by [TradeRepository.addSale].
Future<Uint8List> buildSaleInvoicePdf({
  required SalesTableData sale,
  required TradersTableData trader,
  required List<SalesLineItemsTableData> lines,
}) async {
  final doc = pw.Document();

  final cgstAmount = sale.taxableValue * sale.cgstPercent / 100;
  final sgstAmount = sale.taxableValue * sale.sgstPercent / 100;
  final igstAmount = sale.taxableValue * sale.igstPercent / 100;

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'INVOICE',
              style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 8),
            pw.Text('Invoice No: ${sale.salesCode}'),
            pw.Text(
              'Date: ${sale.saleDate.year}-${sale.saleDate.month.toString().padLeft(2, '0')}-${sale.saleDate.day.toString().padLeft(2, '0')}',
            ),
            if (sale.reversed)
              pw.Text(
                'REVERSED',
                style: pw.TextStyle(color: PdfColors.red, fontWeight: pw.FontWeight.bold),
              ),
            pw.SizedBox(height: 16),
            pw.Text('Billed To', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text(trader.traderName),
            if (trader.address != null && trader.address!.isNotEmpty) pw.Text(trader.address!),
            if (trader.city != null && trader.city!.isNotEmpty) pw.Text('${trader.city}, ${trader.state ?? ''} ${trader.pincode ?? ''}'),
            if (trader.gstin != null && trader.gstin!.isNotEmpty) pw.Text('GSTIN: ${trader.gstin}'),
            if (trader.phone != null && trader.phone!.isNotEmpty) pw.Text('Phone: ${trader.phone}'),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              headers: ['Product', 'Unit', 'Qty', 'Price', 'Amount'],
              data: lines
                  .map(
                    (l) => [
                      l.productName,
                      l.unit,
                      l.qty.toStringAsFixed(3),
                      MoneyFormat.plain(l.priceOfProduct),
                      MoneyFormat.plain(l.taxableValue),
                    ],
                  )
                  .toList(),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignments: {
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            pw.SizedBox(height: 20),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Taxable Value: ${MoneyFormat.plain(sale.taxableValue)}'),
                  if (sale.cgstPercent > 0)
                    pw.Text('CGST (${sale.cgstPercent}%): ${MoneyFormat.plain(cgstAmount)}'),
                  if (sale.sgstPercent > 0)
                    pw.Text('SGST (${sale.sgstPercent}%): ${MoneyFormat.plain(sgstAmount)}'),
                  if (sale.igstPercent > 0)
                    pw.Text('IGST (${sale.igstPercent}%): ${MoneyFormat.plain(igstAmount)}'),
                  pw.SizedBox(height: 6),
                  pw.Divider(),
                  pw.Text(
                    'Total: Rs. ${MoneyFormat.plain(sale.totalAfterTax)}',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  return doc.save();
}
