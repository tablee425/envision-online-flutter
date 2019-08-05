import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:envision_online/components/card_input.dart';
import 'package:envision_online/futures/app_futures.dart';
import 'package:envision_online/models/PiggingObject.dart';

class FieldPage extends StatefulWidget {
  final areas;
  final fields;
  final selected_area;
  final selected_areaname;
  FieldPage({
    Key key,
    @required this.areas,
    @required this.fields,
    @required this.selected_area,
    @required this.selected_areaname,
  }) : super(key: key);

  @override
  _FieldPageState createState() => _FieldPageState();
}

class _FieldPageState extends State<FieldPage> {
  final globalKey = new GlobalKey<ScaffoldState>();
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.FETCHING_PIGGING);
  CardInput _opInput = new CardInput(inputType: InputTypes.Operator);
  List areas;
  List fields;
  String selected_area;
  String selected_areaname;
  String selected_field;
  List<String> year = ['2016', '2017', '2018', '2019', '2020', '2021', '2022'];
  String selected_year;
  List<String> month = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
  String selected_month;
  List runTypes = [RunTypes.Maintenance, RunTypes.CorrosionBatch, RunTypes.PressureCheck];
  String selected_runType;

  @override
  void initState() {
    super.initState();
    areas = widget.areas;
    fields = widget.fields;
    selected_area = widget.selected_area;
    selected_areaname = widget.selected_areaname;
    selected_field = fields[0]['id'].toString();
    selected_year = DateTime.now().year.toString();
    selected_month = DateTime.now().month.toString();
    selected_runType = RunTypes.Maintenance;
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
      child: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TopLogoBar(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text('Location: ' + selected_areaname, style: TextStyle(color: Colors.green, fontSize: 20.0)),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              CardText(title: 'Select Field'),
              _buildFieldDropdown(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CardText(title: 'Select Year'),
              _buildYearDropdown(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CardText(title: 'Select Month'),
              _buildMonthDropdown(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              _opInput,
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CardText(title: 'Run Type'),
              _buildRunTypeDropdown(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CardButton(title: 'Next', callback: () { _onNext(); }),
            ],
          ),
        ],
      )

    );
  }

  Widget _buildFieldDropdown() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          DropdownButton(
            isExpanded: true,
            value: selected_field,
            onChanged: (String newValue) {
              setState(() {
                selected_field = newValue;
              });
            },
            items: fields.map((field) => DropdownMenuItem<String>(value: field['id'].toString(), child: Text(_getFieldTextByIndex(field['id'])))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildYearDropdown() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          DropdownButton(
            isExpanded: true,
            value: selected_year,
            onChanged: (String newValue) {
              setState(() {
                selected_year = newValue;
              });
            },
            items: year.map((y) => DropdownMenuItem<String>(value: y, child: Text(y))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          DropdownButton(
            isExpanded: true,
            value: selected_month,
            onChanged: (String newValue) {
              setState(() {
                selected_month = newValue;
              });
            },
            items: month.map((m) => DropdownMenuItem<String>(value: m, child: Text(m))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRunTypeDropdown() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          DropdownButton(
            isExpanded: true,
            value: selected_runType,
            onChanged: (String newValue) {
              setState(() {
                selected_runType = newValue;
              });
            },
            items: runTypes.map((r) => DropdownMenuItem<String>(value: r, child: Text(r))).toList(),
          ),
        ],
      ),
    );
  }

  String _getFieldTextByIndex(int index) {
    List filtered = fields.where((field) => field['id'] == index).toList();
    if (filtered.length > 0) {
      return filtered[0]['name'];
    } else {
      return '';
    }
  }

  void _onNext() {
    progressDialog.showProgress();
    _fetchPigging(205, '', 2019, 8, 1);
//    Navigator.push(
//      globalKey.currentContext,
//      new MaterialPageRoute(
//        builder: (context) => new PiggingPage(
//          selected_areaname: selected_areaname
//        ),
//      ),
//    );
  }

  void _fetchPigging(int field_id, String operator, int year, int month, int view) async {
    PiggingObject piggingObject = await fetchPigging(field_id, operator, year, month, view);
    switch(piggingObject.id) {
      case EventConstants.FETCH_PIGGING_SUCCESSFUL:
        {
          setState(() {
            progressDialog.hideProgress();
            List piggings = piggingObject.object;
            print(piggings.length);
          });
        }
        break;
      case EventConstants.FETCH_PIGGING_UN_SUCCESSFUL:
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
