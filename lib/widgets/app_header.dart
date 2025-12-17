import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  final String iconAsset;

  const AppHeader({
    super.key,
    required this.iconAsset,
  });

  @override
  _AppHeaderState createState() => _AppHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppHeaderState extends State<AppHeader> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _selectedLanguage = 'Français'; // Langue par défaut

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          SvgPicture.asset(
            widget.iconAsset,
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 12),
          if (_isSearching) Expanded(child: _buildSearchField()),
        ],
      ),
      actions: _isSearching ? _buildSearchActions() : _buildDefaultActions(),
    );
  }

  Widget _buildSearchField() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 20), // laisse de la place pour les icônes
            hintText: 'Rechercher...',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
          ),
          onChanged: (value) => setState(() {}),
        ),

        // Icônes positionnées à droite à l'intérieur du champ
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_searchController.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear, color: Colors.black),
                onPressed: () {
                  _searchController.clear();
                  setState(() {});
                },
              ),
            IconButton(
              icon: const Icon(Icons.filter_alt, color: Colors.orange),
              onPressed: () {
                debugPrint("Filtre cliqué");
              },
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildSearchActions() {
    return [
      IconButton(
        icon: const Icon(Icons.close, color: Colors.black),
        onPressed: () {
          setState(() {
            _isSearching = false;
            _searchController.clear();
          });
        },
      ),
    ];
  }

  List<Widget> _buildDefaultActions() {
    return [
      IconButton(
        icon: const Icon(Icons.search, color: Colors.black, size: 32),
        onPressed: () {
          setState(() {
            _isSearching = true;
          });
        },
      ),
      IconButton(
        icon: const Icon(Icons.menu, color: Colors.black, size: 32),
        onPressed: () {
          debugPrint("Burger menu cliqué");
          _showPopupMenu(context);
        },
      ),
    ];
  }

  void _showPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: kToolbarHeight + 8,
              right: 8,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      _menuSection("Toutes les catégories", hasArrow: true),
                      _menuSection("Nos offres", hasArrow: true),
                      _menuSection("Shop"),
                      _menuSection("Services +"),
                      _menuSection("Club Membres"),
                      _menuSection("Help Center"),

                      // Ligne avec drapeau rond à gauche et langue à droite
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Drapeau dans un cercle à gauche
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue.shade200,
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  _getFlagEmoji(_selectedLanguage),
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),

                            // Langue à droite avec icône dropdown
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _selectedLanguage,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    PopupMenuButton<String>(
                                      icon: const Icon(
                                          Icons.arrow_drop_down_outlined,
                                          size: 25),
                                      onSelected: (String newValue) {
                                        setState(() {
                                          _selectedLanguage = newValue;
                                        });
                                        Navigator.of(context).pop();
                                        _showPopupMenu(context);
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          _buildLanguageMenuItem(
                                              'Français', '🇫🇷'),
                                          _buildLanguageMenuItem(
                                              'English', '🇺🇸'),
                                          _buildLanguageMenuItem(
                                              'Español', '🇪🇸'),
                                          _buildLanguageMenuItem(
                                              'Deutsch', '🇩🇪'),
                                          _buildLanguageMenuItem(
                                              'Italiano', '🇮🇹'),
                                        ];
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Nous contacter",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Center(
                          child: Text(
                            "Mon Compte",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _menuSection(String title, {bool hasArrow = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: hasArrow
          ? const Icon(Icons.arrow_drop_down_outlined, size: 25)
          : null,
      onTap: () {
        debugPrint("$title cliqué");
      },
    );
  }

  String _getFlagEmoji(String language) {
    switch (language) {
      case 'Français':
        return '🇫🇷';
      case 'English':
        return '🇺🇸';
      case 'Español':
        return '🇪🇸';
      case 'Deutsch':
        return '🇩🇪';
      case 'Italiano':
        return '🇮🇹';
      default:
        return '🇫🇷';
    }
  }

  PopupMenuItem<String> _buildLanguageMenuItem(String language, String flag) {
    return PopupMenuItem<String>(
      value: language,
      child: Row(
        children: [
          Text(flag, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Text(language,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
