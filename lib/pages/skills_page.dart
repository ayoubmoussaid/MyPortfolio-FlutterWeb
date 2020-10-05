import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55.0,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).backgroundColor,
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                  ),
                  Text(
                    'TECHNICAL SKILLS',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
