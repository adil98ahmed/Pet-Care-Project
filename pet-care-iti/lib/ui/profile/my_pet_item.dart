import 'package:flutter/material.dart';
import 'package:pet_care/colors/style.dart';
import 'package:pet_care/models/pet_model.dart';
import 'package:pet_care/ui/profile/edit_pet_view.dart';

class MyPetItem extends StatelessWidget {
  final Pet pet;

  const MyPetItem({Key key, this.pet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        //  height: 220,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EditPetView(
                                pet: pet,
                              )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppTheme.appDark,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: AppTheme.appDark,
                        fontFamily: 'Co',
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(pet.img),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                pet.name,
                style: TextStyle(
                  color: AppTheme.headLine1Color,
                  fontFamily: 'Co',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                pet.species,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Co',
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
