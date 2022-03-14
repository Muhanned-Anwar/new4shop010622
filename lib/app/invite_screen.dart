import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new4shop010622/utils/helpers.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> with Helpers {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'INVITE',
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              Image.asset(
                'images/app/new4Shop.png',
              ),
              const SizedBox(height: 10),
              const Text(
                'New4Shop',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 21),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 297,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Invite your friends',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 27),
                    Row(
                      children: [
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child: Image.asset('images/app/invite/skype.png'),
                          ),
                        ),
                        const Spacer(flex: 1),
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child: Image.asset('images/app/invite/gmail.png'),
                          ),
                        ),
                        const Spacer(flex: 1),
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child: Image.asset('images/app/invite/twitter.png'),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child:
                                Image.asset('images/app/invite/facebook.png'),
                          ),
                        ),
                        const Spacer(flex: 1),
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child: Image.asset('images/app/invite/google.png'),
                          ),
                        ),
                        const Spacer(flex: 1),
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child: Image.asset('images/app/invite/whatsup.png'),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),
                    Row(
                      children: [
                        PhysicalModel(
                          color: Colors.white,
                          elevation: 10,
                          shape: BoxShape.circle,
                          child: SizedBox(
                            width: 57,
                            height: 57,
                            child:
                                Image.asset('images/app/invite/messenger.png'),
                          ),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 64,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset(
                      'images/app/invite/external-link.png',
                      filterQuality: FilterQuality.high,
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 14,
                      child: Container(
                        height: 32,
                        width: 182,
                        padding: const EdgeInsets.only(left: 12),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text('http://fgtyjmiuyn6yt'),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: 32,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),
                          onPressed: () {
                            Clipboard.setData(const ClipboardData(text:'http://fgtyjmiuyn6yt' ));
                            showSnackBar(context: context, message: 'copy text',marginHorizontal: 80);
                            },
                          child: const Text(
                            'Copy Link',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
