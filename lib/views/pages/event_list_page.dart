import 'package:flutter/material.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({
    Key? key,
  }) : super(key: key);

  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  var eventList = ['イベントA','イベントB','イベントC'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.flight_land),
                title: Text(eventList[index]),
                subtitle: Text('2021/10/09 00:00:00'),
                onTap: () {
                  Navigator.pushNamed(context, '/event_detail');
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => EventDetailPage()),
//                  );
                },
              ));
        },
        itemCount: eventList.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/event_register');
        },
      ),
    );
  }
}
