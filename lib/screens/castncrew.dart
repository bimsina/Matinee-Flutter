import 'package:flutter/material.dart';
import 'package:movies/constants/api_constants.dart';
import 'package:movies/modal_class/credits.dart';

class CastAndCrew extends StatelessWidget {
  final ThemeData themeData;
  final Credits credits;
  CastAndCrew({this.themeData, this.credits});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.primaryColor,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: themeData.accentColor,
            tabs: [
              Tab(
                child: Text(
                  'Cast',
                  style: themeData.textTheme.body2,
                ),
              ),
              Tab(
                child: Text(
                  'Crew',
                  style: themeData.textTheme.body2,
                ),
              ),
            ],
          ),
          title: Text(
            'Cast And Crew',
            style: themeData.textTheme.headline,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: themeData.accentColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TabBarView(
          children: [castList(), creditsList()],
        ),
      ),
    );
  }

  Widget castList() {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      color: themeData.primaryColor,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: credits.cast.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 70,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: credits.cast[index].profilePath == null
                        ? Image.asset(
                            'assets/images/na.jpg',
                            fit: BoxFit.cover,
                          )
                        : FadeInImage(
                            image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                'w500/' +
                                credits.cast[index].profilePath),
                            fit: BoxFit.cover,
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                          ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name : ' + credits.cast[index].name,
                          style: themeData.textTheme.body1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Character : ' + credits.cast[index].character,
                          style: themeData.textTheme.body2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget creditsList() {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      color: themeData.primaryColor,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: credits.crew.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 70,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: credits.crew[index].profilePath == null
                        ? Image.asset(
                            'assets/images/na.jpg',
                            fit: BoxFit.cover,
                          )
                        : FadeInImage(
                            image: NetworkImage(TMDB_BASE_IMAGE_URL +
                                'w500/' +
                                credits.crew[index].profilePath),
                            fit: BoxFit.cover,
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                          ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name : ' + credits.crew[index].name,
                          style: themeData.textTheme.body1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Job : ' + credits.crew[index].job,
                          style: themeData.textTheme.body2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
