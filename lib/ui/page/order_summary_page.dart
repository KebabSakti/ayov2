import 'package:flutter/material.dart';

class OrderSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Pengiriman',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Julian Aryo',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '(+6281254982664)',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text('Perumahan Grand Tsamara, No 27'),
                  ],
                ),
                SizedBox.fromSize(
                  size: Size(30, 30),
                  child: ClipOval(
                    child: Material(
                      color: Colors.amber,
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Icon(
                            Icons.edit_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Masuk ikut jalan aspal, di rumah ujung ke dua dari kanan',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 8,
        color: Colors.grey[100],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ringkasan Belanja',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          itemCount: _widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return _widgets[index];
          },
        ),
      ),
    );
  }
}
