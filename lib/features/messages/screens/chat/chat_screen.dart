
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../data/services/exporter.dart';
import '../../controllers/messages/messages_controller.dart';
import 'widgets/chat_app_bar.dart';
import 'widgets/chat_message_nav_bar.dart';
import 'widgets/messages_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            MessagesController.instance.showEmojiContainer.value = false;
            MessagesController.instance.showAttachmentContainer.value = false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const NetworkCheckerContainer(),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// AppBar
                const ChatAppBar(),

                Obx(
                  ()=>  AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: MessagesController
                              .instance.chatSearchBarHeight.value,
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.grey,
                          padding: const EdgeInsetsDirectional.all(TSizes.sm),
                          child: SingleChildScrollView(
                            child: TSearchContainer(
                              text: "search ...",
                              isTextField: true,
                              showSearchSuffixButton: true,
                              onPressedSearchSuffixButton: () {
                                FocusScope.of(context).unfocus();
                                MessagesController.instance.chatSearchBarHeight.value = 0;
                                MessagesController
                                    .instance.showChatBottomBar.value = true;
                              },
                              onEditingComplete: () {
                                MessagesController.instance.chatSearchBarHeight.value = 0;
                                MessagesController
                                    .instance.showChatBottomBar.value = true;
                              },
                            ),
                          ),
                        )
                ),

                /// Messages
                const MessagesBody(),
              ],
            ),
          ),
        ),

        /// message text field
        bottomNavigationBar: Obx(() =>
            MessagesController.instance.showChatBottomBar.value
                ? const ChatBottomNavBar()
                : const SizedBox()),
      ),
    );
  }
}
