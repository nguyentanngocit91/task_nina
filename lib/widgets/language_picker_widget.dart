import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_nina/modules/dashboard/cubits/locale_cubit/locale_cubit.dart';
import '/l10n/l10n.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LocaleCubit>(context);
   // final locale = provider.state.locale ?? Locale('en');
    final locale=provider.state.locale;

    print(locale);

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
              (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            print("echo :${locale.languageCode}");
            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              value: locale,
              onTap: () {
                final provider= BlocProvider.of<LocaleCubit>(context,listen: false);
                //provider.state.locale;
                
                provider.setLocale(locale);

               // final pro=BlocProvider.of(context).

                //final pro=BlocProvider.of(context)
                print("output: ${provider.state.locale}");
              },
            );
          },
        ).toList(),
        onChanged: (_) {
        //  context.read<LocaleCubit>().toVietNamese();

        },
      ),
    );
  }
}