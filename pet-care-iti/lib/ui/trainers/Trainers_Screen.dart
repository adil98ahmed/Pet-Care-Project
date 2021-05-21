import 'package:flutter/material.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/grooming/grooming_details_screen.dart';
import 'package:pet_care/ui/trainers/trainer_provider.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:pet_care/widgets/petService_item.dart';
import 'package:provider/provider.dart';

class TrainersScreen extends StatefulWidget {
  final UserModel currentUser;

  const TrainersScreen({Key key, this.currentUser}) : super(key: key);
  @override
  _TrainersScreenState createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
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
          title: "Pet Trainers",
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TrainerProvider(),
        child: Consumer<TrainerProvider>(
          builder: (context, trainerProv, _) => trainerProv.trainers != null
              ? ListView.builder(
                  itemCount: trainerProv.trainers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GroomingDetailScreen(
                              petService: trainerProv.trainers[index],
                              currentUser: widget.currentUser,
                            ),
                          ),
                        );
                      },
                      child: PetServiceItem(
                        petService: trainerProv.trainers[index],
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
