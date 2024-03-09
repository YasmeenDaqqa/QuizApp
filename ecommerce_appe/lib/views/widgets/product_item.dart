import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_appe/models/product_item_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_appe/utils/app_colors.dart';
import 'package:ecommerce_appe/models/fav_Products_model.dart';
import 'package:ecommerce_appe/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce_appe/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce_appe/views/widgets/Favorite_Button.dart';
import 'package:ecommerce_appe/services/favorit_services.dart';
import 'package:ecommerce_appe/view_models/product_cubit/product_cubit.dart';
import 'package:ecommerce_appe/services/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductItem extends StatefulWidget {
  final ProductItemModel productItem;
  final VoidCallback onFavoritePressed;

  const ProductItem({
    Key? key,
    required this.productItem,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 130,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.grey2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: widget.productItem.imgUrl,
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
              top: 8.0,
              right: 8.0,
              child: InkWell(
                onTap: widget.onFavoritePressed,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      favProducts.contains(widget.productItem)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          widget.productItem.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          widget.productItem.category,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.grey,
              ),
        ),
        Text(
          '\$${widget.productItem.price}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}