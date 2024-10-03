import 'package:flutter/material.dart';

class AllBooksText extends StatelessWidget {
  const AllBooksText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(child: Text("All Books")),
    );
  }
}
