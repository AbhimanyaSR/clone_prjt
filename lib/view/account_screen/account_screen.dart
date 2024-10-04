import 'package:clone_prjt/Dummy_db.dart';
import 'package:clone_prjt/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "User Name",
                style: AppTextStyles.body16,
              ),
            ],
          ),
          SizedBox(height: 16),
          ListView.builder(
            itemCount: account.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: FaIcon(
                  account[index][0],
                  size: 24,
                  color: Colors.black,
                ),
                title: Text(
                  account[index][1],
                  style: AppTextStyles.body16,
                ),
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
