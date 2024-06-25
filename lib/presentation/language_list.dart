import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';

class LanguageList extends StatelessWidget {
  const LanguageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(LocaleKeys.language).tr(),),
      body: Column(
        children: [
          _SwitchListTileMenuItem(
              title: 'English',
              subtitle: 'English',
              locale: context.supportedLocales[0]),
          const _Divider(),
          _SwitchListTileMenuItem(
              title: 'Hindi',
              subtitle: 'हिंदी',
              locale: context.supportedLocales[1]),
          const _Divider(),
        ],
      ),
    );
  }
}
class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: const Divider(
        color: Colors.grey,
      ),
    );
  }
}
class _SwitchListTileMenuItem extends StatelessWidget {
  const _SwitchListTileMenuItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.locale,
  });

  final String title;
  final String subtitle;
  final Locale locale;

  bool isSelected(BuildContext context) => locale == context.locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
      decoration: BoxDecoration(
        border:
        isSelected(context) ? Border.all(color: Colors.blueAccent) : null,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
          ),
          subtitle: Text(
            subtitle,
          ),
          onTap: () async {
            await context.setLocale(locale); //BuildContext extension method
            Navigator.pop(context);
          }),
    );
  }
}
