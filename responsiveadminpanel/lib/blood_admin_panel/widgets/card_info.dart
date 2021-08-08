import 'package:flutter/material.dart';
import 'package:responsiveadminpanel/blood_admin_panel/model/colors.dart';
import 'package:responsiveadminpanel/blood_admin_panel/responsiveness.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4),
        itemBuilder: (ctx, index) {
          return Container(
            decoration: BoxDecoration(
                color: colors[index], borderRadius: BorderRadius.circular(5.0)),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.supervised_user_circle_rounded,
                      color: colors[index]),
                ),
                title: Text(
                  data[index],
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: Text(
                  '190',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
