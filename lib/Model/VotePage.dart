import 'package:flutter/material.dart';
import 'package:onlinevoting/APIservices.dart';
import 'package:onlinevoting/Model/Candidates.dart';
import 'package:onlinevoting/Model/Partylist.dart';
import 'package:onlinevoting/Model/Positions.dart';

class Votepage extends StatefulWidget {
  const Votepage({Key? key}) : super(key: key);

  @override
  State<Votepage> createState() => _VotepageState();
}

class _VotepageState extends State<Votepage> {

  List<Candidates>? candidates;
  List<Positions>? positions;
  var isLoaded = false;
  var positionisLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getCandidates();
  }

  //Get List of Candidates
  getCandidates() async {
    candidates = await ApiServices().GetCandidateList();
    // var _products = products?.where((x) => x.qty > 0).toList();
    if (candidates != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

    //Get list of party list
  getPositions() async {
    positions = await ApiServices().GetPositions();
    // var _products = products?.where((x) => x.qty > 0).toList();
    if (positions != null) {
      setState(() {
        positionisLoaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VOTE'),
      ),
      body: ListView( children: <Widget>[],
      ),
    );
  }
}


