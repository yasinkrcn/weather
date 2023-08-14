import '../_core_exports.dart';

class AppTextFormField extends StatelessWidget {
  final double _verticalPadding = 12;

  final String hintText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscure;
  final double? width;
  final double? height;
  final void Function()? onTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final int? minLines;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  final String? errorText;
  final int? maxLength;
  final double? borderRadius;

  const AppTextFormField._({
    Key? key,
    required this.hintText,
    this.controller,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.width,
    this.height,
    this.onChanged,
    this.validator,
    this.isObscure = false,
    this.focusedBorder,
    this.enabledBorder,
    this.maxLines,
    this.textAlignVertical,
    this.contentPadding,
    this.keyboardType,
    this.textStyle,
    this.minLines,
    this.left,
    this.right,
    this.bottom,
    this.top,
    this.errorText,
    this.maxLength,
    this.borderRadius,
  }) : super(key: key);

  factory AppTextFormField.standart({
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    prefixIcon,
    suffixIcon,
    void Function(String)? onChanged,
    double? height,
    TextAlignVertical? textAlignVertical,
    InputBorder? enabledBorder,
    EdgeInsetsGeometry? contentPadding,
    TextInputType? keyboardType,
    textStyle,
    double? left,
    double? right,
    double? bottom,
    double? top,
    String? errorText,
    double? borderRadius,
  }) {
    return AppTextFormField._(
        controller: controller,
        hintText: hintText ?? "",
        validator: validator,
        prefixIcon: prefixIcon,
        onChanged: onChanged,
        suffixIcon: suffixIcon,
        height: height,
        textAlignVertical: TextAlignVertical.center,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        keyboardType: keyboardType,
        textStyle: textStyle,
        bottom: bottom,
        top: top,
        errorText: errorText,
        borderRadius: borderRadius);
  }

  factory AppTextFormField.obscure({
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function()? onTap,
    double? height,
    TextAlignVertical? textAlignVertical,
    double? bottom,
    double? top,
    bool? isObscure,
    Widget? suffixIcon,
    String? errorText,
  }) {
    return AppTextFormField._(
      onTap: onTap,
      isObscure: isObscure ?? true,
      hintText: hintText,
      validator: validator,

      controller: controller,
      // height: 48,
      textAlignVertical: TextAlignVertical.center,
      suffixIcon: suffixIcon,
      bottom: bottom,
      top: top,
      errorText: errorText,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      // suffixIcon: const Icon(
      //   Icons.visibility,
      //   color: ColorHelper.secondaryColor,
      // ),
    );
  }

  factory AppTextFormField.chat(
      {String? hintText,
      Widget? suffixIcon,
      Color? fillColor,
      TextEditingController? controller,
      String? Function(String?)? validator,
      Widget? prefixIcon,
      void Function()? onTap,
      double? width,
      double? height,
      InputBorder? focusedBorder,
      InputBorder? enabledBorder,
      TextAlignVertical? textAlignVertical,
      EdgeInsetsGeometry? contentPadding,
      int? minLines,
      int? maxLines,
      double? bottom,
      double? top,
      String? errorText,
      void Function(String)? onChanged,
      int? maxLength}) {
    return AppTextFormField._(
      // height: 96,
      controller: controller,
      hintText: hintText ?? "",
      // fillColor: ColorHelper.secondaryColor.withOpacity(.1),
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      onTap: onTap,
      width: width,
      onChanged: onChanged,
      maxLength: maxLength,
      // focusedBorder: OutlineInputBorder(
      //   borderSide: const BorderSide(color: Colors.transparent),
      //   borderRadius: BorderRadius.circular(24),
      // ),
      // enabledBorder: UnderlineInputBorder(
      //   borderSide: const BorderSide(color: Colors.transparent),
      //   borderRadius: BorderRadius.circular(24),
      // ),

      maxLines: 6,
      minLines: minLines ?? 5, // textformfield chat boyutunu arttırmak için minlines arttırılmalı

      textAlignVertical: TextAlignVertical.center,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

      bottom: bottom,
      top: top,
      errorText: errorText,
    );
  }

  @override
  Widget build(BuildContext context) {
    const heightErrorMessage = 24; //error text height değeri!!
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
        top: top ?? 0,
      ),

      height: errorText != null ? height! + heightErrorMessage : height,
      width: width,
      constraints: const BoxConstraints(
        maxHeight: 200,
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isObscure,
        validator: validator,
        textAlignVertical: textAlignVertical,
        maxLength: maxLength,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          contentPadding: contentPadding,

          hintText: hintText,
          hintStyle: AppTextStyles.medium14W500.copyWith(color: AppColors.blackVariantGrey),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor ?? AppColors.white,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8),
          //   borderSide: BorderSide(color: Colors.green)

          // ),

          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5)),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  borderSide: const BorderSide(color: AppColors.strokeGrey, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1.5,
              )),
          errorText: errorText,
        ),
        keyboardType: keyboardType ?? TextInputType.multiline,
        textInputAction: TextInputAction.send,
        style: textStyle ?? AppTextStyles.medium15W500,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
      ),
    );
  }
}
