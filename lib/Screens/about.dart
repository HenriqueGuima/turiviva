// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turiviva/Components/topBar.dart';
import 'package:readmore/readmore.dart';
import 'package:turiviva/Screens/menu.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              Container(
                width: 50,
              ),
              Container(
                width: 140,
                child: Image(
                  image: AssetImage("assets/logo2.png"),
                ),
              ),
              Container(
                width: 50,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
                icon: Icon(Icons.menu, color: Color.fromRGBO(0, 79, 79, 1)),
              ),
            ],
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            shadowColor: Color.fromARGB(0, 0, 0, 0),
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,color: Color.fromRGBO(0, 79, 79, 1)
              ),
              onPressed: () {
                Navigator.pop(context);
              
              },
            )),

        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "Sobre",
                          style: TextStyle(
                            fontSize: 40,
                            color: Color.fromRGBO(0, 79, 79, 1),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Image(
                          image: AssetImage("assets/acores.png"),
                          height: 250,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        height: 650,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                        child: ReadMoreText(
                          '   Em parceria com todos os munic??pios da ilha de S??o Miguel, o projeto Turismo s??nior: rotas de bem-estar e experi??ncias locais em um ecossistema insular (Turiviva+), visa alcan??ar os seguintes objetivos:  i) conhecer o bem-estar global, o grau de satisfa????o, as experi??ncias emocionais positivas, o envolvimento com o ecossistema insular da ilha de S. Miguel, as recomenda????es/sugest??es expressas pelos turistas seniores que visitam a ilha de S. Miguel; apresentar narrativas de tradi????es e experi??ncias/rela????es com os lugares mais emblem??ticos da ilha; apresentar um esp??lio sobre o patrim??nio natural e cultural e a biodiversidade da ilha de S??o Miguel, nos seus diferentes munic??pios, criar conte??do audiovisual com exposi????o cient??fica a serem divulgadas nas tecnologias de informa????o e comunica????o com recurso a tecnologia de realidade aumentada, apresentar toras de turismo natural e cultural que promovam o bem-estar global para turistas seniores; promover os A??ores como destino s??nior por excel??ncia, entre outros. Pretende-se com este projeto, evolver o turista s??nior com o ecossistema insular da ilha de S??o Miguel e fornecer experi??ncias positivas de bem-estar atrav??s de uma rota inovadora.',
                          trimLines: 18,
                          textAlign: TextAlign.justify,
                          colorClickableText: Colors.black,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Ler mais',
                          trimExpandedText: 'Ler menos',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          lessStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          moreStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
