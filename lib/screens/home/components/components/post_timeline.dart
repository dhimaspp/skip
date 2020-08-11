import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';

class PostTimeline extends StatefulWidget {
  @override
  _PostTimelineState createState() => _PostTimelineState();
}

class _PostTimelineState extends State<PostTimeline> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
          );
        }
      }
  
  Widget _buildEntries(){
    return ListView.builder(
      itemBuilder: c,1 
      )
  }
      
  Widget _buildBody {
    return _buildEntries();
        
}