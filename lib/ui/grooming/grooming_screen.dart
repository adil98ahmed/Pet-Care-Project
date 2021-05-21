import 'package:flutter/material.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/grooming/grooming_details_screen.dart';
import 'package:pet_care/ui/grooming/grooming_provider.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:pet_care/widgets/petService_item.dart';
import 'package:provider/provider.dart';

class GroomingScreen extends StatefulWidget {
  final UserModel currentUser;

  const GroomingScreen({Key key, this.currentUser}) : super(key: key);
  @override
  _GroomingScreenState createState() => _GroomingScreenState();
}

class _GroomingScreenState extends State<GroomingScreen> {
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
          title: "Pet Groomers",
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => PetGroomingProvider(),
        child: Consumer<PetGroomingProvider>(
          builder: (context, groomingProv, _) => groomingProv.groomings != null
              ? ListView.builder(
                  itemCount: groomingProv.groomings.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GroomingDetailScreen(
                              petService: groomingProv.groomings[index],
                              currentUser: widget.currentUser,
                            ),
                          ),
                        );
                      },
                      child: PetServiceItem(
                        petService: groomingProv.groomings[index],
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
