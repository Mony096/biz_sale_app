import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final List<CategoryData> categories = [
    CategoryData(),
    CategoryData(),
    CategoryData(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 183, 185, 193),
            ),
            margin: EdgeInsets.only(left: 3, right: 3, top: 17, bottom: 17),
            width: double.infinity,
            padding: const EdgeInsets.all(13),
            child: const Text(
              'Survey',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CategoryCard(
                  title: 'Category 1',
                  data: categories[0],
                  onChanged: () => setState(() {}),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CategoryCard(
                  title: 'Category 2',
                  data: categories[1],
                  onChanged: () => setState(() {}),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CategoryCard(
                  title: 'Category 3',
                  data: categories[2],
                  onChanged: () => setState(() {}),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryData {
  bool displayCounter = true;
  bool aFrameOut = true;
  double coolerPurity = 60;
  double coldInventory = 50;
}

class CategoryCard extends StatelessWidget {
  final String title;
  final CategoryData data;
  final VoidCallback onChanged;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.data,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Is there a Display Counter present',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          ToggleButtons(
            value: data.displayCounter,
            onChanged: (val) {
              data.displayCounter = val;
              onChanged();
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Is there a A-Frame out site?',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          ToggleButtons(
            value: data.aFrameOut,
            onChanged: (val) {
              data.aFrameOut = val;
              onChanged();
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Cooler purity level:',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          SliderWithLabel(
            value: data.coolerPurity,
            onChanged: (val) {
              data.coolerPurity = val;
              onChanged();
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Share of cold visible inventory:',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          SliderWithLabel(
            value: data.coldInventory,
            onChanged: (val) {
              data.coldInventory = val;
              onChanged();
            },
          ),
        ],
      ),
    );
  }
}

class ToggleButtons extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleButtons({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: value ? const Color(0xFF001144) : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Yes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: value ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: !value ? const Color(0xFF001144) : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'No',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: !value ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderWithLabel extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const SliderWithLabel({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF001144),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${value.round()}%',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 8,
            activeTrackColor: const Color(0xFF001144),
            inactiveTrackColor: Colors.grey.shade400,
            thumbColor: Colors.white,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 12,
              elevation: 2,
            ),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 100,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
