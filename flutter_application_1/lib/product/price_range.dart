import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
class PriceRangePage extends StatefulWidget {
  const PriceRangePage({super.key});

  @override
  State<PriceRangePage> createState() =>
      _PriceRangePageState();
}

class _PriceRangePageState
    extends State<PriceRangePage> {

  // =================================================
  // SELECTED RANGE
  // =================================================

  int selectedRange = 0;


  // =================================================
  // BACK TO PRODUCT SCREEN
  // =================================================

  void goToProductScreen() {
    Navigator.pop(context);
  }


  // =================================================
  // RESET
  // =================================================

  void resetPriceRange() {

    setState(() {
      selectedRange = 0;
    });
  }


  // =================================================
  // APPLY
  // =================================================

  void applyPriceRange() {
    Navigator.pop(context);
  }


  // =================================================
  // RANGE BUTTON
  // =================================================

  Widget rangeButton({
    required int index,
    required String text,
  }) {

    final bool isSelected =
        selectedRange == index;

    return SizedBox(
      width:
          AppSizes.rangeButtonWidth,

      height:
          AppSizes.rangeButtonHeight,

      child: OutlinedButton(

        onPressed: () {

          setState(() {
            selectedRange = index;
          });

        },

        style: OutlinedButton.styleFrom(

          backgroundColor:
              AppColors.white,

          side: BorderSide(
            color: isSelected
                ? AppColors.primary
                : AppColors.border,

            width: 1,
          ),

          padding:
              EdgeInsets.zero,

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
              AppSizes.rangeButtonRadius,
            ),
          ),
        ),

        child: Text(

          text,

          style: TextStyle(

            color:
                AppColors.black,

            fontSize:
                AppSizes.rangeTextSize,

            fontWeight:
                FontWeight.normal,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          AppColors.white,


      // =================================================
      // APP BAR
      // =================================================

      appBar: AppBar(

        backgroundColor:
            AppColors.primary,

        elevation: 0,

        toolbarHeight:
            AppSizes.appBarHeight,

        automaticallyImplyLeading:
            false,

        title: Row(
          children: [

            // BACK BUTTON

            IconButton(

              onPressed:
                  goToProductScreen,

              padding:
                  EdgeInsets.zero,

              icon: const Icon(

                Icons.arrow_back,

                color:
                    AppColors.white,

                size:
                    AppSizes.backIconSize,
              ),
            ),

            const SizedBox(
              width:
                  AppSizes.titleSpacing,
            ),

            const Text(

              AppStrings.priceRange,

              style: TextStyle(

                color:
                    AppColors.white,

                fontSize:
                    AppSizes.appBarTitleSize,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),


      // =================================================
      // BODY
      // =================================================

      body: Padding(

        padding:
            const EdgeInsets.symmetric(
          horizontal:
              AppSizes.pricePagePadding,
        ),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // =================================================
            // SELECT PRICE RANGE
            // =================================================

            const SizedBox(
              height:
                  AppSizes.priceTopSpacing,
            ),

            const Text(

              AppStrings.selectPriceRange,

              style: TextStyle(

                fontSize: 11,

                fontWeight:
                    FontWeight.bold,

                color:
                    AppColors.black,
              ),
            ),


            const SizedBox(
              height: 16,
            ),


            // =================================================
            // MINIMUM / MAXIMUM PRICE
            // =================================================

            Row(
              children: [

                // MINIMUM PRICE

                Expanded(
                  child: Container(

                    height:
                        AppSizes.priceBoxHeight,

                    decoration:
                        BoxDecoration(

                      color:
                          AppColors.greyColor,

                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.priceBoxRadius,
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        const Text(

                          AppStrings.minimumPrice,

                          style: TextStyle(

                            fontSize:
                                AppSizes.priceBoxTextSize,

                            color:
                                AppColors.black,
                          ),
                        ),

                        const Text(

                          AppStrings.minPriceValue,

                          style: TextStyle(

                            fontSize:
                                AppSizes.priceBoxTextSize,

                            color:
                                AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                const SizedBox(
                  width: 20,
                ),


                // MAXIMUM PRICE

                Expanded(
                  child: Container(

                    height:
                        AppSizes.priceBoxHeight,

                    decoration:
                        BoxDecoration(

                      color:
                          AppColors.greyColor,

                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.priceBoxRadius,
                      ),
                    ),

                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        const Text(

                          AppStrings.maximumPrice,

                          style: TextStyle(

                            fontSize:
                                AppSizes.priceBoxTextSize,

                            color:
                                AppColors.black,
                          ),
                        ),

                        const Text(

                          AppStrings.maxPriceValue,

                          style: TextStyle(

                            fontSize:
                                AppSizes.priceBoxTextSize,

                            color:
                                AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),


            const SizedBox(
              height: 10,
            ),


            // =================================================
            // FIRST ROW
            // =================================================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                rangeButton(
                  index: 1,
                  text:
                      AppStrings.range1,
                ),

                rangeButton(
                  index: 2,
                  text:
                      AppStrings.range2,
                ),
              ],
            ),


            const SizedBox(
              height: 10,
            ),


            // =================================================
            // SECOND ROW
            // =================================================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                rangeButton(
                  index: 3,
                  text:
                      AppStrings.range3,
                ),

                rangeButton(
                  index: 4,
                  text:
                      AppStrings.range4,
                ),
              ],
            ),


            const SizedBox(
              height: 14,
            ),


            // =================================================
            // ABOVE ₹1000
            // =================================================

            Center(
              child: rangeButton(
                index: 5,
                text:
                    AppStrings.range5,
              ),
            ),


            // =================================================
            // SPACE
            // =================================================

            const Spacer(),


            // =================================================
            // RESET + APPLY
            // =================================================

            Padding(
              padding:
                  const EdgeInsets.only(
                bottom: 28,
              ),

              child: Row(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  // RESET

                  SizedBox(

                    width:
                        AppSizes.bottomButtonWidth,

                    height:
                        AppSizes.bottomButtonHeight,

                    child: ElevatedButton(

                      onPressed:
                          resetPriceRange,

                      style:
                          ElevatedButton.styleFrom(

                        backgroundColor:
                            AppColors.white,

                        foregroundColor:
                            AppColors.black,

                        elevation:
                            AppSizes.bottomButtonElevation,

                        shadowColor:
                            Colors.black54,

                        padding:
                            EdgeInsets.zero,

                        shape:
                            RoundedRectangleBorder(

                          borderRadius:
                              BorderRadius.circular(
                            AppSizes.bottomButtonRadius,
                          ),
                        ),
                      ),

                      child: const Text(

                        AppStrings.reset,

                        style: TextStyle(

                          fontSize:
                              AppSizes.bottomButtonTextSize,

                          fontWeight:
                              FontWeight.normal,
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(
                    width: 16,
                  ),


                  // APPLY

                  SizedBox(

                    width:
                        AppSizes.bottomButtonWidth,

                    height:
                        AppSizes.bottomButtonHeight,

                    child: ElevatedButton(

                      onPressed:
                          applyPriceRange,

                      style:
                          ElevatedButton.styleFrom(

                        backgroundColor:
                            AppColors.primary,

                        foregroundColor:
                            AppColors.white,

                        elevation:
                            AppSizes.bottomButtonElevation,

                        shadowColor:
                            Colors.black54,

                        padding:
                            EdgeInsets.zero,

                        shape:
                            RoundedRectangleBorder(

                          borderRadius:
                              BorderRadius.circular(
                            AppSizes.bottomButtonRadius,
                          ),
                        ),
                      ),

                      child: const Text(

                        AppStrings.apply,

                        style: TextStyle(

                          fontSize:
                              AppSizes.bottomButtonTextSize,

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
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
}
