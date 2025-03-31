import 'package:flutter/material.dart';
import 'package:juststyle/app/views/client/home_client_screen/widgets/popular_braids_card.dart';

class PopularListBraids extends StatelessWidget {
  const PopularListBraids({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        crossAxisSpacing: 30, // Horizontal space between items
        mainAxisSpacing: 12, // Vertical space between items
        childAspectRatio: 0.85, // Adjust the aspect ratio as needed
      ),
      itemCount: 12,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {},
          child: PopularBraidsCard(
            image:
                "https://s3-alpha-sig.figma.com/img/f0c8/cd41/8a167708860c2f691b4707548fef93a1?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Ep69CI6j8SZVOILrvwtaWQarqp9LP1poRq1seYaKjJOze~BA0LEEddvjmwUXba1yTIhrh0wL6xzmM0V3N7tPuU~hzUmLdUj3YtqbAk2ACmXbZOACVyILFQ4oUavO-Cl8pWe4gVU6NaEXyj8rWuN9yvN0ve6D6nEpHLWu4kZiyiWcDy-FKTsroUp1CWTBavzp0RF8GYwEeSsPw9u47E6bCdWXY2~1KmyoI6TcflZKwBrwpVZLg7lYF6M8wbDgRlBB2fx3eNbFLwKJmXGvu4ZGnm8FKPsak8DazX500U0RQPARb0dUN1JoLfpjVvht7lcd6TTf93pmewzhPUApkei6LA__",
            name: "Top Knot Braids",
          ),
        );
      },
    );
  }
}
