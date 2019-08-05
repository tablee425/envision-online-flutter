import 'package:flutter/material.dart';
import 'package:envision_online/utils/colors.dart';
import 'package:envision_online/components/progress_dialog.dart';
import 'package:envision_online/utils/constants.dart';
import 'package:envision_online/components/top_logo_bar.dart';
import 'package:envision_online/components/card_button.dart';
import 'package:envision_online/components/card_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:envision_online/components/card_input.dart';

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
  ProgressDialog progressDialog = ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);
  CardInput _opInput = new CardInput(inputType: InputTypes.Operator);
  List areas;
  List fields;
  String selected_area;
  String selected_areaname;
  String selected_field;

  @override
  void initState() {
    super.initState();
    areas = widget.areas;
    fields = widget.fields;
    selected_area = widget.selected_area;
    selected_areaname = widget.selected_areaname;
    selected_field = fields[0]['id'].toString();
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
              _buildFieldDropdown(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CardText(title: 'Select Month'),
              _buildFieldDropdown(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              _opInput,
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CardText(title: 'Run Type'),
              _buildFieldDropdown(),
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

  String _getFieldTextByIndex(int index) {
    List filtered = fields.where((field) => field['id'] == index).toList();
    if (filtered.length > 0) {
      return filtered[0]['name'];
    } else {
      return '';
    }
  }

  void _onNext() {

  }
}
