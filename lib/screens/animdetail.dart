import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetail extends StatefulWidget {
  const AnimeDetail({super.key});

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  bool _infoExpanded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: Container(
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(""),
                    background: ClipRRect(
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8)
                            ],
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.multiply,
                        child: Image.network(
                            "https://is3.cloudhost.id/anilist/kakumei_image.png",
                            height: 300,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width),
                      ),
                    ),
                  ),
                  expandedHeight: MediaQuery.of(context).size.height * 0.35,
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Center(
                      child: Text(
                    "Airing • TV • Winter 2023",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                    child: Center(
                      child: Text(
                        "Tensei Oujo to Tensai Reijou no Mahou Kakumei",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: const [
                                Text(
                                  "Episodes",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "9/12",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Column(
                              children: const [
                                Text(
                                  "Category",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Fantasy",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Column(
                              children: const [
                                Text(
                                  "Rating",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "8.5/10",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 20, 5),
                    child: Text(
                      "Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Text(
                      "Despite her supposed ineptitude with regular magic, Princess Anisphia defies the aristocracy’s expectations by developing “magicology,” a unique magical theory based on memories from her past life. One day, she witnesses the brilliant noblewoman Euphyllia unjustly stripped of her title as the kingdom’s next monarch. That’s when Anisphia concocts a plan to help Euphyllia regain her good name-which somehow involves them living together and researching magic! Little do these two ladies know, however, that their chance encounter will alter not only their own futures, but those of the kingdom...and the entire world!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  _infoExpanded
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8),
                          child: ShowInfo(),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _infoExpanded = !_infoExpanded;
                          });
                        },
                        child: Text(_infoExpanded
                            ? "Hide Information"
                            : "More Information"),
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                    child: Text(
                      "Where to watch",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      height: 100,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: StreamingPlatform("Netflix",
                                "https://is3.cloudhost.id/anilist/stream/stream_netflix.jpg"),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: StreamingPlatform("Bilibili",
                                "https://is3.cloudhost.id/anilist/stream/stream_bilibili.jpg"),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: StreamingPlatform("Crunchyroll",
                                "https://is3.cloudhost.id/anilist/stream/stream_crunchy.png"),
                          )
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                    child: Text(
                      "Characters",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      height: 250,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Characters(
                                "Anisphia Wynn",
                                "https://is3.cloudhost.id/anilist/kakumei/anishphia.jpg",
                                "Main"),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Characters(
                                "Euphyllia Magenta",
                                "https://is3.cloudhost.id/anilist/kakumei/euphy.jpg",
                                "Main"),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Characters(
                                  "Ilia",
                                  "https://is3.cloudhost.id/anilist/kakumei/ilia.png",
                                  "Supporting")),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Characters(
                                  "Lainie Cyan",
                                  "https://is3.cloudhost.id/anilist/kakumei/lainie.png",
                                  "Supporting")),
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                    child: Text(
                      "Related Titles",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      height: 250,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RelatedTitle(
                                "Tensei Oujo to Tensai Reijou no Mahou Kakumei",
                                "https://is3.cloudhost.id/anilist/kakumei/adaptation.jpg",
                                "Adaptation"),
                          ),
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                    child: Text(
                      "PV / Trailers",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                      height: 200,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: PV(
                                "PV 2",
                                "https://img.youtube.com/vi/XFkQUOuqmcQ/0.jpg",
                                "https://www.youtube.com/watch?v=XFkQUOuqmcQ"),
                          ),
                        ],
                      )),
                  const Padding(padding: EdgeInsets.all(30)),
                ]))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Add to Watchlist",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget Characters(name, image, role) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text(role,
                  style: const TextStyle(fontSize: 14, color: Colors.black45)),
            )
          ],
        ),
      ),
    );
  }

  Widget StreamingPlatform(name, image) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(name),
          )
        ],
      ),
    );
  }

  Widget RelatedTitle(name, image, role) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text(role,
                  style: const TextStyle(fontSize: 14, color: Colors.black45)),
            )
          ],
        ),
      ),
    );
  }

  Widget PV(name, image, url) {
    return InkWell(
      onTap: () {
        _launchUrl(Uri.parse(url));
      },
      child: Container(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image))),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget ShowInfo() {
    return Column(
      children: [
        InfoRow("Status", "Currently Airing"),
        InfoRow("Studios", "Diomedéa"),
        InfoRow("Genres", "Fantasy, Girl Love"),
        InfoRow("Theme", "Isekai, Reincarnation"),
        InfoRow("Duration", "23 minutes / eps"),
        InfoRow("Rating", "PG-13"),
      ],
    );
  }

  Widget InfoRow(key, value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: const TextStyle(color: Colors.black54),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600))
        ],
      )),
    );
  }
}
