import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:envision_online/components/card_pigging.dart';

class PiggingPage extends StatefulWidget {
  final selected_areaname;
  final piggings;

  PiggingPage({
    Key key,
    @required this.selected_areaname,
    @required this.piggings
  }) : super(key: key);

  @override
  _PiggingPageState createState() => _PiggingPageState();
}

class _PiggingPageState extends State<PiggingPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  String selected_areaname;
  List piggings;

  @override
  void initState() {
    super.initState();
    selected_areaname = widget.selected_areaname;
    piggings = widget.piggings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: cAppPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Fields', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
      ),
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            _container(),
          ],
        ),
      ),
    );
  }

  Widget _container() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: cAppPrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TopLogoBar(),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text('Location: ' + selected_areaname, style: TextStyle(color: Colors.green, fontSize: 20.0)),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            new Expanded(
              child: ListView.builder(
                itemBuilder: _buildProductItem,
                itemCount: 20,
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return CardPigging(
      piggingId: piggings[index]['DT_RowId'].toString(),
      startLocation: piggings[index]['start_location'].toString(),
      endLocation: piggings[index]['end_location'].toString(),
      orderId: piggings[index]['order'].toString(),
      callback: () {
        _goPiggingEdit(index);
      }
    );
  }

  void _goPiggingEdit(int index) {
    
  }
}
