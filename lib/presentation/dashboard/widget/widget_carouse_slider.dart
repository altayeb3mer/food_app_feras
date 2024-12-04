
part of '../ui/screen_dashboard.dart';

class WidgetCarouseSlider extends StatelessWidget {
   WidgetCarouseSlider({super.key}) ;

  final List<String> images =[
    'https://i0.wp.com/pediaa.com/wp-content/uploads/2021/12/Fast-Food.jpg?fit=799%2C533&ssl=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY75rL3DHXI_fQ4I696qpeFDJvE7zyfukpmKVYqP_kGoBh02NJWbXd5EhXNnk01q_qTDw&usqp=CAU',
    'https://i0.wp.com/pediaa.com/wp-content/uploads/2021/12/Fast-Food.jpg?fit=799%2C533&ssl=1'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.paddingDefault),
      child: CarouselSlider(
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: (){
                  print('-----------${images.indexOf(image)}');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.symmetric(horizontal: Dimens.padding5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 200.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval:const Duration(seconds: 5),
          autoPlayAnimationDuration:const Duration(milliseconds: 800),
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          scrollPhysics:const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            // Do something when the page changes
          },
        ),
      ),
    );
  }
}
