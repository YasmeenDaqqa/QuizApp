import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_appe/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_appe/models/product_item_modell .dart';

class ProductItemC extends StatelessWidget {
  final ProductItemModell productItem;
  const ProductItemC({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CachedNetworkImage(
                  imageUrl: productItem.imgUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              right: 40.0,
              child: Column(
                children: [
                   Text(
          productItem.category,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                
              ),),
        Text(
          '\$${productItem.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),]
        ),
       
            ),
          ],
        ),
        const SizedBox(height: 4.0),
       
       
      ],
    );
  }
}