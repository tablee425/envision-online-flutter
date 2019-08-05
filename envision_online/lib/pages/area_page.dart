import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:envision_online/pages/field_page.dart';
import 'package:envision_online/futures/app_futures.dart';
import 'package:envision_online/models/FieldObject.dart';

class AreaPage extends StatefulWidget {
  final areas;
  AreaPage({Key key, @required this.areas}) : super(key: key);

  @override
  _AreaPageState createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.FETCHING_FIELD);
  List areas;
  String selected_area;

  @override
  void initState() {
    super.initState();
    areas = widget.areas;
    selected_area = areas[0]['id'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: cAppPrimaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Area', style: TextStyle(color: Colors.black, fontSize: 20.0)),
        backgroundColor: cAppPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        brightness: Brightness.light,
      ),
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            _container(),
            progressDialog,
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TopLogoBar(),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          CardText(title: 'Select Area'),
          _areaList(),
          CardButton(title: 'Next', callback: () { _onNext(); }),
        ],
      ),
    );
  }

  Widget _areaList() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: DropdownButton(
        isExpanded: true,
        value: selected_area,
        onChanged: (String newValue) {
          setState(() {
            selected_area = newValue;
          });
        },
        items: areas.map((area) => DropdownMenuItem<String>(value: area['id'].toString(), child: Text(_getAreaTextByIndex(area['id'])))).toList(),
      ),
    );
  }

  String _getAreaTextByIndex(int index) {
    List filtered = areas.where((area) => area['id'] == index).toList();
    if (filtered.length > 0) {
      return filtered[0]['name'];
    } else {
      return '';
    }
  }

  void _onNext() {
    progressDialog.showProgress();
    _fetchField(int.parse(selected_area));
  }

  void _fetchField(int area_id) async {
    FieldObject fieldObject = await fetchField(area_id);
    switch(fieldObject.id) {
      case EventConstants.FETCH_FIELD_SUCCESSFUL:
        {
          setState(() {
            progressDialog.hideProgress();
            List fields = fieldObject.object;
            if (areas.length > 0) {
              Navigator.push(
                globalKey.currentContext,
                new MaterialPageRoute(
                  builder: (context) => new FieldPage(
                    areas: areas,
                    selected_area: selected_area,
                    selected_areaname: _getAreaTextByIndex(int.parse(selected_area)),
                    fields: fields,
                  ),
                ),
              );

            } else {
              globalKey.currentState.showSnackBar(new SnackBar(duration: const Duration(seconds: 1), content: new Text(SnackBarTexts.NO_AREA)));
            }
          });
        }
        break;
      case EventConstants.FETCH_FIELD_UN_SUCCESSFUL:
        {
          setState(() {
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }
}
