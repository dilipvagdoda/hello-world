import 'package:flutter/material.dart';
import 'dart:convert';


class Biodata extends StatelessWidget {


    Row _buildskill(String skill, double level) {
      return Row(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  skill.toUpperCase(),
                  textAlign: TextAlign.left,
                ),
              )),
          SizedBox(
            height: 5,
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: LinearProgressIndicator(
                  value: level,
                ),
              )),
          SizedBox(
            height: 5,
          )
        ],
      );
    }

    ListTile _buildexperience(String companyname, String post, String year) {
      return ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.circle,
            size: 10,
            color: Colors.black,
          ),
        ),
        title: Text(
          companyname,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post),
            Text(year),
          ],
        ),
      );
    }

    ListTile _buildeducation(String fildname, String place, String year,String per) {
      return ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.circle,
            size: 10,
            color: Colors.black,
          ),
        ),
        title: Text(
          fildname,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(place),
            Text(year),
            Text(per),
          ],
        ),
      );
    }

    @override
    Widget build (BuildContext context) {

      Map bioJson = {
        "image": "images/dilip-24x24.png",
        "name": "Dilip",
        "last name": "Vagdoda",
        "email": "dilipvagdoda007@gmail.com",
        //"skill": {"education"},
        "city": "Surat,Gujrat",
        "contact":"+91 9726073320",
        "skill": [
          {"skill_name": "Flutter", "proficiency": "80"},
          {"skill_name": "java", "proficiency": "20"},
          {"skill_name": "Asp.net", "proficiency": "90"},
          {"skill_name": "Php", "proficiency": "90"},
        ],
        "edu": [
          {"filed": "10th", "place": "M.N.J. Patel school","year":"2014-2015","per":"90%"},
          {"filed": "12th", "place": "AshaDeep Vidhyalay-2","year":"2017-2018","per":"80%"},
          {"filed": "BSc", "place": "Shree S.V.Patel Collage","year":"2019-2020","per":"90%"},
        ],
        "hobby":{["reading", "gaming"]},

      };


 List Skill = bioJson["skill"];
 List Edu = bioJson["edu"];


      return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text("Resume"),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 55.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(bioJson["image"]),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Column(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  bioJson["name"].toString() +
                      " " +
                      bioJson["last name"].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textDirection: TextDirection.ltr,
                ),
                //Text(bioJson["skill"]),

                //Text(resumejson["email"]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.grey,
                    ),
                    Text(bioJson["city"],
                        style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
            //Text(resumejson["hobby"][0]),
            // Image.asset(resumejson["image"])
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 320,
                color: Colors.grey[350],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "        I would like to be a part of an organization where I could use and enhance my knowledge and talent for the development of both the organization and myself. "),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),

            Container(
                child: Text("SKILLS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline))),
            SizedBox(height: 8),

            Container(
              height: 100,
              child: Column(
                children : Skill.map((e){
                  return _buildskill(
                      e["skill_name"],double.tryParse(e["proficiency"])
                  );
                }).toList()
              ),
            ),


            Container(
                child: Text("EXPERIENCE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline))),
            SizedBox(height: 8),

            _buildexperience("IVM info", "training", "2020-2021"),

            SizedBox(height: 8),

            Container(
                child: Text("EDUCATION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline))),
            SizedBox(height: 8),

            Container(
              height: 240,
              child: Column(
                  children : Edu.map((e){
                    return _buildeducation(
                        e["filed"],(e["place"]),(e["year"]),(e["per"]));
                  }).toList()
              ),
            ),

            SizedBox(height: 8),

            Container(
                child: Text("SOCIAL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline))),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.account_circle_rounded,
                    size: 40,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.monetization_on,
                    size: 40,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                    size: 40,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
                child: Text("CONTACT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline))),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Icon(Icons.email),
                      ),
                      Text(bioJson["email"])
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Icon(Icons.phone),
                      ),
                      Text(bioJson["contact"])
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      );
    }
  }

