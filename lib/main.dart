import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  PageController? _pageController;

  void onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(onScroll);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
              imgPath: "assets/images/faisal-mosque.jpg",
              city_name: "Islamabad",
              rating: 4,
              page_no: 1,
              voters: 120000,
              description:
                  'Islamabad, the capital of Pakistan, is known for its greenery, modern architecture, and peaceful surroundings. A major highlight is the Faisal Mosque, the largest mosque in South Asia, with its unique contemporary design and scenic backdrop of the Margalla Hills.'),
          makePage(
              imgPath: "assets/images/badshahi.jpg",
              city_name: "Lahore",
              rating: 4,
              page_no: 2,
              voters: 150000,
              description:
                  'Lahore, the cultural capital of Pakistan, is famed for its rich history, lively bazaars, and Mughal-era architecture. The Badshahi Mosque, one of the largest mosques in the world, is a stunning example of Mughal craftsmanship and a key attraction in the city.'),
          makePage(
              imgPath: "assets/images/Karachi.jpg",
              city_name: "Karachi",
              page_no: 3,
              voters: 240000,
              rating: 4,
              description:
                  "Karachi, Pakistan's largest city and financial hub, is a vibrant coastal metropolis. One of its iconic landmarks is the Mazar-e-Quaid, the mausoleum of Pakistan’s founder, Quaid-e-Azam Muhammad Ali Jinnah, symbolizing the city's historical and cultural importance."),
          makePage(
              imgPath: "assets/images/sialkot.jpg",
              city_name: "Sialkot",
              rating: 5,
              page_no: 4,
              voters: 104000,
              description:
                  "Sialkot is an industrial hub in Pakistan, known for its production of high-quality sports goods, surgical instruments, and leather products. It is famous for being the birthplace of poet and philosopher Allama Iqbal and for its international reputation in sports equipment manufacturing, especially footballs.")
        ],
      ),
    );
  }
}

Widget makePage(
    {required String imgPath,
    required String city_name,
    required int rating,
    required int page_no,
    required int voters,
    required String description}) {
  return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            0.3,
            0.9
          ], colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]),
        ),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      page_no.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('/4',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      city_name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        ...List.generate(5, (index) {
                          return getstar(
                            color: index < rating ? Colors.yellow : Colors.grey,
                          );
                        }),
                        Text(
                          rating.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '(${voters.toString()})',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 20, color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('READ MORE',
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
              ],
            )),
      ));
}

Widget getstar({required Color color}) {
  return Container(
      margin: const EdgeInsets.all(3.0),
      child: Icon(
        Icons.star,
        color: color,
      ));
}
