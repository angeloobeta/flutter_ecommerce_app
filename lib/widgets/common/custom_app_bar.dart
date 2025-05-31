import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.blue, style: BorderStyle.solid),
            ),
            child: const Text(
              'Full Logo',
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                'DELIVERY ADDRESS',
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              ),
              const Text(
                'Umuezike Road, Oyo State',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.notifications_outlined, color: Colors.black),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
