import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetailPage extends GetView<DeliveryDetailPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[800], //change your color here
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.map_outlined,
              color: Colors.grey[800],
            ),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: Colors.redAccent,
                  size: 25,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: controller.searchField,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      suffixIconConstraints: BoxConstraints(maxWidth: 20),
                      suffixIcon: Obx(() {
                        return (controller.keywords.value.length == 0)
                            ? SizedBox.shrink()
                            : GestureDetector(
                                child: Icon(
                                  Icons.cancel_rounded,
                                  size: 20,
                                  color: Colors.grey[400],
                                ),
                                onTap: controller.clearSearchField,
                              );
                      }),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Antar ke mana ?',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return (controller.keywords.value.length == 0)
            ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ink(
                      color: Colors.white,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.my_location_rounded,
                                color: Colors.grey[700],
                                size: 25,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pakai lokasi saya',
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'No.29 Perum Grand Tsamara, Perum Grand Tsamara',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    (false)
                        ? SizedBox.shrink()
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'Alamat Tersimpan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    separatorBuilder: (context, index) =>
                                        Divider(height: 1),
                                    itemBuilder: (context, index) => Material(
                                      color: Colors.white,
                                      child: ListTile(
                                        title: Text(
                                          'Ini alamat nomor $index',
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        subtitle: Text(
                                          'No.29 Perum Grand Tsamara, Perum Grand Tsamara',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        trailing: IconButton(
                                          constraints:
                                              BoxConstraints(maxWidth: 30),
                                          icon: Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.redAccent,
                                          ),
                                          onPressed: () {},
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              )
            : ListView.separated(
                itemCount: (controller.loading.value)
                    ? 5
                    : controller.suggestedPlaces.length,
                separatorBuilder: (context, index) => Divider(height: 1),
                itemBuilder: (context, index) => (controller.loading.value)
                    ? Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerLoader(
                              width: 120,
                              height: 10,
                              radius: 20,
                            ),
                            SizedBox(height: 5),
                            ShimmerLoader(
                              width: double.infinity,
                              height: 10,
                              radius: 20,
                            ),
                            SizedBox(height: 5),
                            ShimmerLoader(
                              width: double.infinity,
                              height: 10,
                              radius: 20,
                            ),
                            SizedBox(height: 5),
                            ShimmerLoader(
                              width: double.infinity,
                              height: 10,
                              radius: 20,
                            ),
                          ],
                        ),
                      )
                    : Ink(
                        color: Colors.white,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.placeName(controller
                                            .suggestedPlaces[index]
                                            .placeSuggestionDescription),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        controller.suggestedPlaces[index]
                                            .placeSuggestionDescription,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
              );
      }),
    );
  }
}
