import 'package:flutter/material.dart';
import 'package:dough/ui/styles.dart';

class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.appBackgroundLight,
      appBar: AppBar(
        title: Text('Privacy Policy'),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              textSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget textSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
'This Privacy Policy describes how your personal information is collected,'
'used, and shared when you use the Dough mobile application (the "app").'
'\n\nPERSONAL INFORMATION I COLLECT'
'\n\nApp Store Information (iOS version)'
'\n\nWhen you download and install the app from the App Store, I receive anonymised statistics related to the app. I can view the country of origin (where the app was downloaded from). '
'I also see how many times the apps\'s icon has been viewed on the App store. I can calculate the total amount of times the app has been downloaded. '
'In addition, I can see which kind of Apple mobile device the app has been installed on. (For further information please refer to Apple\'s Privacy Policy '
'\nhttps://www.apple.com/za/legal/privacy/en-ww/)'
'\n\nGoogle Play Information (Android version)'
'\n\nWhen you download and install the app from Google Play, I receive anonymised statistics related to the app. Metrics include (but are not limited to) the number of installs and uninstalls, '
'ratings and app crashes. Further dimensions include the Android OS version of the device the app was installed on, the country of origin (where the app was downloaded from) and the users\' Android OS language setting. '
'For further information please refer to Google\'s Privacy Policy https://policies.google.com/privacy).'
'\n\nUser Engagement Information (iOS version)'
'\n\nI collect usage information from your device, if you have opted-in and agreed to share diagnostic and usage information with app developers via iOS. '
'(For further information please refer to Apple\'s Privacy Policy https://www.apple.com/za/legal/privacy/en-ww/). This usage information is anonymised '
'(I cannot identify who you are) and includes information about crashes (how many times the app has crashed) and sessions (how many times the app has been launched and has stayed open for longer than 2 seconds).'
'\n\nUser Engagement Information (Android version)'
'\n\nI collect usage information from your device, to better understand app performance. This usage information is anonymised (I cannot identify who you are) and includes information about crashes (how many times the app has crashed) '
'and ANRs (application not responding errors). (For further information please refer to Google\'s Privacy Policy https://policies.google.com/privacy).'
'\n\nUser-generated Information (iOS and Android versions)'
'\n\nAny user-generated content from the app is stored on the user\'s mobile device and is not shared with, or accessible by Jurgen Geitner.'
'\n\nHOW DO I USE YOUR PERSONAL INFORMATION? \n\nI use the User Engagement Information listed above (iOS and Android versions) that I collect to help improve and optimise the app (for example, by eliminating code errors). '
'Furthermore, I may use App Store and Google Play information to assess the success of marketing and advertising campaigns. '
'\n\nSHARING YOUR PERSONAL INFORMATION \n\nI do not share your Personal Information with third parties, other than Apple and Google. You can read about how Apple uses your Personal Information here: https://www.apple.com/za/legal/privacy/en-ww/. '
'Read about how Google uses your Personal Information here: https://policies.google.com/privacy'
'\n\nDATA RETENTION \n\nI do not retain your data. However, Apple (iOS version of the app) and Google (Android version of the app) may possibly retain your data. '
'(For further information please refer to Apple\'s Privacy Policy https://www.apple.com/za/legal/privacy/en-ww/ and Google\'s Privacy Policy https://policies.google.com/privacy, respectively).'
'\n\nYOUR RIGHTS'
'\n\nIf you are a European resident, you have the right to access Personal Information I hold about you and to ask that your Personal Information be corrected, updated, or deleted. '
'If you would like to exercise this right, please contactme using the contact information below.'
'\n\nLINKS \n\nThis app may contain links to other sites that have separate privacy policies.'
'\n\nCHANGES \n\nI may update this privacy policy from time to time in order to reflect, for example, changes to my practices or for other operational, legal or regulatory reasons.'
'\n\nCONTACT ME\n\nFor more information about my privacy practices, questions, or if you would like to make a complaint, please contact me via my website contact form (https://www.jurgengeitner.com/contact/) '
'or by post, using the details provided below:'
'\n\n8 Edgeware Road, Diep River 7945, Cape Town, South Africa'
' \n\nTRADEMARK NOTICE AND ATTRIBUTION \nApple®, App Store® and iOS® are trademarks of Apple Inc., registered in the U.S. and other countries.'
'\n\nGoogle™, Google Play™ and Android™ are trademarks of Google LLC., registered in the U.S. and other countries.',
        softWrap: true,
        style: Styles.minorText,
      ),
    );
  }
}
