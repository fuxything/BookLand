import 'dart:async';
import 'dart:ffi';

import 'package:bookland/elements/appBar.dart';
import 'package:bookland/elements/drawer.dart';
import 'package:bookland/services/globalVariable.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:io';
import 'dart:convert';
import 'package:bookland/services/HTTP.dart';
import 'package:bookland/model/model_shippingcompany.dart';

//TODO CUSTOMER SPECIAL
class Payment extends StatelessWidget {
  static const String _title = 'Payment';
  final String totalcost;
  final String shippingcompany_id;
  final String customerid;
  Payment({Key key, @required this.totalcost , @required this.shippingcompany_id ,this.customerid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: PaymentStatefulWidget(totalcost,shippingcompany_id,customerid),
    );
  }
}

class PaymentStatefulWidget extends StatefulWidget {
  final String totalcost;
  final String shippingcompany_id;
  final String customerid;
  PaymentStatefulWidget(this.totalcost,this.shippingcompany_id,this.customerid);

  @override
  _PaymentPageState createState() => _PaymentPageState(totalcost,shippingcompany_id,customerid);
}

class _PaymentPageState extends State<PaymentStatefulWidget> {
  final String totalcost;
  final String shippingcompany_id;
  final String customerid;
  _PaymentPageState(this.totalcost , this.shippingcompany_id,this.customerid);
   final HTTPAll http_obj = HTTPAll();

  String cardnumber;
  String card_owner;
  String month = "MONTH";
  String year = "YEAR";
  String cvc;



  TextEditingController cardnumberController = new TextEditingController();
  TextEditingController card_ownerController = new TextEditingController();
  TextEditingController cvcController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: MyAppBar(
            pageTitle: "Payment",
            back: true,
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: new Stack(
              children: <Widget>[_showForm(context,totalcost)],
            ),
          ),
        ));
  }

  Widget _showForm(BuildContext context,String totalcost ) {
    return new Container(
      padding: EdgeInsets.all(1.0),
        //resizeToAvoidBottomPadding: false,
        child: new SingleChildScrollView(
        child: new Column(
          //shrinkWrap: true,
          children: <Widget>[
            //dropdown(context),
         showCardNumberInput(),
            showCardOwnerInput(),
            Text("\nValid Thru" ,style: TextStyle(fontWeight: FontWeight.bold), ),
            //Text("Month" ,style: TextStyle(fontWeight: FontWeight.bold), ),
            Row( children: <Widget>[
              Text("\t\t"),
               Icon(
                Icons.credit_card,
                color: Colors.green,
              ),dropdownMonth(context),
            ]),
            Row( children: <Widget>[
              Text("\t\t"),
               Icon(
                Icons.credit_card,
                color: Colors.green,
              ), dropYear(context),
            ]),
            showCVCInput(),
            Text("\nTotal Cost:\$${totalcost}" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20), ),
            showPayButton(totalcost),
            Image.asset('assets/payment.jpg')
          ],
        ),
      ),
    );
  }


  Widget showCardNumberInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 0.0),
      child: new TextFormField(
        controller: cardnumberController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Card Number',
          icon: new Icon(
            Icons.credit_card,
            color: Colors.green,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
    );
  }
  Widget showCardOwnerInput() {

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 0.0),
      child: new TextFormField(
        controller: card_ownerController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Card Owner',
          icon: new Icon(
            Icons.person,
            color: Colors.black,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
    );
  }


  Widget showMonthInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 0.0),
      child: new TextFormField(
        //controller: monthController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Month',
          icon: new Icon(
            Icons.credit_card,
            color: Colors.green,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
        ),
      ),
    );
  }  Widget showYearInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 0.0),

      child: new TextFormField(
        //controller: yearController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Year',
          icon: new Icon(
            Icons.credit_card,
            color: Colors.green,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
        ),
      ),
    );
  }

  Widget showCVCInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 50, 0.0),
      child: new TextFormField(
        controller: cvcController,
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'CVC',
          icon: new Icon(
            Icons.credit_card,
            color: Colors.green,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width:1.0),
          ),
        ),

      ),
    );
  }

  Widget dropYear(BuildContext context) {
    String dropdownValue = year;
    return Container(
        width: 300.0,
        height: 60,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal:30.0,

        ),
        decoration: ShapeDecoration(

        shape: RoundedRectangleBorder(

        side: BorderSide(width: 0.50, style: BorderStyle.solid,color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    ),

    child: DropdownButtonHideUnderline(
    child: ButtonTheme(

    alignedDropdown: true,
    child : DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 30,
      elevation: 25,
      style: TextStyle(color: Colors.black),

      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          year = newValue;}
        );
      },
      items: <String>['YEAR','2020', '2021', '2022', '2023','2024', '2025', '2026', '2027','2028', '2029', '2030', '2031','2032', '2033', '2034', '2035']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value ,style: TextStyle(fontWeight: FontWeight.bold), ) ,
        );
      }).toList(),
    ))));
  }
  Widget dropdownMonth(BuildContext context) {
    String dropdownValue = month;
    return Container(
        width: 300.0,
        height: 60,
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, style: BorderStyle.solid,color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    ),
    child: DropdownButtonHideUnderline(
    child: ButtonTheme(
    alignedDropdown: true,
    child : DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 30,
      elevation: 25,
      style: TextStyle(color: Colors.black),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          month = newValue;}
        );
      },
      items: <String>['MONTH','01', '02 ', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value ,style: TextStyle(fontWeight: FontWeight.bold), ) ,
        );
      }).toList(),
    ))));
  }
  Widget dropdown(BuildContext context) {
    final HTTPAll http_obj = HTTPAll();
    String dropdownValue = "Shipping Company";

     Scaffold(
        appBar: MyAppBar(
          pageTitle: "Shipping Companies",
          back: true,
        ),
        body : FutureBuilder(
            future: http_obj.getCompanies(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("HERE IMAMMMM");
              if (snapshot.hasData) {
                List<Model_ShippingCompany> shippingCompList =  snapshot.data;
                List<String> printList = ['Shipping Company'];
                for(int i = 0; i<shippingCompList.length;i++){
                  printList.add(shippingCompList[i].companyName + "\t\$"+ shippingCompList[i].shippingPrice );
                }
                print(printList);
                print("snapshot has data");
                print("Here");
                return Container(
                    width: 300.0,
                    height: 60,
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal:30.0,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.50, style: BorderStyle.solid,color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child :DropdownButton<String>(

                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 30,
                              elevation: 25,
                              style: TextStyle(color: Colors.black),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                  //shipping_company = newValue;
                                }
                                );
                              },
                              items: printList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value ,style: TextStyle(fontWeight: FontWeight.bold), ) ,
                                );
                              }).toList(),
                            ))));
              } else if (snapshot.hasError) {
                print("Snapshot has error*");
                return Text("${snapshot.error}");
              } else {
                print("EROROOROR");
                return Center(child: CircularProgressIndicator());
              }
            }
        ));


  }


  Widget showPayButton(String totalCost) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(130, 10, 130, 10),
      child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          color: Colors.red,
          disabledColor: Colors.redAccent,
          //add this to your code,
          child: new Text("Pay",
              style: new TextStyle(fontSize: 20.0, color: Colors.black87)),
          // TODO onPressed should be updated
          onPressed: () {
            //_formKey.currentState.validate();


            cardnumber = cardnumberController.text;
            card_owner = card_ownerController.text;
            month = month; //monthController.text;
            year = year;//yearController.text;
            cvc = cvcController.text;

            var result = http_obj.Payment( customerid,cardnumber,card_owner, month, year, cvc, shippingcompany_id);

            // print(result);
            //print("****" + errorControl.toString());
            Timer(Duration(seconds: 1), () {
              if (errorControl == false) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Payment"),
                      content: new Text("Payment is successful"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );


              }
              else {
                errorControl = false;
                Timer(Duration(seconds: 1), () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("Payment"),
                        content: new Text(errorMessage),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                });
              }
            });
          }),
    );
  }
}

