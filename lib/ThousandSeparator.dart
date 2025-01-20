import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // حذف تمامی کاراکترهای غیر عددی
    String numericString = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    if (numericString.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // فرمت‌بندی عدد با جداکننده هزارگان
    String formatted = _formatter.format(int.parse(numericString));

    // محاسبه موقعیت کرسر
    int selectionIndex = formatted.length -
        (oldValue.text.length - oldValue.selection.end);

    if (selectionIndex < 0) {
      selectionIndex = 0;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
