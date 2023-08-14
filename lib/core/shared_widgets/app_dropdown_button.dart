// ignore: must_be_immutable

import '../_core_exports.dart';

class AppDropdownButton extends StatefulWidget {
  final double? width;
  final double? height;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  // Object value;

  final Object? value;
  void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;

  AppDropdownButton(
      {super.key,
      this.width,
      this.height,
      this.items,
      this.onChanged,
      this.left,
      this.right,
      this.bottom,
      this.top,
      this.value});

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: widget.left ?? 0,
        right: widget.right ?? 0,
        bottom: widget.bottom ?? 0,
        top: widget.top ?? 0,
      ),
      height: widget.height ?? 48,
      width: widget.width,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.black.withOpacity(.1),
            ),
          ),
        ),
        icon: Transform.rotate(
          angle: 300,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
        // value: widget.value,
        hint: AppText(
          "Seçiniz",
          style: AppTextStyles.medium16W500,
        ), //Seçiniz

        // value değerimize seçtiğimiz değeri atıyoruz. Aynı zamanda dropdown widgetindaki ilk değer oluyor.
        isDense: true,
        isExpanded: true,
        //items liste alıyor
        items: widget.items,
        // ??
        //     widget.items!.map((value) {
        //       return DropdownMenuItem(
        //         value: value,
        //         child: AppText(
        //           value.toString(),
        //           style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        //         ),
        //       );
        //     }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
