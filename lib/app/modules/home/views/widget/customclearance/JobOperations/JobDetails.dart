import 'package:chameleon/app/modules/home/model/customclearance/JobModel.dart';
import 'package:chameleon/generated/locales.g.dart';
import 'package:chameleon/global/controllers/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailsPage extends StatelessWidget {
  final JobModel job;
  const JobDetailsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child:SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailRow(LocaleKeys.jobCode.tr ,job.code),
              SizedBox(height: 5),
              _buildDetailRow(LocaleKeys.date.tr ,job.transactDateGregi),
              SizedBox(height: 5),
              _buildDetailRow(LocaleKeys.customerReference.tr, job.customerReference),
              SizedBox(height: 5),
              _buildDetailRow(LocaleKeys.masterBlNo.tr, job.masterBlno),
              SizedBox(height: 5),
              _buildDetailRow(LocaleKeys.customerName.tr,
                  LanguageUtils.isRtl()
                      ? job.customerNameA
                      : job.customerNameE),

            ],
          ),
        ),
      ),
    );
  }


  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }


// Widget _buildSectionHeader(String title,IconData? icon) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Row(
//       children: [
//         Icon(
//           icon,
//           color: iconColor,
//         ),
//         SizedBox(width: 10),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
