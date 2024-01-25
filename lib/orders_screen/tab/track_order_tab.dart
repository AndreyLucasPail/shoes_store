import 'package:flutter/material.dart';

class TrackOrderTab extends StatefulWidget {
  const TrackOrderTab({super.key});

  @override
  State<TrackOrderTab> createState() => _TrackOrderTabState();
}

class _TrackOrderTabState extends State<TrackOrderTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: Colors.black, radius: 35,),
          line(),
          CircleAvatar(backgroundColor: Colors.black, radius: 35,),
          line(),
          CircleAvatar(backgroundColor: Colors.black, radius: 35,),
          line(),
          CircleAvatar(backgroundColor: Colors.black, radius: 35,),
          line(),
          CircleAvatar(backgroundColor: Colors.black, radius: 35,),
          line(),
          CircleAvatar(backgroundColor: Colors.black, radius: 35,),
        ],
      ),
    );
  }

  Widget line(){
    return Container(
      height: 50,
      width: 10,
      color: Colors.green,
    );
  }
}