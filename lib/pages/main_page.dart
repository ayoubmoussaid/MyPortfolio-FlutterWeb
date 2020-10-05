import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:portfolio/components/customButton.dart';
import 'package:portfolio/components/listview_element_widget.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/education_page.dart';
import 'package:portfolio/pages/experience_page.dart';
import 'package:portfolio/pages/services_page.dart';
import 'package:portfolio/pages/skills_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  int selectedIndex;
  List<String> elements = ['ABOUT', 'SERVICES', 'SKILLS', 'EDUCATION', 'EXPERIENCE', 'CONTACT'];
  List<Widget> pages = [
    AboutPage(),
    ServicesPage(),
    SkillsPage(),
    EducationPage(),
    ExperiencePage(),
    ContactPage()
  ];
  @override
  void initState() {
    selectedIndex = 0;
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'MOUSSAID AYOUB',
            style: TextStyle(color: Colors.white, fontFamily: 'Lato', fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 10.0, bottom: 10.0),
            child: CustomButton(
              text: 'DOWNLOAD RESUME',
              height: 50.0,
              width: 150,
              radius: 3.0,
              backgroundColor: Theme.of(context).backgroundColor,
              splashColor: Theme.of(context).accentColor,
              childColor: Theme.of(context).textTheme.headline1.color,
              start: true,
              onTap: () {
                print('download resume');
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/mainbg.jpg'), fit: BoxFit.cover)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  color: Colors.transparent,
                  child: ListView.separated(
                    //padding: EdgeInsets.symmetric(horizontal: 50.0),
                    shrinkWrap: true,
                    itemCount: elements.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.0,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            print(elements[index]);
                            setState(() {
                              selectedIndex = index;
                            });
                            _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 600), curve: Curves.easeOut);
                          },
                          child: (ListElement(
                            selected: index == selectedIndex,
                            title: elements[index],
                          )),
                        ),
                      );
                    },
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  children: pages,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
