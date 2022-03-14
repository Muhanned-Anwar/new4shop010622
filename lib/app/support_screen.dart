import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'SUPPORT',
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
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Any Queries or feedback?',style: TextStyle(fontWeight: FontWeight.bold,),),
            const SizedBox(height: 17),
            Container(
              width: 335,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 33),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrangeAccent,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.phone_outlined,color: Colors.white,),
                      ),
                      const SizedBox(width: 19),
                      const Text('+1 654 982 163',style: TextStyle(fontSize: 20,color: Colors.grey),),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 335,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 33),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrangeAccent,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.message_outlined,color: Colors.white,),
                      ),
                      const SizedBox(width: 19),
                      const Text('+1 654 982 163',style: TextStyle(fontSize: 20,color: Colors.grey),),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 335,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 33),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrangeAccent,
                        ),
                        alignment: Alignment.center,
                        child: Image.asset('images/app/phone_whats-up.png'),
                      ),
                      const SizedBox(width: 19),
                      const Text('+1 654 982 163',style: TextStyle(fontSize: 20,color: Colors.grey),),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
