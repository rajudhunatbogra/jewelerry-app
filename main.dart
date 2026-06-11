import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'জুয়েলারি বিক্রয় ও হিসাব',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: SalesPage(),
    );
  }
}

class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController totalWagesController = TextEditingController();
  final TextEditingController voriWagesController = TextEditingController();
  final TextEditingController customKhathController = TextEditingController();

  final TextEditingController voriController = TextEditingController();
  final TextEditingController anaController = TextEditingController();
  final TextEditingController ratiController = TextEditingController();
  final TextEditingController pointController = TextEditingController();
  final TextEditingController gramController = TextEditingController();

  String selectedKhath = 'উৎপাদিত নতুন গহনা';
  final List<String> khathOptions = [
    'উৎপাদিত নতুন গহনা',
    'কেনা নতুন গহনা',
    'পুরাতন গহনা',
    'বন্ধকী গহনা',
    'অন্যান্য খাত (নিচে লিখুন)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('জুয়েলারি বিক্রয় ও হিসাব', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(controller: nameController, decoration: InputDecoration(labelText: 'ক্রেতার নাম', icon: Icon(Icons.person))),
                    TextField(controller: addressController, decoration: InputDecoration(labelText: 'ঠিকানা', icon: Icon(Icons.location_on))),
                    TextField(controller: phoneController, decoration: InputDecoration(labelText: 'মোবাইল নাম্বার', icon: Icon(Icons.phone)), keyboardType: TextInputType.phone),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  label: Text('পণ্যের ছবি', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.credit_card, color: Colors.white),
                  label: Text('বিক্রেতার আইডি', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('পণ্যের ওজন হিসাব:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(child: TextField(controller: voriController, decoration: InputDecoration(labelText: 'ভরি', border: OutlineInputBorder()), keyboardType: TextInputType.number)),
                SizedBox(width: 4),
                Expanded(child: TextField(controller: anaController, decoration: InputDecoration(labelText: 'আনা', border: OutlineInputBorder()), keyboardType: TextInputType.number)),
                SizedBox(width: 4),
                Expanded(child: TextField(controller: ratiController, decoration: InputDecoration(labelText: 'রতি', border: OutlineInputBorder()), keyboardType: TextInputType.number)),
                SizedBox(width: 4),
                Expanded(child: TextField(controller: pointController, decoration: InputDecoration(labelText: 'পয়েন্ট', border: OutlineInputBorder()), keyboardType: TextInputType.number)),
                SizedBox(width: 4),
                Expanded(child: TextField(controller: gramController, decoration: InputDecoration(labelText: 'গ্রাম', border: OutlineInputBorder()), keyboardType: TextInputType.number)),
              ],
            ),
            SizedBox(height: 15),
            TextField(controller: rateController, decoration: InputDecoration(labelText: 'সোনার দর (প্রতি ভরি)', prefixIcon: Icon(Icons.monetization_on)), keyboardType: TextInputType.number),
            TextField(controller: voriWagesController, decoration: InputDecoration(labelText: 'ভরি প্রতি মজুরি', prefixIcon: Icon(Icons.add_task)), keyboardType: TextInputType.number),
            TextField(controller: totalWagesController, decoration: InputDecoration(labelText: 'মোট মজুরি', prefixIcon: Icon(Icons.calculate)), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            Text('বিক্রয়ের খাত সিলেক্ট করুন:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            DropdownButton<String>(
              value: selectedKhath,
              isExpanded: true,
              items: khathOptions.map((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) {
                setState(() { selectedKhath = newValue!; });
              },
            ),
            if (selectedKhath == 'অন্যান্য খাত (নিচে লিখুন)')
              TextField(controller: customKhathController, decoration: InputDecoration(labelText: 'নতুন খাতের নাম লিখুন')),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('বিক্রয় নিশ্চিত করুন ও মেমো তৈরি করুন', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
