import 'package:sejourne_owner/utils/popups/general_popups/primary_popup_container.dart';

import '../../../../data/services/exporter.dart';

class StatementPopup extends StatelessWidget {
  const StatementPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPopupContainer(
      headIcon: TImage.statementsIcon,
      title: "Send Statement",
      subTitle: "",
      buttonText: "yes, send my statement",
      onPressed: () {
        Get.back();
      },
      child: const Padding(
        padding: EdgeInsetsDirectional.all(TSizes.md),
        child: Text(
          textAlign: TextAlign.center,
            "By selecting 'Yes,' we will send the statement to your email address. Would you like to proceed?"),
      ),
    );
  }
}
