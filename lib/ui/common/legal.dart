import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/config.dart';
import '../../core/theme.dart';

/// صفحات الخصوصية والشروط وحذف الحساب على الموقع. App Store وGoogle Play
/// يطلبان أن تُفتح من داخل التطبيق، فتُعرض في متصفح داخلي لا يُخرج المستخدم منه.
void openLegalPage(String url) => launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);

/// رابطا سياسة الخصوصية والشروط في سطر واحد — في شاشة الدخول، قبل أي حساب
class LegalLinks extends StatelessWidget {
  const LegalLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.palette;
    Widget link(String label, String url) => TextButton(
      style: TextButton.styleFrom(
        foregroundColor: p.inkSoft,
        textStyle: txt(12.5, weight: FontWeight.w600),
      ),
      onPressed: () => openLegalPage(url),
      child: Text(label),
    );
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        link('سياسة الخصوصية', AppConfig.privacyUrl),
        Text('·', style: txt(13, color: p.inkFaint)),
        link('الشروط والأحكام', AppConfig.termsUrl),
      ],
    );
  }
}
