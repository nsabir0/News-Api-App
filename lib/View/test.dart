import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:get/get.dart';

// class NewHome extends StatelessWidget {
//   const NewHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[200],
//       body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 showPopover(
//                   context: context,
//                   bodyBuilder: (context) => const MenuItems(),
//                   onPop: () => printInfo(info: 'Popover was popped!'),
//                   direction: PopoverDirection.bottom,
//                   width: 150,
//                   height: 250,
//                   arrowHeight: 15,
//                   arrowWidth: 30,
//                 );
//               },
//               child: Icon(
//                 Icons.arrow_drop_down_circle,
//                 size: 50.w,
//               ))),
//     );
//   }
// }

// class MenuItems extends StatelessWidget {
//   const MenuItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 50.w,
//           color: Colors.deepPurple[400],
//         ),
//         Container(
//           height: 50.w,
//           color: Colors.deepPurple[300],
//         ),
//         Container(
//           height: 50.w,
//           color: Colors.deepPurple[200],
//         )
//       ],
//     );
//   }
// }

class PopoverExample extends StatelessWidget {
  const PopoverExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Popover Example'), actions: const [PopMenu()]),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: PopMenu(),
        ),
      ),
    );
  }
}

class PopMenu extends StatelessWidget {
  const PopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: const Center(child: Text('Click Me')),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => menuitems(),
            direction: PopoverDirection.bottom,
            width: 200,
            height: 200,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }

  menuitems() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        InkWell(
          onTap: () {
            Get.snackbar('Success', 'Clicked');
          },
          child: Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry A')),
          ),
        ),
        const Divider(),
        Container(
          height: 50,
          color: Colors.amber[200],
          child: const Center(child: Text('Entry B')),
        ),
        const Divider(),
        Container(
          height: 50,
          color: Colors.amber[300],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
