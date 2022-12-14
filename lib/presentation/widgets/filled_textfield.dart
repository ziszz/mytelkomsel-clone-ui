import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class FilledTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const FilledTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
  });

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  String _query() => widget.controller != null ? widget.controller!.text : "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onFieldSubmitted: widget.onSubmitted,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w500,
          ),
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintText: "Cari paket favorit kamu ...",
        hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: const ImageIcon(
          AssetImage(
            "images/ic_search.png",
          ),
          color: AppColors.grey,
        ),
        suffixIcon: _query().isNotEmpty
            ? IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.controller != null) {
                      widget.controller!.clear();
                    }
                    if (widget.onSubmitted != null) {
                      widget.onSubmitted!("");
                    }
                  });
                },
                icon: const ImageIcon(
                  AssetImage(
                    "images/ic_clear.png",
                  ),
                  color: AppColors.greyDark,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
