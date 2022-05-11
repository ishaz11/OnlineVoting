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
  var votedCandidates=[];

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

  vote(candidateId, count) async {

  }

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
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.check))
          ],
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: positions?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Text(
                          '${positions?[index].positionName} (Select - ${positions?[index].count})'),
                      for (var item in candidates!.where((candidate) =>
                          candidate.positionId == positions?[index].positionId))
                        CheckboxListTile(
                          title: Text('${item.firstName}'),
                          subtitle: Text('${item.partyListName}'),
                          value: item.checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              item.checkboxValue = vote(item.candidateId, positions?[index].count);
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
