import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/petServicesModel.dart';

class PetGroomService extends StatefulWidget {
  final List<Service> petServices;
  final String role;

  const PetGroomService({Key key, this.petServices, this.role})
      : super(key: key);
  @override
  _PetGroomServiceState createState() => _PetGroomServiceState();
}

class _PetGroomServiceState extends State<PetGroomService> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.petServices.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 225,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5,
                        spreadRadius: 5),
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  widget.petServices[index].servicePic))),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.petServices[index].serviceName,
                    style: TextStyle(
                        color: AppTheme.headLine1Color,
                        fontFamily: 'Co',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.role == 'pharmacy'
                        ? '\$${widget.petServices[index].price}'
                        : widget.role == 'market'
                            ? '\$${widget.petServices[index].price}'
                            : '',
                    style: TextStyle(
                        color: AppTheme.appDark,
                        fontFamily: 'Co',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          );
        });
  }
}
