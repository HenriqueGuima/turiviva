// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_collection_literals, unnecessary_new, prefer_const_constructors

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../Screens/placeScreen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(RotaReligiosa());
}

class RotaReligiosa extends StatefulWidget {
  @override
  _RotaReligiosaState createState() => _RotaReligiosaState();
}

class _RotaReligiosaState extends State<RotaReligiosa> {
  int _polylineCount = 1;
  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
  Set<Marker> markers = new Set();

  GoogleMapPolyline _googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyDcrF8gocis3n5_8cz0kK51ZH1hm-XS0dA");

  //Polyline patterns
  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[], //line
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)], //dash
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)], //dot
    <PatternItem>[
      //dash-dot
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
  ];

  LatLng _mapInitLocation = LatLng(37.779242321596264, -25.47076162990895);

  LatLng _caldeiras = LatLng(37.77272, -25.304102);
  LatLng _portasDaCidade = LatLng(37.739402, -25.668352);
  LatLng _museuArteSacra = LatLng(37.743526, -25.670051);
  LatLng _ceramicaVieira = LatLng(37.745201, -25.582865);
  LatLng _conventoDosFranciscanos = LatLng(37.745143, -25.563158);
  LatLng _centralHidroelectrica = LatLng(37.718949, -25.46688);
  LatLng _igrejaMatriz = LatLng(37.715769, -25.436565);
  LatLng _ermidaNossaSenhoraDasVitorias = LatLng(37.75027, -25.33074);
  LatLng _fumarolas = LatLng(37.768461, -25.331446);
  LatLng _jardimTerraNostra = LatLng(37.772472, -25.31576);
  LatLng _pracaDoMunicipio1 = LatLng(37.832384, -25.146598);
  LatLng _ermidaNossaSenhoraDoPranto = LatLng(37.855861, -25.187447);
  LatLng _tecelagemDoLinho = LatLng(37.83091, -25.371674);
  LatLng _museuDoTabaco = LatLng(37.829332, -25.394023);
  LatLng _fabricaDeChaGorreana = LatLng(37.818312, -25.402413);
  LatLng _fabricaDeChaPortoFromoso = LatLng(37.815414, -25.424759);
  LatLng _pracaDoMunicipio2 = LatLng(37.822519, -25.52015);
  LatLng _pocosDeSaoVicente = LatLng(37.834418, -25.67007);
  LatLng _oficinaMuseu = LatLng(37.830296, -25.692475);
  LatLng _vistaDoRei = LatLng(37.839331, -25.794976);
  LatLng _campoDeSaoFrancisco = LatLng(37.737549, -25.673034);

  bool _loading = false;

  _onMapCreated(GoogleMapController controller) {
    _customInfoWindowController.googleMapController = controller;
  }

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  //Get polyline with Location (latitude and longitude)
  _getPolylinesWithLocation() async {
    _setLoadingMenu(true);
    List<LatLng>? _coordinates1 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _caldeiras,
            destination: _portasDaCidade,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates2 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _portasDaCidade,
            destination: _museuArteSacra,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates3 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _museuArteSacra,
            destination: _ceramicaVieira,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates4 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _ceramicaVieira,
            destination: _conventoDosFranciscanos,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates5 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _conventoDosFranciscanos,
            destination: _centralHidroelectrica,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates6 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _centralHidroelectrica,
            destination: _igrejaMatriz,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates7 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _igrejaMatriz,
            destination: _ermidaNossaSenhoraDasVitorias,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates8 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _ermidaNossaSenhoraDasVitorias,
            destination: _fumarolas,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates9 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _fumarolas,
            destination: _jardimTerraNostra,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates10 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _jardimTerraNostra,
            destination: _pracaDoMunicipio1,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates11 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _pracaDoMunicipio1,
            destination: _ermidaNossaSenhoraDoPranto,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates12 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _ermidaNossaSenhoraDoPranto,
            destination: _tecelagemDoLinho,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates13 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _tecelagemDoLinho,
            destination: _museuDoTabaco,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates14 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _museuDoTabaco,
            destination: _fabricaDeChaGorreana,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates15 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _fabricaDeChaGorreana,
            destination: _fabricaDeChaPortoFromoso,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates16 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _fabricaDeChaPortoFromoso,
            destination: _pracaDoMunicipio2,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates17 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _pracaDoMunicipio2,
            destination: _pocosDeSaoVicente,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates18 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _pocosDeSaoVicente,
            destination: _oficinaMuseu,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates19 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _oficinaMuseu,
            destination: _vistaDoRei,
            mode: RouteMode.walking);

    List<LatLng>? _coordinates20 =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _vistaDoRei,
            destination: _campoDeSaoFrancisco,
            mode: RouteMode.walking);

    setState(() {
      _polylines.clear();
    });
    _addPolyline(_coordinates1);
    _addPolyline(_coordinates2);
    _addPolyline(_coordinates3);
    _addPolyline(_coordinates4);
    _addPolyline(_coordinates5);
    _addPolyline(_coordinates6);
    _addPolyline(_coordinates7);
    _addPolyline(_coordinates8);
    _addPolyline(_coordinates9);
    _addPolyline(_coordinates10);
    _addPolyline(_coordinates11);
    _addPolyline(_coordinates12);
    _addPolyline(_coordinates13);
    _addPolyline(_coordinates14);
    _addPolyline(_coordinates15);
    _addPolyline(_coordinates16);
    _addPolyline(_coordinates17);
    _addPolyline(_coordinates18);
    _addPolyline(_coordinates19);
    _addPolyline(_coordinates20);
    _setLoadingMenu(false);
  }

  _addPolyline(List<LatLng>? _coordinates) {
    PolylineId id = PolylineId("poly$_polylineCount");
    Polyline polyline = Polyline(
        polylineId: id,
        patterns: patterns[0],
        color: Colors.blueAccent,
        points: _coordinates!,
        width: 10,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
      _polylineCount++;
    });
  }

  _setLoadingMenu(bool _status) {
    setState(() {
      _loading = _status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(102,153,153, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: new Row(
                    children: [
                      Container(
                        width: 250,
                        child: Text(
                          "Rota Religiosa",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
          //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
        body: Container(
          child: new Stack(
            children: <Widget>[
              GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                polylines: Set<Polyline>.of(_polylines.values),
                initialCameraPosition: CameraPosition(
                  target: _mapInitLocation,
                  zoom: 9,
                ),
                onCameraMove: (position) {
                  _customInfoWindowController.onCameraMove!();
                },
                markers: getmarkers(),
                onTap: (position) {
                  _customInfoWindowController.hideInfoWindow!();
                },
              ),
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: 60,
                width: 220,
                offset: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(102,153,153, 1),
                          elevation: 0.0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: _getPolylinesWithLocation,
                        child: Text(
                          'Ver Rota',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _loading
            ? Container(
                color: Colors.black.withOpacity(0.75),
                child: Center(
                  child: Text(
                    'A carregar rota...',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(
      () {
        //PlaceScreen
        markers.add(
          Marker(
            markerId: MarkerId("Caldeiras"),
            position: LatLng(37.77272, -25.304102),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Caldeiras",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Caldeiras',
                                index:1,
                                text:
                                    '   Situadas na freguesia das Furnas (Povoa????o), as caldeiras s??o consideradas o ex-l??bris por quem as visita, podendo ser observadas aqui um conjunto de caldeiras com ??guas em grande erup????o. Aqui podem ser vistas as lamas sulf??ricas e a enorme quantidade de nascentes de ??gua (quentes, temperadas, frias e gasificadas), tendo uma das fontes de ??gua mineral azeda, dado origem ao famoso queijo artesanal, considerado como ??nico. Nestas caldeiras s??o cozidas as ma??arocas de milho que podem ser saboreadas no Ver??o. Aqui se encontra o Observat??rio Microbiano dos A??ores, promotor do conhecimento sobre a biodiversidade e ecologia microbiana.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.77272, -25.304102),
              );
            },
          ),
        );
        markers.add(
          Marker(
            markerId: MarkerId("Portas da Cidade"),
            position: LatLng(37.739402, -25.668352),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Portas da Cidade",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Portas da Cidade',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.739402, -25.668352),
              );
            },
          ),
        );
        markers.add(
          Marker(
            markerId: MarkerId("Museu de Arte Sacra (Col??gio dos Jesu??tas)"),
            position: LatLng(37.743526, -25.670051),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Museu de Arte Sacra (Col??gio dos Jesu??tas)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title:
                                    'Museu de Arte Sacra (Col??gio dos Jesu??tas)',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.743526, -25.670051),
              );
            },
          ),
        );
        markers.add(
          Marker(
            markerId: MarkerId("Cer??mica Vieira"),
            position: LatLng(37.745201, -25.582865),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Cer??mica Vieira",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Cer??mica Vieira',
                                index:1,
                                text:
                                    '   A primeira gera????o da f??brica de Cer??mica Vieira remonta de 1896 por Bernardino da Silva que para a concretiza????o deste projeto constituiu sociedade com Manuel Leite Pereira, Tom??s D?????gua Boim e Manuel Joaquim D???Amaral. A segunda gera????o foi representada por Ant??nio Jacinto da Silva (natural da lagoa) casado com a sobrinha de Bernardino da Silva a quem deixou a f??brica atrav??s de heran??a. Sucederam ?? terceira gera????o Guilherme Borges Gouveia e Jos?? Augusto Martins Vieira, este ??ltimo, assume a f??brica em 1941 at?? 1974, dando do seu nome ?? ind??stria. A quarta gera????o representada por Ant??nio Jos?? da Silva Martins Vieira, em 1985 adquire a Cer??mica Leite integrando-a na Cer??mica Vieira em 1991. A quinta gera????o ?? assim composta por uma sociedade por Ant??nio Jos?? da Silva Martins Vieira e suas tr??s filhas.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.745201, -25.582865),
              );
            },
          ),
        );
        markers.add(
          Marker(
            markerId: MarkerId("Convento dos Fransciscanos"),
            position: LatLng(37.745143, -25.563158),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Convento dos Fransciscanos",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Convento dos Fransciscanos',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.745143, -25.563158),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId:
                MarkerId("Central Hidroelectrica - Museu da Eletricidade"),
            position: LatLng(37.718949, -25.46688),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Central Hidroelectrica - Museu da Eletricidade",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title:
                                    'Central Hidroelectrica - Museu da Eletricidade',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.718949, -25.46688),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Igreja Matriz"),
            position: LatLng(37.715769, -25.436565),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Igreja Matriz",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Igreja Matriz',
                                index:1,
                                text:
                                    '   A Igreja Matriz de S??o Miguel Arcanjo, na qual a sua constru????o foi ordenada por Infante Dom Henrique no s??culo XV. Apesar de existir informa????o se que a igreja fora soterrada em 1522 por um grande sismo, Gaspar Frutuoso (cronista Micaelense) atribui a trag??dia ?? fragilidade dos terrenos causada pela cultura intensa do pastel (planta Isatis Tinctoria) utilizada nos processos de tinturaria caseira. A Igreja Matriz mantem o estilo arquitet??nico das igrejas rom??nticas, com apresenta????o de tr??s naves e uma torre sineira com materiais t??picos da regi??o (basalto). O interior apresenta uma beleza ??nica de azulejaria, tralha dourada, pias de batismo lavradas em basalto e ret??bulo em alto relevo.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.715769, -25.436565),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Ermida Nossa Senhora das Vit??rias"),
            position: LatLng(37.75027, -25.33074),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Ermida Nossa Senhora das Vit??rias",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Ermida Nossa Senhora das Vit??rias',
                                index:1,
                                text:
                                    '   Inaugurada em 1886, a Ermida Nossa Senhora das Vit??rias, de estilo neog??tico, foi mandada erguer por Jos?? do Canto (promotor da introdu????o de novas culturas e tecnologias agr??colas nos A??ores), cumprindo assim um voto formulado por ocasi??o de uma doen??a grave de sua esposa. Nesta ermida jaz Jos?? do Canto e sua esposa Maria Guilhermina Taveira Brum do Canto. A sua riqueza ?? caracterizada pela imagem do altar-mor feita de jaspe (quartzo de colora????o vermelha) e pelos riqu??ssimos vitrais em toda a ermida que al??m de evocar os passos da vida de nossa Senhora das Vit??rias, est??o gravadas iniciais dos nomes Jos?? do Canto e sua esposa (JM). Pretendeu Jos?? do Canto que a presente ermida fosse uma imita????o das grandes catedrais europeias.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.75027, -25.33074),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Fumarolas"),
            position: LatLng(37.768461, -25.331446),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Fumarolas",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Fumarolas',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.768461, -25.331446),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Jardim Terra Nostra"),
            position: LatLng(37.772472, -25.31576),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Jardim Terra Nostra",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Jardim Terra Nostra',
                                index:1,
                                text:
                                    '   A origem deste parque teve in??cio em 1775 quando Thomas Hickling mandou construir uma casa em madeira com um grande tanque de ??gua e o rodeou de ??rvores. Propriedade adquirida pelo Visconde da Praia em 1848, tendo aumentado a propriedade em dois hectares onde construiu a casa do Parque e plantou um belo jardim. A amplia????o do espa??o pela aquisi????o de v??rias parcelas durou at?? 1890, tendo sido adquirido mais tarde (1935) pela Sociedade Terra Nostra sob dire????o de Vasco Bensaude que restaurou o Jardim com a interven????o do jardineiro John McInroy. O Parque Nostra conta com mais de 3 000 exemplares de esp??cies arb??reas e arbustos, permitindo assim uma riqueza de flora end??mica dos A??ores.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.772472, -25.31576),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Pra??a do Munic??pio"),
            position: LatLng(37.832384, -25.146598),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Pra??a do Munic??pio",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Pra??a do Munic??pio',
                                index:1,
                                text:
                                    '   Na pra??a do munic??pio da Ribeira Grande al??m de se completar o seu jardim, ?? poss??vel visitar tr??s edif??cios de relevo no concelho: A igreja do Senhor dos Passos, tamb??m conhecida como igreja do Espirito Santo datado de 1592, na qual est?? bem presente o estilo a????rico, com tra??os de barroco com uma decora????o exuberante e o uso de basalto de rocha negra; a C??mara Municipal que tem a sua data de constru????o no s??culo XVI, apresentando uma escadaria exterior, uma torre do rel??gio e uma janela do estilo manuelino, s??mbolo do poder pol??tico e municipal; o teatro da Ribeira Grande com uma constru????o mais recente datado de 1920, tornou-se uma verdadeira sala de espet??culos.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.832384, -25.146598),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Ermida Nossa Senhora do Pranto"),
            position: LatLng(37.855861, -25.187447),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Ermida Nossa Senhora do Pranto",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Ermida Nossa Senhora do Pranto',
                                index:1,
                                text:
                                    '   Ermida de Nossa Senhora do Pranto ?? um espa??o de grande devo????o religiosa desde o ano de 1523. Segundo a tradi????o, numa ??poca em que um surto de peste assolava o concelho de Ponta Delgada, um jovem pastor avistou a Nossa Senhora e a Virgem que ordenou a constru????o de uma ermida. A lenda, faz refer??ncia que os populares decidiram levantar a ermida junto ?? estrada de forma a facilitar a sua constru????o, muito influenciada pela falta de ??gua. Para espanto da popula????o as pedras foram movimentadas por Nossa Senhora para o local junto ao mar, no qual mais tarde brotou ??gua da parede da ermida. Muitas pessoas acorrem ?? ermida nos sete domingos da Quaresma para pagar as suas promessas ?? Senhora do Pranto.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.855861, -25.187447),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Tecelagem do Linho"),
            position: LatLng(37.83091, -25.371674),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Tecelagem do Linho",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Tecelagem do Linho',
                                index:1,
                                text:
                                    '   O linho proveniente do interior de uma planta (herb??cea) que atinge cerca de um metro de altura. O cultivo do linho foi introduzido no s??culo XVII beneficiando novos alentos para a regi??o, sendo a base de sustento de muitas fam??lias. Plantado em mar??o e apanhado em agosto, proporcionou grandes conviv??ncias entre os locais. A produ????o do linho, processo complexo desde a sua apanha, passando pelos v??rios processos de secagem, grama????o, tecelagem e fia????o. Atualmente a Tecelagem do Linho (loja museu) ?? um lugar ??nico, tendo sido inaugurado por Maria de Lurdes Lindo em 1999, no qual se dedica ?? produ????o da tecelagem e ensinamentos de todo o processo do linho. Neste local s??o partilhas mem??rias de um passado e tradi????es que refletem o papel na condi????o de mulher na ilha de S??o Miguel.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.83091, -25.371674),
              );
            },
          ),
        );
        markers.add(
          Marker(
            markerId: MarkerId("Museu do Tabaco"),
            position: LatLng(37.829332, -25.394023),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Museu do Tabaco",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Museu do Tabaco',
                                index:1,
                                text:
                                    '   A f??brica de Tabacos da Maia, fundada em 1971 por Manuel Bento Sousa, laborou at?? 1988, permanecendo as mem??rias dos processos t??cnicos da produ????o agr??ria e industrial do tabaco. Este museu contribuiu para a preserva????o da mem??ria hist??rica, social e cultural do tabaco, que apesar de ser uma f??brica familiar, foi considerado o maior espa??o de trabalho da freguesia da Maia. Integra recursos de patrim??nio que podem ser contemplados atrav??s da sala de pesagem e prensagem, secador de lume direto e indireto, ponte-b??scula e planta????es de tabaco. ',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.829332, -25.394023),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("F??brica de Ch?? Gorreana"),
            position: LatLng(37.818312, -25.402413),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "F??brica de Ch?? Gorreana",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'F??brica de Ch?? Gorreana',
                                index:1,
                                text:
                                    '   A F??brica de Ch?? Gorreana, iniciou a sua produ????o em 1883, considerando-se a mais antiga e ??nica planta????o de ch?? da Europa. Ch?? cem por cento biol??gico, no qual n??o s??o utilizados quaisquer tipos de produtos qu??micos (herbicidas, pesticidas, fungicidas, outros). Atrav??s da visita ?? f??brica ?? poss??vel contemplar as mem??rias de cinco gera????es na planta????o e todo o processo de produ????o do ch??. Al??m da visita ?? f??brica de Ch?? Gorreana e prova dos tipos de ch??, pode disfrutar-se dos trilhos atrav??s das planta????es de ch??, usufruindo de paisagens ??nicas para o mar. ',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.818312, -25.402413),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("F??brica de Ch?? Porto Formoso"),
            position: LatLng(37.815414, -25.424759),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "F??brica de Ch?? Porto Formoso",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'F??brica de Ch?? Porto Formoso',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.815414, -25.424759),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Pra??a do Munic??pio"),
            position: LatLng(37.822519, -25.52015),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Pra??a do Munic??pio",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Pra??a do Munic??pio',
                                index:1,
                                text:
                                    '   Na pra??a do munic??pio da Ribeira Grande al??m de se completar o seu jardim, ?? poss??vel visitar tr??s edif??cios de relevo no concelho: A igreja do Senhor dos Passos, tamb??m conhecida como igreja do Espirito Santo datado de 1592, na qual est?? bem presente o estilo a????rico, com tra??os de barroco com uma decora????o exuberante e o uso de basalto de rocha negra; a C??mara Municipal que tem a sua data de constru????o no s??culo XVI, apresentando uma escadaria exterior, uma torre do rel??gio e uma janela do estilo manuelino, s??mbolo do poder pol??tico e municipal; o teatro da Ribeira Grande com uma constru????o mais recente datado de 1920, tornou-se uma verdadeira sala de espet??culos.',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.822519, -25.52015),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Po??os de S??o Vicente"),
            position: LatLng(37.834418, -25.67007),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Po??os de S??o Vicente",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Po??os de S??o Vicente',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.834418, -25.67007),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Oficina Museu"),
            position: LatLng(37.830296, -25.692475),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Oficina Museu",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Oficina Museu',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.830296, -25.692475),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Vista do Rei"),
            position: LatLng(37.839331, -25.794976),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Vista do Rei",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Vista do Rei',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.839331, -25.794976),
              );
            },
          ),
        );

        markers.add(
          Marker(
            markerId: MarkerId("Campo de S??o Francisco"),
            position: LatLng(37.737549, -25.673034),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(102,153,153, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/acores.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "Campo de S??o Francisco",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(102,153,153, 1),
                                        fontFamily: 'Metropolis',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceScreen(
                                title: 'Campo de S??o Francisco',
                                index:1,
                                text: 'text',
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                LatLng(37.737549, -25.673034),
              );
            },
          ),
        );
      },
    );

    return markers;
  }
}
