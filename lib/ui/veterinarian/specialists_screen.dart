import 'package:flutter/material.dart';
import 'package:pet_care/ui/veterinarian/veterinarian_provider.dart';
import 'package:pet_care/widgets/veterinarian_item.dart';
import 'package:provider/provider.dart';

class SpecialistScreen extends StatefulWidget {
  @override
  _SpecialistScreenState createState() => _SpecialistScreenState();
}

class _SpecialistScreenState extends State<SpecialistScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VeterinarianProvider(),
      child: Consumer<VeterinarianProvider>(
        builder: (context, doctorsProv, _) => doctorsProv.doctors != null
            ? ListView.builder(
                itemCount: doctorsProv.doctors.length,
                itemBuilder: (BuildContext context, int index) {
                  return VeterinarianItem(
                    user: doctorsProv.doctors[index],
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
