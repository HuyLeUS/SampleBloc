import 'package:flutter/material.dart';
import 'package:sample_bloc/presentation/widgets/shimmer_circle.dart';
import 'package:sample_bloc/presentation/widgets/shimmer_rectangle.dart';

class MemeLoading extends StatelessWidget {
  const MemeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShimmerCircle(50),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: const [
                        ShimmerRectangle(size: Size(180, 20)),
                        SizedBox(
                          height: 8,
                        ),
                        ShimmerRectangle(
                          size: Size(180, 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
