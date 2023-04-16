import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:space_x/const/app_strings.dart';

class AppSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<String>? suggestions;
  final Function(String data)? onSuggestionTap;
  const AppSearchBar({
    Key? key,
    required this.title,
    this.leading,
    this.suggestions,
    this.onSuggestionTap,
  }) : super(key: key);

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _AppSearchBarState extends State<AppSearchBar> {
  late String searchValue = "";

  @override
  EasySearchBar build(BuildContext context) {
    return EasySearchBar(
      leading: widget.leading,
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      searchHintText: AppStrings.searchHint,
      openOverlayOnSearch: true,
      suggestions: widget.suggestions,
      onSearch: (value) => setState(() => searchValue = value),
      onSuggestionTap: widget.onSuggestionTap,
    );
  }
}
