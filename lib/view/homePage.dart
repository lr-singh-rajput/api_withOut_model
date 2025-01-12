import 'package:api_without_model/controller/apicall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {

    ApiCall apiCall = ApiCall();
    return  Scaffold(
appBar:  AppBar(
  title: Text("complex json no model"),
  backgroundColor:  Colors.cyan.shade500,
),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: apiCall.getUserApi(),
                builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                      heightFactor: 100,
                      widthFactor:  120,
                      child: CircularProgressIndicator());
                }else{
                  return ListView.builder(
                      itemCount: apiCall.data.length,
                      itemBuilder: (context ,index){

                        var datas = apiCall.data[index];
                        var address = datas["address"];
                        var geo = address["geo"];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.cyan.shade50,
                            child: Column(
                              children: [
                                RowReuse(title: "name", value: apiCall.data[index]['name'].toString()),
                                RowReuse(title: 'userName', value: datas['username'].toString()),
                                RowReuse(title: 'email', value: datas['email'].toString()),

                                Text('address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                                RowReuse(title: 'city', value: datas['address']["city"].toString()),
                                RowReuse(title: 'zipcode', value: address["zipcode"].toString()),
                                RowReuse(title: 'street', value: address["street"].toString()),
                                RowReuse(title: 'suite', value: address["suite"].toString()),

                                Text('geo',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                                RowReuse(title: 'lat - lng',
                                    value:geo["lat"].toString() + geo['lng'].toString()),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
                }),
          )
        ],
      ),
    );
  }
}

class RowReuse extends StatelessWidget {
  String title ,value ;
  RowReuse({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child:  Text(value),
              )
            ],
          )
        ],
      ),
    );
  }
}
