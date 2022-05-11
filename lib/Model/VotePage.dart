import 'package:flutter/material.dart';
import 'package:onlinevoting/APIservices.dart';
import 'package:onlinevoting/Model/Candidates.dart';
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
  var cbxValue = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getCandidates();
  }

  //Get List of Candidates
  getCandidates() async {
    candidates = await ApiServices().GetCandidateList();
    positions = await ApiServices().GetPositions();
    // var _products = products?.where((x) => x.qty > 0).toList();
    if (candidates != null && positions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  vote(candidateId) async {}

  //Get list of party list
  // getPositions() async {
  //   positions = await ApiServices().GetPositions();
  //   // var _products = products?.where((x) => x.qty > 0).toList();
  //   if (positions != null) {
  //     setState(() {
  //       positionisLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('VOTE'),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: positions?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      const Text('THIS IS A TITLE'),
                      for (var item in candidates!)
                        CheckboxListTile(
                          title: Text('${item.firstName}'),
                          subtitle: Text('${item.lastName}'),
                          value: cbxValue,
                          onChanged: (value)  {
                            setState(() {
                              this.cbxValue = value!;
                              vote(item.candidateId);
                            });
                          },
                        )
                    ],
                  ),
                );
              }),
          replacement: Center(child: CircularProgressIndicator()),
        ));
  }
}
