import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List data = [
    {
      "name": "Florida A&M University",
      "city": "Tallahassee",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Florida_A%26M_University_seal.svg/240px-Florida_A%26M_University_seal.svg.png"
    },
    {
      "name": "Florida Atlantic University",
      "city": "Boca Raton",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Florida_Atlantic_University_seal.svg/240px-Florida_Atlantic_University_seal.svg.png"
    },
    {
      "name": "Florida Gulf Coast University",
      "city": "Fort Myers",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Florida_Gulf_Coast_University_seal.svg/240px-Florida_Gulf_Coast_University_seal.svg.png"
    },
    {
      "name": "Florida International University",
      "city": "Miami",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Florida_Internation_University_seal.svg/240px-Florida_Internation_University_seal.svg.png"
    },
    {
      "name": "Florida Polytechnic University",
      "city": "Lakeland",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/8/82/FloridaPolyLogo2017.jpg"
    },
    {
      "name": "Florida State University",
      "city": "Tallahassee",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Florida_State_University_seal.svg/240px-Florida_State_University_seal.svg.png"
    },
    {
      "name": "New College of Florida",
      "city": "Sarasota",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/d/d4/This_is_a_logo_for_New_College_of_Florida.jpeg"
    },
    {
      "name": "University of Central Florida",
      "city": "Orlando",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/8/81/University_of_Central_Florida_seal.svg/240px-University_of_Central_Florida_seal.svg.png"
    },
    {
      "name": "University of Florida",
      "city": "Gainesville",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/6/6d/University_of_Florida_seal.svg/240px-University_of_Florida_seal.svg.png"
    },
    {
      "name": "University of North Florida",
      "city": "Jacksonville",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/b/b7/UofNorthFloridaSeal.png"
    },
    {
      "name": "University of South Florida",
      "city": "Tampa",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/thumb/d/d1/University_of_South_Florida_seal.svg/240px-University_of_South_Florida_seal.svg.png"
    },
    {
      "name": "University of West Florida",
      "city": "Pensacola",
      "logo":
      "https://upload.wikimedia.org/wikipedia/en/f/f6/University_of_West_Florida_seal.png"
    },
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<University> universities = _fetchData();
    return MaterialApp(
      // this gets rid of bannder that says "demo"
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Florida Universities'),
        ),
        body: GridView.builder(
          gridDelegate: 
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //itemCount: data.length,
          itemCount: universities?.length ?? 0,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FavoriteIcon(),
                Flexible(
                  child: Center(
                    //child: Image.network(data[index]['logo']),
                    child: Image.network(universities[index].logo),
                  ),
                ),
                Container(
                  //child: Text(data[index]['name']),
                  child: Text(universities[index].name),
                ),
                Container(
                  //child: Text(data[index]['city']),
                  child: Text(universities[index].city),
                ),
              ],
            );
            },
        ),
      ),
    );
  }
}

List<University> _fetchData() {
    final Map<String, dynamic> jsonResponse = json.decode(jsonData);
    final List<dynamic> universities = jsonResponse['universities'];
    return universities.map<University>((e) => University.fromJson(e)).toList();
  }

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key key}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool toggle = false;
  Icon deselect = Icon(Icons.favorite_border);
  Icon select = Icon(
    Icons.favorite,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          toggle = !toggle;
        });
      },
      child: toggle ? select : deselect
    );
  }
}

class University {
  String name;
  String city;
  String logo;
  University({this.name, this.city, this.logo});

  University.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.city = json['city'];
    this.logo = json['logo'];
  }
}

const String jsonData = '''
{
  "universities":
    [
      {
        "name": "Florida A&M University",
        "city": "Tallahassee",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Florida_A%26M_University_seal.svg/240px-Florida_A%26M_University_seal.svg.png"
      },
      {
        "name": "Florida Atlantic University",
        "city": "Boca Raton",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Florida_Atlantic_University_seal.svg/240px-Florida_Atlantic_University_seal.svg.png"
      },
      {
        "name": "Florida Gulf Coast University",
        "city": "Fort Myers",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Florida_Gulf_Coast_University_seal.svg/240px-Florida_Gulf_Coast_University_seal.svg.png"
      },
      {
        "name": "Florida International University",
        "city": "Miami",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Florida_Internation_University_seal.svg/240px-Florida_Internation_University_seal.svg.png"
      },
      {
        "name": "Florida Polytechnic University",
        "city": "Lakeland",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/8/82/FloridaPolyLogo2017.jpg"
      },
      {
        "name": "Florida State University",
        "city": "Tallahassee",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Florida_State_University_seal.svg/240px-Florida_State_University_seal.svg.png"
      },
      {
        "name": "New College of Florida",
        "city": "Sarasota",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/d/d4/This_is_a_logo_for_New_College_of_Florida.jpeg"
      },
      {
        "name": "University of Central Florida",
        "city": "Orlando",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/8/81/University_of_Central_Florida_seal.svg/240px-University_of_Central_Florida_seal.svg.png"
      },
      {
        "name": "University of Florida",
        "city": "Gainesville",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/6/6d/University_of_Florida_seal.svg/240px-University_of_Florida_seal.svg.png"
      },
      {
        "name": "University of North Florida",
        "city": "Jacksonville",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/b/b7/UofNorthFloridaSeal.png"
      },
      {
        "name": "University of South Florida",
        "city": "Tampa",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/thumb/d/d1/University_of_South_Florida_seal.svg/240px-University_of_South_Florida_seal.svg.png"
      },
      {
        "name": "University of West Florida",
        "city": "Pensacola",
        "logo":
            "https://upload.wikimedia.org/wikipedia/en/f/f6/University_of_West_Florida_seal.png"
      }
    ]
}
''';