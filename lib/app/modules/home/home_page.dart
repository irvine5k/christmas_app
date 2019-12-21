import 'dart:math';

import 'package:desafio_natal/app/widgets/blend_mask/blend_mask.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo0Peaw_pfzM5rHR3kV7yMB4mFimSUN1tTtXqYiOHziJEtsEcf&s",
            fit: BoxFit.fitHeight,
          ),
          Container(color: Colors.white70),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Welcome to\n Christmas Gifts",
                      style: TextStyle(
                        fontSize: 32,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    GridView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      children: <Widget>[
                        _buildCard("icon-01.png", "List of Gifts", "/gifts"),
                        _buildCard("icon-11.png", "My Gifts"),
                        _buildCard("icon-15.png", "My Profile"),
                        _buildCard("icon-22.png", "Logout"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      "assets/images/icon-17.png",
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String iconName, String text, [String route]) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (route != null) Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: "assets/images/$iconName",
                      child: Image.asset("assets/images/$iconName"),
                    ),
                    if (route == null)
                      Positioned.fill(
                        child: BlendMask(
                          blendMode: BlendMode.color,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Hero(
                tag: "assets/images/$iconName-title",
                child: Material(
                  type: MaterialType.transparency,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
