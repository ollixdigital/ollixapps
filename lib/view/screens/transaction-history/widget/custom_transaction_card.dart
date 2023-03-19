import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/style.dart';
import 'package:hyip_lab/data/controller/account/transaction_history_controller.dart';
import 'package:hyip_lab/view/components/divider/custom_divider.dart';

class CustomTransactionCard extends StatelessWidget {

  final String trxData;
  final String dateData;
  final String amountData;
  final String detailsText;
  final String postBalanceData;
  final int index;

  const CustomTransactionCard({

    Key? key,
    required this.index,
    required this.trxData,
    required this.dateData,
    required this.amountData,
    required this.postBalanceData,
    required this.detailsText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TransactionController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
        decoration: BoxDecoration(
            color: MyColor.getCardBg(),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyStrings.trx.tr, style: interRegularExtraSmall.copyWith(color: MyColor.getLabelTextColor())),
                    const SizedBox(height: 2),
                    Text(trxData, style: interRegularDefault.copyWith(color: MyColor.getPrimaryColor()))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyStrings.date.tr, style: interRegularExtraSmall.copyWith(color: MyColor.getLabelTextColor())),
                    const SizedBox(height: 2),
                    Text(dateData, style: interRegularDefault.copyWith(color: MyColor.getTextColor()))
                  ],
                )
              ],
            ),

            const CustomDivider(space: Dimensions.space15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyStrings.amount.tr, style: interRegularExtraSmall.copyWith(color: MyColor.getLabelTextColor())),
                    const SizedBox(height: 8),
                    Text(amountData, style: interRegularDefault.copyWith(color: changeTextColor(controller.transactionList[index].trxType.toString(), controller)))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(MyStrings.postBalance.tr, style: interRegularExtraSmall.copyWith(color: MyColor.getLabelTextColor())),
                    const SizedBox(height: 8),
                    Text(postBalanceData, style: interRegularDefault.copyWith(color: MyColor.getTextColor()))
                  ],
                )
              ],
            ),

            const CustomDivider(space: Dimensions.space15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyStrings.details.tr, style: interRegularExtraSmall.copyWith(color: MyColor.getLabelTextColor())),
                const SizedBox(height: 8),
                Text(detailsText, style: interRegularDefault.copyWith(color: MyColor.getPrimaryColor()))
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Color changeTextColor(String trxType, TransactionController controller){
    trxType = controller.transactionList[index].trxType ?? "";
    return trxType == "-" ? MyColor.red : MyColor.green;
  }
}
