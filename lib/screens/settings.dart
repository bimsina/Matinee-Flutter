

import 'package:flutter/material.dart';
import 'package:movies/screens/login.dart';
import 'package:movies/theme/theme_state.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? option;
  final List<Color> colors = [Colors.white, Color(0xff242248), Colors.black];
  final List<Color> borders = [Colors.black, Colors.white, Colors.white];
  final List<String> themes = ['Light', 'Dark', 'Amoled'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeState>(context);
    return Theme(
        data: state.themeData,
        child: Container(
          color: state.themeData.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircleAvatar(
                              backgroundColor: state.themeData.accentColor,
                              radius: 40,
                              child: Icon(
                                Icons.person_outline,
                                size: 40,
                                color: state.themeData.primaryColor,
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen(
                                          themeData: state.themeData,
                                        )));
                          },
                          child: Text(
                            'Log In / Sign Up',
                            style: state.themeData.textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Theme',
                      style: state.themeData.textTheme.bodyText1,
                    ),
                  ],
                ),
                subtitle: SizedBox(
                  height: 100,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: borders[index]),
                                        color: colors[index]),
                                  ),
                                ),
                                Text(themes[index],
                                    style: state.themeData.textTheme.bodyText1)
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        switch (index) {
                                          case 0:
                                            state.saveOptionValue(
                                                ThemeStateEnum.light);
                                            break;
                                          case 1:
                                            state.saveOptionValue(
                                                ThemeStateEnum.dark);
                                            break;
                                          case 2:
                                            state.saveOptionValue(
                                                ThemeStateEnum.amoled);

                                            break;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: state.themeData.primaryColor ==
                                              colors[index]
                                          ? Icon(Icons.done,
                                              color:
                                                  state.themeData.accentColor)
                                          : Container(),
                                    ),
                                  ),
                                ),
                                Text(themes[index],
                                    style: state.themeData.textTheme.bodyText1)
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
