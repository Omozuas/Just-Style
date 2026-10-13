class PopularStylist {
  const PopularStylist({
    required this.name,
    required this.profession,
    required this.imageUrl,
  });

  final String name;
  final String profession;
  final String imageUrl;
}

const graceStylist = PopularStylist(
  name: 'Grace',
  profession: 'Hair Stylist',
  imageUrl: 'https://s3-alpha-sig.figma.com/img/cd0c/e7e0/e01ba57de3f42f95a0e9d476dde27ab9?Expires=1744588800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=n-XDU-pzCZn2M66D9SDb3H2DVSILDBzal38Zt~etD6nCtK0O0qQyO~n96DJGQZK48Yk0HvhZnvbOK9aBtlMK-~Hb2UdeHSaOfXKJf665aRZ1XZjfgoX0ZMQfe5fiZfoWLg5H7H9xGJ9URSXgVTcsC4YTlZhwnsoKa6048VjQm8KpGPSnua67A2ndpFK4p1BUEVDjHNrGkEUy2MJi32CxchcgI49Ld3jyJ9A-tQVRAyKiz8vG5iiaEoo~VuFdMNJvcw6FzYEi0OK-FgT1TSAFhozuVqLEozo61-5QV6maCjDF9WrZP5C6jzrfr8x10oEsuKE2kZyplgEd8lPAi6yRvw__',
);
