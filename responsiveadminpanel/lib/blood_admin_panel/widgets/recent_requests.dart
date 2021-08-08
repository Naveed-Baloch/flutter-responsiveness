import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:responsiveadminpanel/blood_admin_panel/responsiveness.dart';

class RecentRequests extends StatelessWidget {
  const RecentRequests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      minWidth: 600,
      columns: [
        DataColumn(
          label: Text('Profile Image'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Blood Group'),
        ),
        if (!Responsive.isMobile(context))
          DataColumn(
            label: Text('Date'),
          )
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Naveed')),
            DataCell(Text('O+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Asad')),
            DataCell(Text('AB+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Zeshan')),
            DataCell(Text('B+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Saweed')),
            DataCell(Text('B+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Talha')),
            DataCell(Text('A+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Nomi')),
            DataCell(Text('O+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/profile_pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DataCell(Text('Abdullah')),
            DataCell(Text('O+')),
            if (!Responsive.isMobile(context)) DataCell(Text('15/3/21')),
          ],
        ),
      ],
    );
  }
}
