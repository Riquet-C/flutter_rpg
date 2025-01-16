import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.star,
                    color: widget.character.points > 0
                        ? Colors.yellow
                        : Colors.grey),
                const SizedBox(width: 20),
                const StyledText("Stat points available"),
                const Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString())
              ],
            ),
          ),
          Table(
            children: widget.character.statsAsList.map((stats) {
              return TableRow(
                  decoration: BoxDecoration(
                    color:
                        AppColors.secondaryColor.withAlpha((0.5 * 255).toInt()),
                  ),
                  children: [
                    // stat title
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stats['title']!),
                      ),
                    ),
                    // stat value
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stats['value']!),
                      ),
                    ),
                    // increase stat button
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.character.increaseStat(stats['title']!);
                            });
                          },
                          icon: Icon(Icons.arrow_upward),
                          color: AppColors.textColor,
                        )),
                    // decrease stat button
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.character.decreaseStat(stats['title']!);
                            });
                          },
                          icon: const Icon(Icons.arrow_downward),
                          color: AppColors.textColor,
                        ))
                  ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
