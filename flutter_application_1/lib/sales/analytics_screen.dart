import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';
import '../widgets/simple_bar_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String startMonth = 'June 2026';
  String endMonth = 'June 2026';

  final List<String> months = [
    'January 2026',
    'February 2026',
    'March 2026',
    'April 2026',
    'May 2026',
    'June 2026',
    'July 2026',
    'August 2026',
    'September 2026',
    'October 2026',
    'November 2026',
    'December 2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          AppStrings.analytics,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // START MONTH
            _buildMonthDropdown(
              label: AppStrings.startMonth,
              value: startMonth,
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  startMonth = value;
                });
              },
            ),

            const SizedBox(height: 8),

            // END MONTH
            _buildMonthDropdown(
              label: AppStrings.endMonth,
              value: endMonth,
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  endMonth = value;
                });
              },
            ),

            const SizedBox(height: 14),

            // SALES ANALYSIS CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      AppStrings.salesAnalysis,
                      style: TextStyle(
                        fontSize: AppSizes.small,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),

                  SimpleBarChart(
                    values: const [10000, 20000, 15000, 25000],
                    labels: const ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // TOTAL SALES
            Center(
              child: Container(
                width: 138,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0FF),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '${AppStrings.totalSales} = ₹70,000',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // SALES COMPARISON
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF0FF),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.salesComparison,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    '${AppStrings.currentMonth}              ₹70,000',
                    style: TextStyle(
                      fontSize: AppSizes.extraSmall,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${AppStrings.previousMonth}           ₹50,000',
                    style: TextStyle(
                      fontSize: AppSizes.extraSmall,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthDropdown({
    required String label,
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: const Icon(Icons.calendar_month_outlined, size: 18),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, size: 22),
      items: months.map((month) {
        return DropdownMenuItem<String>(
          value: month,
          child: Text(month, style: TextStyle(fontSize: AppSizes.extraSmall)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
