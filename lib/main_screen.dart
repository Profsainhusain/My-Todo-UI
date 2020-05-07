
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ui_demo/components/animated_fab.dart';
import 'package:ui_demo/model/list_model_.dart';
import 'package:ui_demo/model/task_data_model.dart';
import 'components/diagonal_clipper.dart';
import 'model/task_row.dart';


class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}
double _imageHeight = 256.0;
final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
ListModel listModel;
bool showOnlyCompleted = false;


class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    listModel = ListModel(_listKey, tasks);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildTimeline(),
          _buildImage(),
          _buildTopHeader(),
          _buildProfileView(),
          _buildBottomPart(),
          _buildFab(),
        ],
      ),
    );
  }

  //image build widget
  Widget _buildImage() {
    return ClipPath(
      clipper: DiagonalClipper(),
      child: Image.asset(
        'images/bird.png',
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
        color: Color.fromARGB(120, 20, 10, 60),
      ),
    );
  }
}

//Top Header section
Widget _buildTopHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
    child: Row(
      children: [
        Icon(
          Icons.menu,
          size: 32.0,
          color: Colors.white,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Timeline',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Icon(
          Icons.linear_scale,
          color: Colors.white,
        )
      ],
    ),
  );
}

//Profile view section
Widget _buildProfileView(){
  return Padding(
    padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
    child: Row(
      children: [
        CircleAvatar(
          minRadius: 28.0,
          maxRadius: 28.0,
          backgroundImage: AssetImage('images/profsain.jpg'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Profsain M. Hussain',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//Bottom List section
Widget _buildBottomPart(){
  return Padding(
    padding: EdgeInsets.only(top: _imageHeight),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTaskHeader(),
        _buildTaskList(),
      ],
    ),
  );
}

//TaskCallback List Header
Widget _buildTaskHeader(){
  return Padding(
    padding: EdgeInsets.only(left: 64.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Task',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'MAY 5, 2020',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

// Task List section
Widget _buildTaskList(){
  return Expanded(
    child: AnimatedList(
      initialItemCount: tasks.length,
      key: _listKey,
      itemBuilder: (context, index, animation){
        return TaskRow(
          task: listModel[index],
          animation: animation,
        );
      },
    ),
  );
}

//border sideline
Widget _buildTimeline(){
  return Positioned(
    top: 0.0,
    bottom: 0.0,
    left: 32.0,
    child: Container(
      width: 1.0,
      color: Colors.grey[400],
    ),
  );
}

//FloatingActionButton build widget
Widget _buildFab(){
  return Positioned(
    top: _imageHeight - 36.0,
    right: 16.0,
    child: Positioned(
      top: _imageHeight - 100.0,
      right: -40.0,
      child: AnimatedFab(
        onClick: _changeFilterState,
      ),
    ),
  );
}

//change filterState method when FAB is click
void _changeFilterState(){
  showOnlyCompleted = !showOnlyCompleted;
  tasks.where((task) => !task.completed).forEach((task) {
    if(showOnlyCompleted){
      listModel.removeAt(listModel.indexOf(task));
    }else{
      listModel.insert(tasks.indexOf(task), task);
    }
  });
}