import 'package:flutter/material.dart';
import 'package:dough/ui/styles.dart';


class LicenseScreen extends StatelessWidget {
  LicenseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.appBackgroundLight,
      appBar: AppBar(
        title: Text('Licenses'),
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
        
              'Dough'
      '\n\nMIT License '
'\n\nCopyright (c) 2020 Jurgen Geitner '
'\n\nPermission is hereby granted, free of charge, to any person obtaining a copy '
'\nof this software and associated documentation files (the "Software"), to deal '
'\nin the Software without restriction, including without limitation the rights '
'\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell '
'\ncopies of the Software, and to permit persons to whom the Software is '
'\nfurnished to do so, subject to the following conditions: '
'\n\nThe above copyright notice and this permission notice shall be included in all '
'\ncopies or substantial portions of the Software. '
'\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR '
'\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, '
'\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE '
'\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER '
'\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, '
'\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE '
'\nSOFTWARE.',
        softWrap: true,
        style: Styles.minorText,
      ),
    );
  }
}
