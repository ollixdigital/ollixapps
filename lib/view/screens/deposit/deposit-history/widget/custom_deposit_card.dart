import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/style.dart';
import 'package:hyip_lab/view/components/divider/custom_divider.dart';

class CustomDepositCard extends StatelessWidget {

  final String trxData;
  final String initiatedData;
  final String gatewayData;
  final String conversionData;
  final String amountData;
  final String statusData;
  final String amountConversion;
  final Color statusColor;

  const CustomDepositCard({

    Key? key,
    required this.trxData,
    required this.initiatedData,
    required this.gatewayData,
    required this.conversionData,
    required this.amountData,
    required this.statusData,
    required this.amountConversion,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: MyColor.getCardBg(),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyStrings.trx.tr, style: interRegularSmall.copyWith(color: MyColor.getLabelTextColor())),
                  const SizedBox(height: Dimensions.space5),
                  Text(trxData, style: interRegularDefault.copyWith(color: MyColor.getPrimaryColor()))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(MyStrings.initiated.tr, style: interRegularSmall.copyWith(color: MyColor.getLabelTextColor())),
                  const SizedBox(height: Dimensions.space5),
                  Text(initiatedData, style: interRegularDefault.copyWith(color: MyColor.getTextColor()))
                ],
              )
            ],
          ),

          const CustomDivider(space: Dimensions.space10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(MyStrings.amount.tr, style: interRegularSmall.copyWith(color: MyColor.getLabelTextColor())),
                      const SizedBox(height: Dimensions.space5),
                      Text(amountData, style: interRegularDefault.copyWith(color: MyColor.getTextColor()))
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(MyStrings.gateway.tr, style: interRegularSmall.copyWith(color: MyColor.getLabelTextColor())),
                  const SizedBox(height: 8),
                  Text(gatewayData, style: interRegularDefault.copyWith(color: MyColor.getPrimaryColor()))
                ],
              )
            ],
          ),

          const CustomDivider(space: Dimensions.space10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("${MyStrings.conversion.tr}: ", style: interRegularSmall.copyWith(color: MyColor.getLabelTextColor())),
                      Text("($amountConversion)", style: interRegularExtraSmall.copyWith(color: MyColor.getPrimaryColor())),
                    ],
                  ),
                  const SizedBox(height: Dimensions.space5),

                  Text(conversionData, style: interRegularDefault.copyWith(color: MyColor.getTextColor()))
                ],
              ),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: MyColor.transparentColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: statusColor, width: 0.5)
                ),
                child: Text(statusData, style: interRegularExtraSmall.copyWith(color: statusColor), textAlign: TextAlign.center),
              )
            ],
          ),
        ],
      ),
    );
  }
}
