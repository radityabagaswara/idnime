import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sch/class/AnimObj.dart';
import 'package:sch/screens/animdetail.dart';

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
          poster: "https://is3.cloudhost.id/anilist/emishadow_poster.jpg",
          imageCover: "https://is3.cloudhost.id/anilist/emishadow_image.png"));

      animeObjs.add(AnimeObject(
          id: 2,
          name: "Tensei Oujo to Tensai Reijou no Mahou Kakumei",
          poster: "https://is3.cloudhost.id/anilist/kakumei_poster.jpg",
          imageCover: "https://is3.cloudhost.id/anilist/kakumei_image.png"));
      animeObjs.add(AnimeObject(
          id: 3,
          name: "Kubo-san wa Mob wo Yurusanai",
          poster: "https://is3.cloudhost.id/anilist/kubo_poster.jpg",
          imageCover: "https://is3.cloudhost.id/anilist/kubo_image.jpg"));
      animeObjs.add(AnimeObject(
          id: 4,
          name:
              "Eiyuu-ou, Bu wo Kiwameru Tame Tenseisu: Soshite, Sekai Saikyou no Minarai Kishi♀",
          poster: "https://is3.cloudhost.id/anilist/eiyu_poster.jpg",
          imageCover: "https://is3.cloudhost.id/anilist/eiyu_image.jpg"));
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
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 198, child: sliderAnime(animeObjs)),
            const Padding(
                padding: EdgeInsets.fromLTRB(10, 24, 8, 5),
                child: Text("Popular Title This Season",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 24))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 20,
                  childAspectRatio: 9 / 13,
                ),
                itemCount: animeObjs.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AnimeDetail()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          animeObjs[index].poster))),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(animeObjs[index].name,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ));
                },
              ),
            ),
          ]),
        ));
  }

  Widget sliderAnime(List<AnimeObject> animeObjs) {
    return (CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.95,
        initialPage: 2,
        height: 198,
      ),
      itemCount: animeObjs.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: SliderCard(animeObjs[index], context),
        );
      },
    ));
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
              width: MediaQuery.of(context).size.width),
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
