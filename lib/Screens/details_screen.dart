import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/product_model.dart';


class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});


  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.product.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubik(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              widget.product.category,
              style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff8383)),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
       actions: [SizedBox(width: 15,)],
      ),
      body: Column(
        children: [SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color:Color(0xffff8383),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Positioned(
                    right: 70,
                    bottom: -10,
                    child: Opacity(
                      opacity: .5,
                      child: Image.network(
                        widget.product.thumbnail,
                        width: 200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 80,
                    bottom: -20,
                    child: Image.network(widget.product.thumbnail, width: 200),
                  ),
                ],
              ),
            ),
          ),SizedBox(height: 30,),
          Text(
            widget.product.title,
            style: GoogleFonts.rubik(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.product.description,
              style: GoogleFonts.rubik(fontSize: 18,fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price: ",
                style: GoogleFonts.rubik(fontSize: 24),
              ),
              Text(
                "${widget.product.price} \$",
                style: GoogleFonts.rubik(
                  fontSize: 24,
                  color: Color(0xffff8383),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
