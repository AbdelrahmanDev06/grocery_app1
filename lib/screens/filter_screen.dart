import 'package:flutter/material.dart';

class FilterOption {
  final String label;
  bool selected;

  FilterOption({required this.label, this.selected = false});
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final List<FilterOption> _categories = [
    FilterOption(label: 'Eggs', selected: true),
    FilterOption(label: 'Noodles & Pasta'),
    FilterOption(label: 'Chips & Crisps'),
    FilterOption(label: 'Fast Food'),
  ];

  final List<FilterOption> _brands = [
    FilterOption(label: 'Individual Collection'),
    FilterOption(label: 'Cocola', selected: true),
    FilterOption(label: 'Ifad'),
    FilterOption(label: 'Kazi Farmas'),
  ];

  static const Color _green = Color(0xFF3EAE5D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ..._categories.map(
                      (option) => _FilterCheckboxRow(
                        option: option,
                        activeColor: _green,
                        onChanged: (value) {
                          setState(() => option.selected = value);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Brand',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ..._brands.map(
                      (option) => _FilterCheckboxRow(
                        option: option,
                        activeColor: _green,
                        onChanged: (value) {
                          setState(() => option.selected = value);
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    final selectedCategories = _categories
                        .where((c) => c.selected)
                        .map((c) => c.label)
                        .toList();
                    final selectedBrands = _brands
                        .where((b) => b.selected)
                        .map((b) => b.label)
                        .toList();
                    Navigator.of(context).pop({
                      'categories': selectedCategories,
                      'brands': selectedBrands,
                    });
                  },
                  child: const Text(
                    'Apply Filter',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterCheckboxRow extends StatelessWidget {
  final FilterOption option;
  final Color activeColor;
  final ValueChanged<bool> onChanged;

  const _FilterCheckboxRow({
    required this.option,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!option.selected),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: option.selected ? activeColor : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: option.selected
                      ? activeColor
                      : const Color(0xFFCCCCCC),
                  width: 1.5,
                ),
              ),
              child: option.selected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              option.label,
              style: TextStyle(
                fontSize: 15,
                color: option.selected ? activeColor : Colors.black87,
                fontWeight: option.selected
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
