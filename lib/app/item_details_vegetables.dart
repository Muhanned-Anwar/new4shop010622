import 'package:flutter/material.dart';
import 'package:new4shop010622/Widgets/page_view_indicator.dart';
import 'package:new4shop010622/models/review.dart';

class ItemDetailsVegetables extends StatefulWidget {
  const ItemDetailsVegetables({Key? key}) : super(key: key);

  @override
  _ItemDetailsVegetablesState createState() => _ItemDetailsVegetablesState();
}

class _ItemDetailsVegetablesState extends State<ItemDetailsVegetables> {
  bool isDetails = true;
  bool isReviews = false;
  double itemHeight = 95;
  late double reviewHeight;
  late int counter;


  List<Review> reviews = [
    Review(
        id: 0,
        name: 'Mohammed Herez',
        imgPath: 'images/app/img_profile.png',
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Herez',
        imgPath: 'images/app/img_profile.png',
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Herez',
        imgPath: 'images/app/img_profile.png',
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Herez',
        imgPath: 'images/app/img_profile.png',
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Herez',
        imgPath: 'images/app/img_profile.png',
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
    Review(
        id: 0,
        name: 'Mohammed Herez',
        imgPath: 'images/app/img_profile.png',
        numStars: 5.0,
        time: '2',
        content: 'Exercitationem neque aut architecto eum. '
            'Ea blanditiis aliquid odit ipsa. Alias qui minus '
            'quia similique voluptas sit doloremque. '
            'Harum eaque officia reiciendis sit beatae voluptatem.'
            ' Inventore sequi expedita maiores aliquid et pariatur.'),
  ];

  @override
  void initState() {
    super.initState();
    counter = 3;
    reviewHeight = itemHeight * counter + 120;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 34,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ITEM DETAILS',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            width: 376,
            height: 316,
            child: Stack(
              children: [

                // Background Image
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'images/app/details/vegetable_details.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15, top: 5),
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white.withOpacity(0.5),
                            size: 40,
                          ),
                        ),
                      ),

                      // Points Indicator
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const PageViewIndicator(
                              selected: true,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            PageViewIndicator(
                              selected: true,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            SizedBox(width: 8),
                            PageViewIndicator(
                              selected: true,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            const SizedBox(width: 8),
                            PageViewIndicator(
                              selected: true,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 57,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: isDetails
                            ? Colors.transparent
                            : Colors.grey.shade300,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey.shade300))),
                    onPressed: () {
                      setState(() {
                        isDetails = true;
                        isReviews = false;
                      });
                    },
                    child: const Text(
                      'DETAILS',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 57,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: isReviews
                            ? Colors.transparent
                            : Colors.grey.shade300,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey.shade300))),
                    onPressed: () {
                      setState(() {
                        isDetails = false;
                        isReviews = true;
                      });
                    },
                    child: const Text(
                      'Reviews',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: isDetails,
            child: buildContainerDetails(),
            replacement: Container(
              margin: const EdgeInsets.only(
                  bottom: 5, left: 23, right: 23, top: 23),
              child: Column(
                children: [
                  Container(
                    height: reviewHeight,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 335,
                          height: itemHeight,
                          margin: const EdgeInsets.symmetric(vertical: 18),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: Image.asset(
                                          reviews[index].imgPath,
                                          width: 38,
                                          height: 38,
                                        ),
                                        backgroundColor: Colors.grey,
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            reviews[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade700,
                                                size: 20,
                                              ),
                                              Text('(' +
                                                  reviews[index]
                                                      .numStars
                                                      .toString() +
                                                  ')'),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                      ),
                                      child: Text(
                                        reviews[index].time + 'min',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              SizedBox(
                                  width: 330,
                                  height: 46,
                                  child: Text(
                                    reviews[index].content!,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 10, color: Colors.grey),
                  Visibility(
                    visible: counter < reviews.length,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          setState(() {
                            if (counter < reviews.length) {
                              reviewHeight += itemHeight + 30;
                              counter++;
                            }
                          });
                        },
                        child: Column(
                          children: const [
                            Text(
                              'more',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(260,50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {},
                      child: const Text('Add Review'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildContainerDetails() {
    return Container(
      margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CUCUMBER',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: EdgeInsets.zero,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 16,
                          ),
                          Text('(5.0)'),
                          Text('26 orders'),
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  '\$4',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quantity',
                  style:
                      TextStyle(color: Colors.deepOrangeAccent, fontSize: 14),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline_outlined,color: Colors.black26,size: 22,),
                      ),
                      const Text(
                        ' 1 ',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('images/app/details/plus.png'),
                      ),
                    ],
                  ),
                )
              ],
            ),

          ),

          const SizedBox(height: 20),
          const Text(
            'Estimate',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 330,
            height: 65,
            child: Text(
              'About 0.19kg x \$5.35/kg = \$2.00',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),

          const Text(
            'Description ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 330,
            height: 65,
            child: Text(
              'Exercitationem neque aut architecto eum. '
              'Ea blanditiis aliquid odit ipsa. Alias qui minus quia similique voluptas'
              ' sit doloremque. Harum eaque officia reiciendis '
              'sit beatae voluptatem. Inventore sequi expedita maiores aliquid et pariatur.',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Notes ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const TextField(
            cursorColor: Colors.deepOrangeAccent,
            decoration: InputDecoration(
                labelText: 'Write here',
                labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrangeAccent))),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'PRICE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$5.35',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(155, 50),
                    primary: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(155, 50),
                    primary: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
