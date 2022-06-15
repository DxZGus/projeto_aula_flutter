import 'package:bonfire/base/game_component.dart';
import 'package:bonfire_projeto/game.dart';
import 'package:bonfire_projeto/home_page.dart';
import 'package:flutter/material.dart';

class MyGameController extends GameComponent{
  bool endGame = false;
  bool gameOver = false;
  final int stage;

  MyGameController(this.stage);


  @override
  void update(double dt) {
    if(checkInterval('end game', 500, dt)){
      if(gameRef.livingEnemies().isEmpty  && !endGame){
        endGame = true;
        if(stage == 3){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text('Você concluiu a demonstração do projeto !'),
                actions: [
                  TextButton(onPressed: (){
                    _goHome();
                  }, child: Text('Voltar ao menu'))
                ],
              );
            },
          );

        }
        else{
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text('Você avançou para a proxima etapa !'),
                actions: [
                  TextButton(onPressed: (){
                    _goStage(stage + 1);
                  }, child: Text('Avançar'))
                ],
              );
            },
          );
        }

      }
    }
   if(checkInterval('gameover', 500, dt)){
     if(gameRef.player?.isDead == true && !gameOver){
       gameOver = true;
       showDialog(
         context:context,
         builder: (context){
           return AlertDialog(
             content: Text('Você morreu'),
             actions: [
               TextButton(
                   onPressed: (){
                     _goStage(stage);
                   },
                   child: Text('Tentar novamente'),
               ),
               TextButton(onPressed: (){
                 _goHome();
               }, child: Text('Voltar ao menu')
               )

             ],
           );
         },
       );
     }
   }


    super.update(dt);
  }
  void _goStage(int newStage){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
      return Game(
        stage: newStage,
      );
    }), (route) => false);
  }

  void _goHome(){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
      return HomePage(

      );
    }), (route) => false);
  }
}