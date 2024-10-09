import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(CalendarApp());
}

class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarHome(),
    );
  }
}

class CalendarHome extends StatefulWidget {
  @override
  _CalendarHomeState createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome> {
  // Tanggal yang dipilih, default-nya adalah hari ini
  DateTime _selectedDate = DateTime.now();

  // Fungsi untuk menampilkan Date Picker dan memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calendar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selected date:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            // Menampilkan tanggal yang dipilih dengan format yang lebih rapi
            Text(
              DateFormat('EEEE, dd MMMM yyyy').format(_selectedDate),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Tombol untuk memilih tanggal
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
          ],
        ),
      ),
    );
  }
}
