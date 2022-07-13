import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'gh.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'de.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'ci.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'ng.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'za.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'id.png'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
