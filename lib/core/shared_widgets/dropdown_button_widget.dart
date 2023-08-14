import '../_core_exports.dart';

class DropdownButtonWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  // Object value;

  List<DropdownMenuItem<Object>>? dropdownList;
  List<Object>? items;
  Object? value;
  void Function(Object?)? onChanged;

  DropdownButtonWidget(
      {super.key,
      this.width,
      this.height,
      this.items,
      this.dropdownList,
      this.onChanged,
      this.left,
      this.right,
      this.bottom,
      this.top,
      this.value});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
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
          fillColor: AppColors.lightWhite,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColors.lightBlue,
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
        hint: const Text("Seçiniz"),

        // value değerimize seçtiğimiz değeri atıyoruz. Aynı zamanda dropdown widgetindaki ilk değer oluyor.
        isDense: true,
        isExpanded: true,
        //items liste alıyor
        items: widget.dropdownList ??
            widget.items!.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
