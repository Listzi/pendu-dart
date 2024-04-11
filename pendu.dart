import 'package:cli_menu/cli_menu.dart';
import 'dart:io';
import 'dart:math';
import 'dart:convert';


void main() 
{
  menu(List<String> dictionnaire,int lendico)
  {
    print('Menu du Pendu:');
    final menu = Menu(['Jouer', 'Dictionnaire', 'Quitter']);
    final result = menu.choose();
    print(result.toString());
    // menu JOUER
    if (result.toString() == "Jouer")
    {
      //print("hello");
      var nbr = Random().nextInt(lendico);
      var motDeviner = dictionnaire[nbr];
      int erreur = 0;
      var motTrouver = false;
      var mot = motDeviner.split('');
      List<String> motcacher = [];
      for (var element in mot) 
      {
        element = '_';
        motcacher.add(element);
      }
      //print('avant while');
      //print(motDeviner);
      while (true)
      {
        //print('dans la boucle');
        print(motcacher.join(''));
        print("nbr d'erreur : $erreur ");
        print('Tapez une lettre pour devinez le mot');
        String? lettre = stdin.readLineSync();
       
        if (mot.contains(lettre.toString())) 
        {
          for (var element in mot) 
          {
            //print(element);
            if (element == lettre.toString())
            {
              var index = mot.indexOf(element);
              print(index);
              motcacher[index] = lettre.toString();

            }
          }
        }
        else 
        {
          erreur += 1;
        }
        if (!motcacher.contains('_'))
        {
          motTrouver == true;
          break;
        }
        if (erreur>=11)
        {
          break;
        }
      }
      print('mot trouver : $motDeviner');
    }

    // menu DICTIONNAIRE
    if (result.toString() == "Dictionnaire")
    {
      // fonction dico 
      print('Menu du dictionnaire');
      final dico = Menu(['Ajouter', 'Modifier','Enlever']);
      final rltdico = dico.choose().toString();
      if (rltdico == 'Ajouter')
      {
        print('Tapez le mot ajouté au dictionnaire');
        var line = stdin.readLineSync(encoding: utf8);
        dictionnaire.add(line.toString());
        print('nouveaux dictionnaire');
        print(dictionnaire);
        main();
      }
      if (rltdico == 'Modifier')
      {
       // print('choisir le mot a modifier');
        //final modifDico = Menu(dictionnaire);
       // final moddico = modifDico.choose().toString();
        

      }
      if (rltdico == 'Enlever')
      {
        //print(dictionnaire);
        final supprDico = Menu(dictionnaire);
        final suppdico = supprDico.choose().toString();
        dictionnaire.remove(suppdico);
        print('nouveaux dictionnaire');
        print(dictionnaire);
        main();
      }
    }
    
    // menu QUITTER
    if (result.toString() == "Quitter")
    {
      // fonction QUITTER
      print('Voulez vraiment quitter le jeu ? ');
      final quitter = Menu(['Yes', 'No']);
      final rltqui = quitter.choose().toString();
      if (rltqui == 'Yes')
      {
        exit(0); 
      }
      else 
      {
        main();
      }
    }
  }

  var dictionnaire = ['elephant','tortue','frigidaire','gourde','kiwi','stylo'];
  //Dictio dictionnaire = Dictio(['elephant','tortue','frigidaire','gourde','kiwi','stylo']);
  var lendico = dictionnaire.length;
  menu(dictionnaire, lendico);
}
