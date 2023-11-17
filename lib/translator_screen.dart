import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:rapid_api/get_translate_model.dart';
import 'package:rapid_api/translate_data.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key, required this.getTranslateModel});

  final GetTranslateModel getTranslateModel;

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final contorller = Get.put(TranslattingData());
  @override
  Widget build(BuildContext context) {
    final TextEditingController _transtaltingText = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.getTranslateModel.name.toString()),
      ),
      body: Column(
        children: [
          TextField(
            controller: _transtaltingText,
          ),
          TextButton(
              onPressed: () {
                if (_transtaltingText.text.isNotEmpty) {
                  if (widget.getTranslateModel.code.toString() != 'en') {
                    contorller.transtalteData(
                        widget.getTranslateModel.code.toString(),
                        _transtaltingText.text.toString());
                  } else {
                    Navigator.pop(context);
                  }
                }
                return;
              },
              child: const Text('Translate')),
          Obx(() => Text(contorller.trans.toString()))
        ],
      ),
    );
  }
}
