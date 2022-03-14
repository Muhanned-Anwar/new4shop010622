import 'package:flutter/material.dart';
import 'package:new4shop010622/models/notification.dart';

class NotificationsScreenBusiness extends StatefulWidget {
  const NotificationsScreenBusiness({Key? key}) : super(key: key);

  @override
  _NotificationsScreenBusinessState createState() => _NotificationsScreenBusinessState();
}

class _NotificationsScreenBusinessState extends State<NotificationsScreenBusiness> {
  final List<NotificationAlarm> _notifications = [
    NotificationAlarm(id: 0, time: '02:00 am', name: 'Green Market', checked: true),
    NotificationAlarm(id: 0, time: '02:00 am', name: ' Circle Restaurant ', checked: false),
    NotificationAlarm(id: 0, time: '02:00 am', name: 'Green Market', checked: false),
    NotificationAlarm(id: 0, time: '02:00 am', name: ' Circle Restaurant ', checked: true),
    NotificationAlarm(id: 0, time: '02:00 am', name: ' Circle Restaurant ', checked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'NOTIFICATIONS',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: _notifications.isEmpty
          ? Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('images/app/disable-alarm.png'),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No Notifications',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 25, left: 22, top: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Your order ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      _notifications[index].name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      ' is completed',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _notifications[index].time,
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                _notifications[index].checked
                                    ? Icons.check_circle
                                    : Icons.check_circle_outline,
                                color: Colors.deepOrangeAccent,
                                size: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                       Divider(color: Colors.grey.shade300),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
