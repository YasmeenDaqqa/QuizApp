
import 'package:flutter/material.dart';
import 'package:ecommerce_appe/utils/app_colors.dart';
class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int counter;
  const CounterWidget({
    super.key,
    required this.cubit,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () async => await cubit.decrementCounter(),
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () async => await cubit.incrementCounter(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}