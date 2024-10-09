import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart'; // Digunakan untuk memformat tanggal
import 'package:flutter_calender/main.dart'; // Pastikan path ini sesuai dengan struktur project Anda

void main() {
  // Pengujian widget untuk aplikasi kalender
  testWidgets('Initial date is displayed correctly',
      (WidgetTester tester) async {
    // Membangun aplikasi
    await tester.pumpWidget(CalendarApp());

    // Mengambil tanggal saat ini untuk pengujian
    final String expectedDate =
        DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());

    // Verifikasi bahwa tanggal awal yang ditampilkan adalah tanggal hari ini
    expect(find.text(expectedDate), findsOneWidget);
  });

  testWidgets('Date picker opens and allows date selection',
      (WidgetTester tester) async {
    // Membangun aplikasi
    await tester.pumpWidget(CalendarApp());

    // Menekan tombol 'Select Date'
    final selectDateButton = find.text('Select Date');
    expect(selectDateButton, findsOneWidget);

    // Simulasi menekan tombol 'Select Date'
    await tester.tap(selectDateButton);
    await tester.pumpAndSettle();

    // Verifikasi bahwa dialog date picker muncul
    expect(find.byType(DatePickerDialog), findsOneWidget);

    // Pilih tanggal dari DatePicker (misalnya 1 Januari 2025)
    await tester.tap(find.text('1'));
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verifikasi bahwa tanggal yang dipilih sekarang ditampilkan
    final selectedDate =
        DateFormat('EEEE, dd MMMM yyyy').format(DateTime(2025, 1, 1));
    expect(find.text(selectedDate), findsOneWidget);
  });
}
