// ignore_for_file: unnecessary_new, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:turiviva/Components/placeItem.dart';
import 'package:turiviva/Components/topBar.dart';
import 'package:turiviva/Screens/menu.dart';
import 'package:turiviva/Screens/placeScreen.dart';
import 'package:turiviva/Screens/tabaco.dart';
import 'package:turiviva/Screens/tecelagemDoLinho.dart';

class PontosDeInteresse extends StatefulWidget {
  const PontosDeInteresse({Key? key}) : super(key: key);

  @override
  State<PontosDeInteresse> createState() => _PontosDeInteresseState();
}

class _PontosDeInteresseState extends State<PontosDeInteresse> {
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
              icon: Icon(Icons.keyboard_arrow_left,
                  color: Color.fromRGBO(0, 79, 79, 1)),
              onPressed: () {
                Navigator.pop(context);
              },
            )),

        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1,
            children: [
              PlaceItem(
                index: 1,
                width: 150,
                height: 110,
                title: 'Caldeiras',
                child: PlaceScreen(
                  title: 'Caldeiras',
                  index: 1,
                  text:
                      '   Situadas na freguesia das Furnas (Povoa????o), as caldeiras s??o consideradas o ex-l??bris por quem as visita, podendo ser observadas aqui um conjunto de caldeiras com ??guas em grande erup????o. Aqui podem ser vistas as lamas sulf??ricas e a enorme quantidade de nascentes de ??gua (quentes, temperadas, frias e gasificadas), tendo uma das fontes de ??gua mineral azeda, dado origem ao famoso queijo artesanal, considerado como ??nico. Nestas caldeiras s??o cozidas as ma??arocas de milho que podem ser saboreadas no Ver??o. Aqui se encontra o Observat??rio Microbiano dos A??ores, promotor do conhecimento sobre a biodiversidade e ecologia microbiana.',
                ),
              ),
              PlaceItem(
                index: 2,
                width: 150,
                height: 110,
                title: 'Portas da Cidade',
                child: PlaceScreen(
                  title: 'Portas da Cidade',
                  index: 2,
                  text: 'A Inserir Informa????o',
                ),
              ),
              PlaceItem(
                index: 3,
                width: 150,
                height: 110,
                title: 'Museu de Arte Sacra',
                child: PlaceScreen(
                  title: 'Museu de Arte Sacra',
                  index: 3,
                  text: 'A Inserir Informa????o',
                ),
              ),
              PlaceItem(
                index: 4,
                width: 150,
                height: 110,
                title: 'Cer??mica Vieira',
                child: PlaceScreen(
                  title: 'Cer??mica Vieira',
                  index: 4,
                  text:
                      '   A primeira gera????o da f??brica de Cer??mica Vieira remonta de 1896 por Bernardino da Silva que para a concretiza????o deste projeto constituiu sociedade com Manuel Leite Pereira, Tom??s D?????gua Boim e Manuel Joaquim D???Amaral. A segunda gera????o foi representada por Ant??nio Jacinto da Silva (natural da lagoa) casado com a sobrinha de Bernardino da Silva a quem deixou a f??brica atrav??s de heran??a. Sucederam ?? terceira gera????o Guilherme Borges Gouveia e Jos?? Augusto Martins Vieira, este ??ltimo, assume a f??brica em 1941 at?? 1974, dando do seu nome ?? ind??stria. A quarta gera????o representada por Ant??nio Jos?? da Silva Martins Vieira, em 1985 adquire a Cer??mica Leite integrando-a na Cer??mica Vieira em 1991. A quinta gera????o ?? assim composta por uma sociedade por Ant??nio Jos?? da Silva Martins Vieira e suas tr??s filhas.',
                ),
              ),
              PlaceItem(
                index: 5,
                width: 150,
                height: 110,
                title: 'Convento dos Franciscanos',
                child: PlaceScreen(
                  title: 'Convento dos Franciscanos',
                  index: 5,
                  text:
                      '   A primeira gera????o da f??brica de Cer??mica Vieira remonta de 1896 por Bernardino da Silva que para a concretiza????o deste projeto constituiu sociedade com Manuel Leite Pereira, Tom??s D?????gua Boim e Manuel Joaquim D???Amaral. A segunda gera????o foi representada por Ant??nio Jacinto da Silva (natural da lagoa) casado com a sobrinha de Bernardino da Silva a quem deixou a f??brica atrav??s de heran??a. Sucederam ?? terceira gera????o Guilherme Borges Gouveia e Jos?? Augusto Martins Vieira, este ??ltimo, assume a f??brica em 1941 at?? 1974, dando do seu nome ?? ind??stria. A quarta gera????o representada por Ant??nio Jos?? da Silva Martins Vieira, em 1985 adquire a Cer??mica Leite integrando-a na Cer??mica Vieira em 1991. A quinta gera????o ?? assim composta por uma sociedade por Ant??nio Jos?? da Silva Martins Vieira e suas tr??s filhas.',
                ),
              ),
              PlaceItem(
                index: 6,
                width: 150,
                height: 110,
                title: 'Igreja Matriz',
                child: PlaceScreen(
                  title: 'Igreja Matriz',
                  index: 6,
                  text:
                      '   A Igreja Matriz de S??o Miguel Arcanjo, na qual a sua constru????o foi ordenada por Infante Dom Henrique no s??culo XV. Apesar de existir informa????o se que a igreja fora soterrada em 1522 por um grande sismo, Gaspar Frutuoso (cronista Micaelense) atribui a trag??dia ?? fragilidade dos terrenos causada pela cultura intensa do pastel (planta Isatis Tinctoria) utilizada nos processos de tinturaria caseira. ',
                ),
              ),
              PlaceItem(
                index: 7,
                width: 150,
                height: 110,
                title: 'Ermida Nossa Senhora das Vit??rias',
                child: PlaceScreen(
                  title: 'Ermida Nossa Senhora das Vit??rias',
                  index: 7,
                  text:
                      '   Inaugurada em 1886, a Ermida Nossa Senhora das Vit??rias, de estilo neog??tico, foi mandada erguer por Jos?? do Canto (promotor da introdu????o de novas culturas e tecnologias agr??colas nos A??ores), cumprindo assim um voto formulado por ocasi??o de uma doen??a grave de sua esposa. Nesta ermida jaz Jos?? do Canto e sua esposa Maria Guilhermina Taveira Brum do Canto. A sua riqueza ?? caracterizada pela imagem do altar-mor feita de jaspe (quartzo de colora????o vermelha) e pelos riqu??ssimos vitrais em toda a ermida que al??m de evocar os passos da vida de nossa Senhora das Vit??rias, est??o gravadas iniciais dos nomes Jos?? do Canto e sua esposa (JM). Pretendeu Jos?? do Canto que a presente ermida fosse uma imita????o das grandes catedrais europeias.',
                ),
              ),
              PlaceItem(
                index: 8,
                width: 150,
                height: 110,
                title: 'Fumarolas',
                child: PlaceScreen(
                  title: 'Fumarolas',
                  index: 8,
                  text: '   A inserir informa????o',
                ),
              ),
              PlaceItem(
                index: 9,
                width: 150,
                height: 110,
                title: 'Jardim Terra Nostra',
                child: PlaceScreen(
                  title: 'Jardim Terra Nostra',
                  index: 9,
                  text:
                      '   A origem deste parque teve in??cio em 1775 quando Thomas Hickling mandou construir uma casa em madeira com um grande tanque de ??gua e o rodeou de ??rvores. Propriedade adquirida pelo Visconde da Praia em 1848, tendo aumentado a propriedade em dois hectares onde construiu a casa do Parque e plantou um belo jardim. A amplia????o do espa??o pela aquisi????o de v??rias parcelas durou at?? 1890, tendo sido adquirido mais tarde (1935) pela Sociedade Terra Nostra sob dire????o de Vasco Bensaude que restaurou o Jardim com a interven????o do jardineiro John McInroy. O Parque Nostra conta com mais de 3 000 exemplares de esp??cies arb??reas e arbustos, permitindo assim uma riqueza de flora end??mica dos A??ores.',
                ),
              ),
              PlaceItem(
                index: 10,
                width: 150,
                height: 110,
                title: 'Pra??a do Munic??pio',
                child: PlaceScreen(
                  title: 'Pra??a do Munic??pio',
                  index: 10,
                  text: '   Inserir Inform????o',
                ),
              ),
              PlaceItem(
                index: 11,
                width: 150,
                height: 110,
                title: 'Ermida Nossa Senhora do Pranto',
                child: PlaceScreen(
                  title: 'Ermida Nossa Senhora do Pranto',
                  index: 11,
                  text:
                      '   Ermida de Nossa Senhora do Pranto ?? um espa??o de grande devo????o religiosa desde o ano de 1523. Segundo a tradi????o, numa ??poca em que um surto de peste assolava o concelho de Ponta Delgada, um jovem pastor avistou a Nossa Senhora e a Virgem que ordenou a constru????o de uma ermida. A lenda, faz refer??ncia que os populares decidiram levantar a ermida junto ?? estrada de forma a facilitar a sua constru????o, muito influenciada pela falta de ??gua. Para espanto da popula????o as pedras foram movimentadas por Nossa Senhora para o local junto ao mar, no qual mais tarde brotou ??gua da parede da ermida. Muitas pessoas acorrem ?? ermida nos sete domingos da Quaresma para pagar as suas promessas ?? Senhora do Pranto.',
                ),
              ),
              PlaceItem(
                index: 12,
                width: 150,
                height: 110,
                title: 'Tecelagem do Linho',
                child: TecelagemDoLinho(),
              ),
              PlaceItem(
                index: 13,
                width: 150,
                height: 110,
                title: 'Museu do Tabaco',
                child: Tabaco(),
              ),
              PlaceItem(
                index: 14,
                width: 150,
                height: 110,
                title: 'F??brica de Ch?? Gorreana',
                child: PlaceScreen(
                  title: 'F??brica de Ch?? Gorreana',
                  index: 14,
                  text:
                      '   A F??brica de Ch?? Gorreana, iniciou a sua produ????o em 1883, considerando-se a mais antiga e ??nica planta????o de ch?? da Europa. Ch?? cem por cento biol??gico, no qual n??o s??o utilizados quaisquer tipos de produtos qu??micos (herbicidas, pesticidas, fungicidas, outros). Atrav??s da visita ?? f??brica ?? poss??vel contemplar as mem??rias de cinco gera????es na planta????o e todo o processo de produ????o do ch??. Al??m da visita ?? f??brica de Ch?? Gorreana e prova dos tipos de ch??, pode disfrutar-se dos trilhos atrav??s das planta????es de ch??, usufruindo de paisagens ??nicas para o mar. ',
                ),
              ),
              PlaceItem(
                index: 15,
                width: 150,
                height: 110,
                title: 'F??brica de Ch?? Porto Formoso',
                child: PlaceScreen(
                  title: 'F??brica de Ch?? Porto Formoso',
                  index: 15,
                  text: '   Inserir Informa????o',
                ),
              ),
              PlaceItem(
                index: 16,
                width: 150,
                height: 110,
                title: 'Pra??a do Munic??pio',
                child: PlaceScreen(
                  title: 'Pra??a do Munic??pio',
                  index: 16,
                  text:
                      '   Na pra??a do munic??pio da Ribeira Grande al??m de se completar o seu jardim, ?? poss??vel visitar tr??s edif??cios de relevo no concelho: A igreja do Senhor dos Passos, tamb??m conhecida como igreja do Espirito Santo datado de 1592, na qual est?? bem presente o estilo a????rico, com tra??os de barroco com uma decora????o exuberante e o uso de basalto de rocha negra; a C??mara Municipal que tem a sua data de constru????o no s??culo XVI, apresentando uma escadaria exterior, uma torre do rel??gio e uma janela do estilo manuelino, s??mbolo do poder pol??tico e municipal; o teatro da Ribeira Grande com uma constru????o mais recente datado de 1920, tornou-se uma verdadeira sala de espet??culos.',
                ),
              ),
              PlaceItem(
                index: 17,
                width: 150,
                height: 110,
                title: 'Po??os de S??o Vicente',
                child: PlaceScreen(
                  title: 'Po??os de S??o Vicente',
                  index: 17,
                  text: '   Inserir Informa????o',
                ),
              ),
              PlaceItem(
                index: 18,
                width: 150,
                height: 110,
                title: 'Oficina Museu',
                child: PlaceScreen(
                  title: 'Oficina Museu',
                  index: 18,
                  text: '   Inserir Informa????o',
                ),
              ),
              PlaceItem(
                index: 19,
                width: 150,
                height: 110,
                title: 'Vista do Rei',
                child: PlaceScreen(
                  title: 'Vista do Rei',
                  index: 19,
                  text: '   Inserir Informa????o',
                ),
              ),
              PlaceItem(
                index: 20,
                width: 150,
                height: 110,
                title: 'Campo de S??o Francisco',
                child: PlaceScreen(
                  title: 'Campo de S??o Francisco',
                  index: 20,
                  text: '   Inserir Informa????o',
                ),
              ),
            ],
          ),
        ),

        // Column(
        //   children: [
        //     TopBar(),
        //     Container(
        //       height: 20,
        //     ),
        //     Expanded(
        //       child: new Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           Container(
        //             child: Text(
        //               "Pontos de Interesse",
        //               style: TextStyle(
        //                 fontSize: 40,
        //                 color: Color.fromRGBO(0, 79, 79, 1),
        //               ),
        //             ),
        //           ),
        //           Container(
        //             height: 20,
        //           ),
        //           ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
