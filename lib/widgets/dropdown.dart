import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:sneakersplug/models/menu_items.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => const MenuItems(),
        width: 250,
        height: 500,
        backgroundColor: Colors.grey,
        direction: PopoverDirection.bottom,

      ),
      child: const Icon(Icons.more_vert),
    );
    // return PopupMenuButton<String>(
    //   icon: Icon(Icons.more_vert, color: Colors.black),
    //   onSelected: (String result) {
    //     // Action when a menu item is selected
    //     print(result);
    //   },
    //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    //     const PopupMenuItem<String>(
    //       value: 'Option 1',
    //       child: Text('Option 1'),
    //     ),
    //     const PopupMenuItem<String>(
    //       value: 'Option 2',
    //       child: Text('Option 2'),
    //     ),
    //     const PopupMenuItem<String>(
    //       value: 'Option 3',
    //       child: Text('Option 3'),
    //     ),
    //   ],
    // );
  }
}
