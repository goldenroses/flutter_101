import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    print(locations[index].location);
    WorldTime wt = locations[index];
    await wt.getTime();
  Navigator.pop(context,
      {'location': wt.location, 'time': wt.time, 'flag': wt.flag, 'isDaytime': wt.isDaytime});
  }

  @override
  Widget build(BuildContext context) {
    print("Init state loaded: BUILD METHOD");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(itemCount:
      locations.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: (){
              updateTime(index);

            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/${locations[index].flag}"),
            ),
          ),
        );

        }),
    );
  }
}
