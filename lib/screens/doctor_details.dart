import 'package:flutter/material.dart';
import 'package:flutter_app_4/models/doctor.dart';

class DoctorDetails extends StatefulWidget {
  final Doctor doctor;
  DoctorDetails(this.doctor);

  createState() {
    return DoctorState(doctor);
  }
}

class DoctorState extends State<DoctorDetails> {
  int _selectedItem = 0;
  Doctor doctor;

  DoctorState(this.doctor);

  

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(doctor.urlPhoto),
                  radius: 65,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    doctor.speciality,
                    style: TextStyle(
                        color: Color(0xff07da5f),
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(doctor.rating>0.5 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>1.5 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>2.5 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>3.5 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Icon(doctor.rating>4.5 ?  Icons.star : Icons.star_border,color: Colors.yellow[700],),
                      Padding(
                        padding: EdgeInsets.only(left:10),
                        child: Text(
                          doctor.rating.toString(),
                          style: TextStyle(fontSize: 17, color: Color(0x770000000)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top:10),
            child: Container(
              height: 2,
              width: size.width*0.9,
              color:Colors.grey[600],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:30,left:20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Short Description',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:15,left:20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                doctor.shortDescription,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.06,left:20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Location',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:5,left:20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.grey[500]),
                  Text(
                    doctor.address,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/images/location.png',width: size.width*0.9,height: size.height*0.35,),
          
          SizedBox(
            width: size.width*0.9,
            height: size.height*0.06,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.green,
              child: Text('Request',style: TextStyle(color:Colors.white),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      onTap: (index) {
        setState(() {
          _selectedItem = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('Notification'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          title: Text('Schedule'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Profile'),
        ),
      ],
    );
  }
}
