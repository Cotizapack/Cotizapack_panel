import 'package:cotizaweb/app/controllers/dashboard_controller.dart';
import 'package:cotizaweb/app/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';

class DashboardScreen extends GetResponsiveView<DashboardController> {
  @override
  Widget? phone() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
              screen: screen,
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        child: MyFiels(),
                        width: double.infinity,
                      ),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
              screen: screen,
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        child: MyFiels(),
                        width: double.infinity,
                      ),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget desktop() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
              screen: screen,
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MyFiels(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
