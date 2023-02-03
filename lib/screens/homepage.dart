import 'package:flutter/material.dart';
import 'package:sch/class/AnimObj.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<AnimeObject> animeObjs = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      animeObjs.add(AnimeObject(
          id: 1,
          name: "The Eminance of Shadow",
          imageCover:
              "https://static.wikia.nocookie.net/to-be-a-power-in-the-shadows/images/c/c8/The_Eminence_in_Shadow_Anime_Visual.png"));

      animeObjs.add(AnimeObject(
          id: 2,
          name: "Tensei Oujo to Tensai Reijou no Mahou Kakumei",
          imageCover:
              "https://assets.promediateknologi.com/crop/0x0:0x0/0x0/webp/photo/2022/12/12/3379382135.jpg"));
      animeObjs.add(AnimeObject(
          id: 3,
          name: "Kubo-san wa Mob wo Yurusanai",
          imageCover:
              "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/07/16/1570976228.jpg"));
      animeObjs.add(AnimeObject(
          id: 4,
          name:
              "Eiyuu-ou, Bu wo Kiwameru Tame Tenseisu: Soshite, Sekai Saikyou no Minarai Kishi♀",
          imageCover:
              "https://mediaformasi.com/content/images/2020/11/hero-king-fix.jpg"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "IDNIME",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 2),
        ),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(children: [
        SizedBox(height: 198, child: sliderAnime(animeObjs)),
      ]),
    );
  }

  Widget sliderAnime(List<AnimeObject> animeObjs) {
    return (ListView.builder(
        itemCount: animeObjs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Align(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 12,
              child: (Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SliderCard(animeObjs[index], context),
              )),
            ),
          );
        }));
  }
}

Widget SliderCard(AnimeObject anim, BuildContext context) {
  return (Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ).createShader(rect);
          },
          blendMode: BlendMode.multiply,
          child: Image.network(anim.imageCover,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width - 18),
        ),
      ),
      Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            anim.name.length > 32
                ? "${anim.name.substring(0, 32)}..."
                : anim.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ))
    ],
  ));
}
