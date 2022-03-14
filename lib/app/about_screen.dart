import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ABOUT',
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
                height: 471,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Us',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: 289,
                      height: 397,
                      child: const Text(
                        '''Voluptates tempora tempora fugiat quidem delectus rerum. Libero et velit earum. Minus quia ab eligendi blanditiis harum sint laborum omnis. Nulla fugiat sapiente explicabo quisquam dolor excepturi.
 
Repudiandae alias quo ut. Quos non id. Sit quos maiores ad voluptatem aliquid. Blanditiis numquam aspernatur et.
 
A rerum tenetur. Vero in aut molestias labore et vel illum ut. Voluptatibus consequatur consequatur non. Dolorum aliquam eum rem natus. Aperiam possimus consequatur voluptates omnis. Ipsa non ad fugiat illum est deleniti perspiciatis id.
 
At consequuntur at dolorem cum rerum sit accusantium. Atque deleniti ratione est reprehenderit vero voluptatum magni aut. Et id fuga. Magnam quod omnis ut cupiditate et maiores quisquam ut.
 
Praesentium vel officiis est voluptatem quam voluptates incidunt. Totam nemo sapiente veniam cum alias. Facere odio nobis quo corrupti accusamus. Ratione voluptate facere quaerat quia.''',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/invite_screen');
                },
                child: const Text('INVITE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
