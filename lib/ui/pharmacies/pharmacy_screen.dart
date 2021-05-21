import 'package:flutter/material.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/grooming/grooming_details_screen.dart';
import 'package:pet_care/ui/pharmacies/pharmacy_provider.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:pet_care/widgets/petService_item.dart';
import 'package:provider/provider.dart';

class PharmacyScreen extends StatefulWidget {
  final UserModel currentUser;

  const PharmacyScreen({Key key, this.currentUser}) : super(key: key);
  @override
  PharmacyScreenState createState() => PharmacyScreenState();
}

class PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey,
            ),
          ),
          evaluation: 0.5,
          title: "Pharmacies",
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PharmacyProvider(),
        child: Consumer<PharmacyProvider>(
          builder: (context, pharmacyProv, _) => pharmacyProv.pharmacies != null
              ? ListView.builder(
                  itemCount: pharmacyProv.pharmacies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GroomingDetailScreen(
                              petService: pharmacyProv.pharmacies[index],
                              currentUser: widget.currentUser,
                            ),
                          ),
                        );
                      },
                      child: PetServiceItem(
                        petService: pharmacyProv.pharmacies[index],
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
