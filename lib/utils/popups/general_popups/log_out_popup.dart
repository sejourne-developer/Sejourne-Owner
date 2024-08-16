import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../data/services/exporter.dart';
import '../../../features/authentication/screens/login/login_screen.dart';
import '../../local_storage/loacal_db.dart';
import 'primary_popup_container.dart';

class LogOutPopUpForm extends StatelessWidget {
  const LogOutPopUpForm({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final loading=false.obs;
    return PrimaryPopupContainer(
      headIcon: TImage.signOutIcon,
      title: TTexts.signOutLabel.tr,
      subTitle: TTexts.areYouSureYouWantToLogout.tr,
      loading: loading,
      buttonText: TTexts.signOutLabel.tr,
      onPressed: () async {
        loading.value=true;
        var isSignedIn = await GoogleSignIn().isSignedIn();
        if (isSignedIn) await GoogleSignIn().signOut();
        FirebaseAuth.instance.signOut();
        DBManager().logout();
        loading.value=false;
        Get.offAll(() => const LoginScreen());
      },
    );
  }
}
