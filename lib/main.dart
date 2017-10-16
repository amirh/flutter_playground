import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: const Scaffold(
        body: const MobileStepper(
          steps: const <Widget> [
            const Text('Step 1'),
            const Text('Step 2'),
            const Text('Step 3'),
          ],
        )
      )
    );
  }
}

class MobileStepper extends StatefulWidget {
  final List<Widget> steps;
  
  const MobileStepper({this.steps});

  @override
  State createState() => new MobileStepperState();
}

class MobileStepperState extends State<MobileStepper> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new TabBarView(
            children: widget.steps,
            controller: _controller,
          ),
        ),
        new Row(
          children: <Widget> [
            new FlatButton(
              child: new Row(
                children: <Widget> [
                  new Icon(Icons.chevron_left),
                  new Text('BACK'),
                ],
              ),
              onPressed: _controller.index > 0
                ?  () { _controller.animateTo(_controller.index - 1); }
                : null
            ),
            new Expanded(
              child: new Center(
                child: new TabPageSelector(controller: _controller),
              ),
            ),
            new FlatButton(
              child: new Row(
                children: <Widget> [
                  new Text('NEXT'),
                  new Icon(Icons.chevron_right),
                ],
              ),
              onPressed: _controller.index < _controller.length - 1
                ? () { _controller.animateTo(_controller.index + 1); }
                : null
            ),
          ]
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: widget.steps.length, vsync: this);
    _controller.addListener(() { setState(() {}); });
  }
}
