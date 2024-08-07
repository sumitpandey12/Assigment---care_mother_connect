import 'package:care_mother_connect/pages/NavDrawer/NavDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String profileUrl =
        "https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d29tYW58ZW58MHx8MHx8fDA%3D";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal),
                  shape: BoxShape.circle),
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  profileUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Text(error.toString()),
                ),
              ),
            ),
          );
        }),
        title: Text(
          "Sumit Pandey",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(10)),
            child: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
          Badge(
            smallSize: 20,
            label: Text('1'),
            offset: Offset(-8, 0),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      drawer: NavDrawer(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CarouselWidget(
              imgList: [
                "https://plus.unsplash.com/premium_photo-1665203537276-7b6aa3164730?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "https://plus.unsplash.com/premium_photo-1661274027494-1d556441e1c4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bW90aGVyfGVufDB8fDB8fHww",
                "https://images.unsplash.com/photo-1457342813143-a1ae27448a82?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fG1vdGhlcnxlbnwwfHwwfHx8MA%3D%3D"
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GridWidget(),
            SizedBox(
              height: 20,
            ),
            StatisticsWidget(),
          ],
        ),
      ),
    );
  }
}

class CarouselWidget extends StatelessWidget {
  final List<String> imgList;
  const CarouselWidget({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imgList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          height: MediaQuery.of(context).size.height * 0.15,
        ));
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<StaggeredGridTile> items = <StaggeredGridTile>[
      const StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 3,
        child: CardWidget(
          height: 0.1,
          title: "Fetomax Tracking",
          description: "Realtime Non Stress Test",
          imageUrl:
              "https://images.agoramedia.com/wte3.0/gcms/Nonstress-Test-722x406.jpg",
          cardColor: Colors.blue,
        ),
      ),
      const StaggeredGridTile.count(
        crossAxisCellCount: 2,
        mainAxisCellCount: 2,
        child: CardWidget(
          height: 0.07,
          title: "BabyBeat",
          imageUrl: "https://i.ytimg.com/vi/7E4Gia9arcU/maxresdefault.jpg",
          description: "Track baby's beat",
          cardColor: Colors.teal,
        ),
      ),
      StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 3,
          child: CardWidget(
            height: 0.1,
            title: "UTI Test",
            description: "Take UTI and get report instantly",
            imageUrl:
                "https://www.utivahealth.com/cdn/shop/articles/whats-the-most-effective-uti-test-261429.jpg?v=1691605281",
            cardColor: Colors.red.shade400,
          )),
      const StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: CardWidget(
            height: 0.07,
            imageUrl:
                "https://5.imimg.com/data5/SELLER/Default/2023/3/296994524/BW/TE/WV/5277466/apneboot.jpg",
            title: "Apne Boot",
            description: "Live ApneBoot Device Monitoring",
          )),
    ];

    return StaggeredGrid.count(
        crossAxisCount: 4, crossAxisSpacing: 10, children: items);
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final Color? cardColor;
  final Color? textColor;
  final double height;
  const CardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.cardColor,
    this.textColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? Colors.teal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: textColor ?? Colors.white),
            ),
            Text(
              description,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                fontSize: 14,
                color: textColor ?? Colors.white,
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  height: MediaQuery.of(context).size.height * height,
                  width: double.maxFinite,
                  imageUrl,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }
}

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.teal.shade100, width: 1)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatisticsItemWidget(
                icon: Entypo.chart_line,
                title: "Total Tests",
                unit: "",
                value: 120,
              ),
              StatisticsItemWidget(
                icon: Entypo.water,
                title: "Total UTI",
                unit: "",
                value: 120,
              ),
            ],
          ),
        ),
        Positioned(
          left: 50,
          top: -5,
          child: Container(
            padding: EdgeInsets.only(bottom: 0, left: 5, right: 5, top: 1),
            color: Colors.white,
            child: Text(
              'Statistics',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

class StatisticsItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int value;
  final Color? color;
  final String unit;
  const StatisticsItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.value,
      this.color,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color ?? Colors.teal.shade50,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(icon),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 36,
                ),
              ),
              Text(
                unit,
                style: GoogleFonts.poppins(
                    fontSize: 22, color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
