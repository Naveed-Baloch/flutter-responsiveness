import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsiveadminpanel/blood_admin_panel/controller.dart';
import 'package:responsiveadminpanel/controllers/MenuController.dart';

import '../../constants.dart';
import 'package:provider/provider.dart';
import '../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (Responsive.isMobile(context) || Responsive.isTablet(context))
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: context.read<MenuController>().controlMenu),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 4,
              child: Text(
                'Blood Donation',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          Expanded(
            flex: 3,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: secondaryColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(defaultPadding * 0.75),
                      margin:
                          EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SvgPicture.asset("assets/icons/Search.svg"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
