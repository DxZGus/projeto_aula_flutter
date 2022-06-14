import 'dart:async' as async;

import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {

  static const overlayKey = 'playerInterface';

  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {

  double life = 0;
  final double width_max = 100;
  double width_current = 100;
  late async.Timer _LifeTime;
  @override
  void initState() {
    _LifeTime = async.Timer.periodic(const Duration(milliseconds: 100), _verifyLife);
    super.initState();
  }

  @override
  void dispose() {
    _LifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
        ),
        ),
        SizedBox(
          width: 15,
        ),


        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: width_current,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),

              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: width_max,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)
              ),
            ),
          ],
        ),
      ],
    );

  }

  void _verifyLife(async.Timer timer) {
    if(life != (widget.game.player?.life ?? 0)){
      setState(() {
        life = widget.game.player?.life ?? 0;

        final percent = life /(widget.game.player?.maxLife ?? 0);
        width_current = width_max * percent;
      });
    }
  }
}
