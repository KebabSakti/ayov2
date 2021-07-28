import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detail Pengiriman',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    child: Icon(
                      Icons.location_on_rounded,
                      color: Colors.redAccent,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Julian Aryo',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '+6281254982664',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas accumsan malesuada gravida. Integer in ante leo. Vivamus orci diam, varius eget placerat ac, pretium nec est',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      (false)
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.redAccent,
                                    width: 4,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Masuk ikut jalan aspal, di rumah ujung ke dua dari kanan',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ),
                      SizedBox(height: 10),
                      DeliveryGroup(
                        color: Colors.redAccent,
                        name: 'PENGIRIMAN LANGSUNG',
                        distance: '5 km',
                        price: '12000',
                        time: 'Langsung',
                        helpButton: () {},
                      ),
                      SizedBox(height: 10),
                      DeliveryGroup(
                        color: Colors.amber,
                        name: 'PENGIRIMAN TERJADWAL',
                        distance: '10 km',
                        price: '10000',
                        time: '10:00 AM',
                        helpButton: () {},
                        timeButton: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: 8,
        color: Colors.grey[100],
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Produk yang dibeli',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: CachedNetworkImage(
                          imageUrl: 'https://placekitten.com/1000',
                          placeholder: (context, url) => ShimmerLoader(),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bakso frozen ummu hafidz',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                              ),
                              children: [
                                TextSpan(
                                  text: 'Rp 20.000',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: '  ( 1 kg )',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ProductDeliveryType(
                            name: 'PENGIRIMAN LANGSUNG',
                            color: Colors.redAccent,
                          ),
                          SizedBox(height: 10),
                          (false)
                              ? SizedBox.shrink()
                              : Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.redAccent,
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Ayamnya potong 12 ya',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: CachedNetworkImage(
                          imageUrl: 'https://placekitten.com/1000',
                          placeholder: (context, url) => ShimmerLoader(),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wortel impor malaysia',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                              ),
                              children: [
                                TextSpan(
                                  text: 'Rp 30.000',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: '  ( 3 kg )',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ProductDeliveryType(
                            name: 'PENGIRIMAN TERJADWAL',
                            color: Colors.amber,
                          ),
                          SizedBox(height: 4),
                          TextField(
                            textAlign: TextAlign.left,
                            showCursor: true,
                            cursorColor: Colors.grey[800],
                            cursorWidth: 1,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Tambah Catatan',
                              isDense: true,
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 2,
                              ),
                            ),
                            onSubmitted: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[200],
                  height: 30,
                ),
                ExpandablePanel(
                  // ignore: deprecated_member_use
                  hasIcon: false,
                  header: Text(
                    'Tampilkan Semua',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                  expanded: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Divider(
                        color: Colors.grey[200],
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 60,
                              height: 60,
                              child: CachedNetworkImage(
                                imageUrl: 'https://placekitten.com/1000',
                                placeholder: (context, url) => ShimmerLoader(),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bakso frozen ummu hafidz',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Rp 20.000',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  ( 1 kg )',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                ProductDeliveryType(
                                  name: 'PENGIRIMAN LANGSUNG',
                                  color: Colors.redAccent,
                                ),
                                SizedBox(height: 10),
                                (false)
                                    ? SizedBox.shrink()
                                    : Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50],
                                          border: Border(
                                            left: BorderSide(
                                              color: Colors.redAccent,
                                              width: 4,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Ayamnya potong 12 ya',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[200],
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: 60,
                              height: 60,
                              child: CachedNetworkImage(
                                imageUrl: 'https://placekitten.com/1000',
                                placeholder: (context, url) => ShimmerLoader(),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wortel impor malaysia',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 6),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Rp 30.000',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  ( 3 kg )',
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                ProductDeliveryType(
                                  name: 'PENGIRIMAN TERJADWAL',
                                  color: Colors.amber,
                                ),
                                SizedBox(height: 4),
                                TextField(
                                  textAlign: TextAlign.left,
                                  showCursor: true,
                                  cursorColor: Colors.grey[800],
                                  cursorWidth: 1,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Tambah Catatan',
                                    isDense: true,
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 2,
                                    ),
                                  ),
                                  onSubmitted: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: 8,
        color: Colors.grey[100],
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cash On Delivery',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          'Bayar di rumah ketika barang sampai',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://res.cloudinary.com/vjtechsolution/image/upload/v1627400333/ayo%20mobile/cod_edit.png',
                      height: 30,
                      placeholder: (context, url) =>
                          ShimmerLoader(radius: 6, width: 50, height: 30),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      Divider(height: 1),
      Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.verified_rounded,
              color: Colors.green,
            ),
            SizedBox(width: 10),
            Text(
              'Pakai voucher lebih murah',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
      Divider(height: 1),
      Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian Biaya',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Belanja',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(Utility().currency('100000')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongkos Kirim',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  Utility().currency('12000'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Biaya Admin',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.help_rounded,
                      size: 16,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
                Text(
                  Utility().currency('4500'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 1),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Potongan Voucher',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '- ' + Utility().currency('0'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pakai Poin',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '1000',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '- ' + Utility().currency('1000'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 1),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Bayar',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  Utility().currency('100000'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 70),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Konfirmasi Pesanan',
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
      bottomSheet: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.grey[200],
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Bayar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  Utility().currency('100000'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            FlatButton(
              onPressed: () {},
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Get.theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Buat Pesanan',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
