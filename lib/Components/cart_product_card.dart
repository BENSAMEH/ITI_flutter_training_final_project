import 'package:flutter/material.dart';

class ProductCartCard extends StatelessWidget {


  const ProductCartCard({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              "",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          // تفاصيل المنتج
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "leo",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$${200.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // التحكم في الكمية
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: (){},
                      ),
                      Text(
                        "1",
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // زرار الحذف
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
