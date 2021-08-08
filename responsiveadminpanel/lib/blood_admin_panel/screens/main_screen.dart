import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsiveadminpanel/blood_admin_panel/components/side_menu.dart';
import 'package:responsiveadminpanel/blood_admin_panel/model/colors.dart';
import 'package:responsiveadminpanel/blood_admin_panel/responsiveness.dart';
import 'package:responsiveadminpanel/blood_admin_panel/widgets/card_info.dart';
import 'package:responsiveadminpanel/blood_admin_panel/widgets/header.dart';
import 'package:responsiveadminpanel/blood_admin_panel/widgets/recent_requests.dart';
import 'package:responsiveadminpanel/controllers/MenuController.dart';

import '../controller.dart';
import 'package:provider/provider.dart';

class MainScreenBlood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenuBlood(),
        body: Row(
          children: [
            if (!Responsive.isMobile(context) && !Responsive.isTablet(context))
              Expanded(
                child: SideMenuBlood(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'DashBoard',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CardInfo(),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Recent Requests',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    RecentRequests(),
                    SizedBox(
                      height: Responsive.isMobile(context) ? 50 : 100,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
