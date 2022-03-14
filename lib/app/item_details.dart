import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new4shop010622/Widgets/page_view_indicator.dart';
import 'package:new4shop010622/models/review.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late PageController _pageController;
  int currentPageIndex = 0;
  bool isFavorite = false;

  bool isDetails = true;
  bool isReviews = false;
  double itemHeight = 95;
  late double reviewHeight;
  late int counter;

  int numQuantity = 1;

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
    _pageController = PageController(initialPage: 0);
    counter = 3;
    reviewHeight = itemHeight * counter + 120;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                SizedBox(
                  width: double.infinity,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    children: [
                      Image.asset(
                        'images/app/details/spray_details.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'images/app/details/spray_details.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'images/app/details/spray_details.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'images/app/details/spray_details.png',
                        fit: BoxFit.fill,
                      ),
                    ],
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
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          icon: isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.white.withOpacity(0.5),
                                  size: 40,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 40,
                                ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PageViewIndicator(
                              selected: currentPageIndex == 0,
                              color: Colors.white,
                              elseColor: Colors.white.withOpacity(0.6),
                            ),
                            const SizedBox(width: 8),
                            PageViewIndicator(
                              selected: currentPageIndex == 1,
                              color: Colors.white,
                              elseColor: Colors.white.withOpacity(0.6),
                            ),
                            const SizedBox(width: 8),
                            PageViewIndicator(
                              selected: currentPageIndex == 2,
                              color: Colors.white,
                              elseColor: Colors.white.withOpacity(0.6),
                            ),
                            const SizedBox(width: 8),
                            PageViewIndicator(
                              selected: currentPageIndex == 3,
                              color: Colors.white,
                              elseColor: Colors.white.withOpacity(0.6),
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
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
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
                      'REVIEWS',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: isDetails,
            child: buildContainerDetails(),
            replacement: buildContainerReviews(),
          )
        ],
      ),
    );
  }

  Container buildContainerReviews() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 23, right: 23, top: 23),
      child: Column(
        children: [
          SizedBox(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Text(
                                        '(' +
                                            reviews[index].numStars.toString() +
                                            ')',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
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
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
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
                minimumSize: const Size(260, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                primary: Colors.deepOrangeAccent,
              ),
              onPressed: () {},
              child: const Text('Add Review',style: TextStyle(fontSize: 15,),),
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainerDetails() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
                      'SPRAY',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: EdgeInsets.zero,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade800,
                            size: 16,
                          ),
                          const Text(
                            '(5.0) ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            '26 orders',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  '\$5.35',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
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
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 32,
                  width: 110,
                  padding: const EdgeInsets.only(
                    top: 6,
                    bottom: 5,
                    // left: 8,
                    // right: 7,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (numQuantity > 1) {
                              numQuantity--;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        numQuantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            numQuantity++;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Description ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 11),
          const SizedBox(
            width: 330,
            height: 65,
            child: Text(
              'Exercitationem neque aut architecto eum. '
              'Ea blanditiis aliquid odit ipsa. Alias qui minus quia similique voluptas'
              ' sit doloremque. Harum eaque officia reiciendis '
              'sit beatae voluptatem. Inventore sequi expedita maiores aliquid et pariatur.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
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
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrangeAccent),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'PRICE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(155, 50),
                      primary: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: const Text('Add to Cart'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(155, 50),
                      primary: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/check_out');
                  },
                  child: const Text('Checkout'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
