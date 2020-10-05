import 'package:flutter/material.dart';
import 'package:portfolio/components/service_widget.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
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
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'WHAT I DO',
                      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 15.0),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                  ),
                  ServiceWidget(
                    fadedColor: Colors.grey.shade500,
                    icon: Icons.analytics,
                    text: 'I Analyse',
                    color: Colors.white,
                  ),
                  ServiceWidget(
                    fadedColor: Colors.grey.shade500,
                    icon: Icons.construction,
                    text: 'I Code',
                    color: Colors.white,
                  ),
                  ServiceWidget(
                    fadedColor: Colors.grey.shade500,
                    icon: Icons.verified,
                    text: 'I Test',
                    color: Colors.white,
                  ),
                  ServiceWidget(
                    fadedColor: Colors.grey.shade500,
                    icon: Icons.book,
                    text: 'I Document',
                    color: Colors.white,
                  ),
                  //ServiceWidget(color: Colors.white),
                  //ServiceWidget(color: Colors.white),
                  //ServiceWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
