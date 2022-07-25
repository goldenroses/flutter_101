import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Map data = {};


  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bg = data['isDaytime'] ? "day.png" : "night.png";
    Color color = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: color,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${bg}'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                      "Edit Location",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.grey[300],
                      letterSpacing: 2,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                  data['time'],
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 66,
                ),
              )

            ],
          )),
        ),
      ),
    );
  }
}
