import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localization.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:sample_bloc/bloc/first_bloc.dart';
import 'package:sample_bloc/common/colors.dart';
import 'package:sample_bloc/utils/screen_util.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.screen1),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  AppLocalizations.of(context)!.enterYourName,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtils.height(context) / 4,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: EditTextName(),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: SizedBox(
                  width: ScreenUtils.width(context),
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18),
                          primary: AppColors.colorButton,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/second");
                      },
                      child: Text(AppLocalizations.of(context)!.nextScreen)),
                ),
              )
            ],
          ),
        ));
  }
}

class EditTextName extends StatefulWidget {
  const EditTextName({
    Key? key,
  }) : super(key: key);
  @override
  State<EditTextName> createState() => _EditTextNameState();
}

class _EditTextNameState extends State<EditTextName> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        context.read<FirstBloc>().add(TextNameChanged(name: text));
      },
      controller: _controller,
      decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.enterYourName,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
