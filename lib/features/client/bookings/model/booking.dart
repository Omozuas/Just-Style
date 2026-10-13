class Booking {
  const Booking({
    required this.styleName,
    required this.date,
    required this.time,
    required this.amount,
    required this.rating,
    required this.imageUrl,
  });

  final String styleName;
  final String date;
  final String time;
  final String amount;
  final String rating;
  final String imageUrl;
}

const sampleBooking = Booking(
  styleName: 'Top Knot Braids',
  date: '8/11/2023',
  time: '9:14am',
  amount: r'$  2000',
  rating: '4.9',
  imageUrl: 'https://s3-alpha-sig.figma.com/img/f0c8/cd41/8a167708860c2f691b4707548fef93a1?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=Ep69CI6j8SZVOILrvwtaWQarqp9LP1poRq1seYaKjJOze~BA0LEEddvjmwUXba1yTIhrh0wL6xzmM0V3N7tPuU~hzUmLdUj3YtqbAk2ACmXbZOACVyILFQ4oUavO-Cl8pWe4gVU6NaEXyj8rWuN9yvN0ve6D6nEpHLWu4kZiyiWcDy-FKTsroUp1CWTBavzp0RF8GYwEeSsPw9u47E6bCdWXY2~1KmyoI6TcflZKwBrwpVZLg7lYF6M8wbDgRlBB2fx3eNbFLwKJmXGvu4ZGnm8FKPsak8DazX500U0RQPARb0dUN1JoLfpjVvht7lcd6TTf93pmewzhPUApkei6LA__',
);

List<Booking> sampleBookings({int count = 17}) {
  return List<Booking>.filled(count, sampleBooking);
}
