import 'package:flutter/material.dart';
import 'package:pet_care/models/user_model.dart';
import 'package:pet_care/ui/grooming/grooming_details_screen.dart';
import 'package:pet_care/ui/markets/market_provider.dart';
import 'package:pet_care/widgets/appBar.dart';
import 'package:pet_care/widgets/petService_item.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatefulWidget {
  final UserModel currentUser;

  const MarketScreen({Key key, this.currentUser}) : super(key: key);
  @override
  MarketScreenState createState() => MarketScreenState();
}

class MarketScreenState extends State<MarketScreen> {
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
          title: "Stores",
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => MarketProvider(),
        child: Consumer<MarketProvider>(
          builder: (context, marketProv, _) => marketProv.markets != null
              ? ListView.builder(
                  itemCount: marketProv.markets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GroomingDetailScreen(
                              petService: marketProv.markets[index],
                              currentUser: widget.currentUser,
                            ),
                          ),
                        );
                      },
                      child: PetServiceItem(
                        petService: marketProv.markets[index],
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
