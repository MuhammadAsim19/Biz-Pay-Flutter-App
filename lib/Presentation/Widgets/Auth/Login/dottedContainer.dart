// import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:path_drawing/path_drawing.dart';
// class DottedContainer extends StatelessWidget {
//   const DottedContainer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//   //    backgroundColor: AppColors.primaryColor,
//       body:Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 35).r,
//           child: SizedBox(
//             height: 500,
//             width:1.sw,
//
//             child:
//             Stack(
//               children: [
//                 CustomPaint(
//                   size: Size(1.sw, (1.sw * 0.5).toDouble()),
//                   painter: PremiumFillWithDot(),
//                   child: Container(
//                       height: 500,
//                       width: 500,
//                       //  height: 500,
//                       child: AppText("Test",style: Styles.circularStdBold(context),)),
//                 ),
//                 CustomPaint(
//                   size: Size(1.sw, (1.sw * 0.5).toDouble()),
//                   painter: PremiumFillWithDotdashes(),
//                   child: Container(height: 650.h),
//                 ),
//
//               ],
//             ),
//             // child: ClipPath(
//             //   clipper: CustomClipperContainer(),
//             //
//             //   child: DottedBorder(
//             //     borderType: BorderType.RRect,
//             //     radius: const Radius.circular(12).r,
//             //     color: AppColors.greyColor,
//             //     strokeWidth: 3,
//             //     stackFit: StackFit.expand,
//             //     dashPattern: const [3, 4],
//             //     child: Center(
//             //       child: AppText("testing",style: Styles.circularStdBold(context),),
//             //     ),
//             //   ),
//             // ),
//           ),
//         ),
//       )
//
//     );
//   }
// }
//
//
// class CustomClipperContainer extends CustomClipper<Path> {
//
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
//
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//
//     final path = Path();
//
//     // Define the starting point
//     path.moveTo(0, size.height + 10);
//
//     // Draw a curve for the left side
//     path.quadraticBezierTo(
//         size.width / 4, size.height + 10, size.width / 4, size.height * 2 / 3);
//
//     // Draw a straight line for the top
//     path.lineTo(3 * size.width / 4, size.height * 2 / 3);
//
//     // Draw a curve for the right side
//     path.quadraticBezierTo(
//         size.width, size.height + 10, size.width, size.height * 1 / 3);
//
//     // Draw a straight line for the bottom
//     path.lineTo(0, size.height * 1 / 3);
//
//     // Close the path
//     path.close();
//     return path;
//
//   }
// }
//
// class PremiumFillPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1.0;
//
//     Path path0 = Path();
//     path0.moveTo(size.width, 0);
//     path0.lineTo(size.width, size.height * 0.4042667);
//     path0.quadraticBezierTo(size.width * 0.9340000, size.height * 0.3966667,
//         size.width * 0.9317333, size.height * 0.5008000);
//     path0.quadraticBezierTo(size.width * 0.9331667, size.height * 0.6042000,
//         size.width, size.height * 0.5994667);
//     path0.lineTo(size.width, size.height);
//     path0.lineTo(0, size.height);
//     path0.lineTo(0, size.height * 0.6000000);
//     path0.quadraticBezierTo(size.width * 0.0695000, size.height * 0.5954667,
//         size.width * 0.0696667, size.height * 0.4930667);
//     path0.quadraticBezierTo(size.width * 0.0693333, size.height * 0.4000667, 0,
//         size.height * 0.3923333);
//     path0.lineTo(0, 0);
//     path0.lineTo(size.width, 0);
//     path0.close();
//
//     canvas.drawPath(path0, paint0);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class PremiumFillWithDot extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width*0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;
//
//
//     Path path_0 = Path();
//     path_0.moveTo(size.width,size.height*0.9966667);
//     path_0.lineTo(size.width*0.9986250,size.height*0.2810167);
//     path_0.quadraticBezierTo(size.width*0.9278000,size.height*0.2781500,size.width*0.9062000,size.height*0.2408667);
//     path_0.quadraticBezierTo(size.width*0.8983500,size.height*0.1921000,size.width*0.9981250,size.height*0.1766000);
//     path_0.lineTo(size.width*0.9975000,size.height*0.0019333);
//     path_0.lineTo(size.width*-0.0025000,size.height*0.0034167);
//     path_0.quadraticBezierTo(size.width*0.0060500,size.height*0.1435333,size.width*0.0035500,size.height*0.1818667);
//     path_0.cubicTo(size.width*0.0746000,size.height*0.1964000,size.width*0.0746500,size.height*0.2003833,size.width*0.0935750,size.height*0.2344167);
//     path_0.quadraticBezierTo(size.width*0.0845750,size.height*0.2694000,size.width*0.0056000,size.height*0.2876000);
//     path_0.lineTo(size.width*0.0063750,size.height*0.9994500);
//     path_0.lineTo(size.width,size.height*0.9966667);
//     path_0.close();
//
//     canvas.drawPath(path_0, paint_fill_0);
//
//
//     // Layer 1
//
//     Paint paint_stroke_0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = size.width*0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;
//
//
//
//     canvas.drawPath(path_0, paint_stroke_0);
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class PremiumFillWithDotdashes extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = Color(0xffCCCCCC)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.sp;
//
//     Path path0 = Path();
//     path0.moveTo(size.width, 0);
//     path0.lineTo(size.width, size.height * 0.4042667);
//     path0.quadraticBezierTo(size.width * 0.9340000, size.height * 0.3966667,
//         size.width * 0.9317333, size.height * 0.5008000);
//     path0.quadraticBezierTo(size.width * 0.9331667, size.height * 0.6042000,
//         size.width, size.height * 0.5994667);
//     path0.lineTo(size.width, size.height);
//     path0.lineTo(0, size.height);
//     path0.lineTo(0, size.height * 0.6000000);
//     path0.quadraticBezierTo(size.width * 0.0695000, size.height * 0.5954667,
//         size.width * 0.0696667, size.height * 0.4930667);
//     path0.quadraticBezierTo(size.width * 0.0693333, size.height * 0.4000667, 0,
//         size.height * 0.3923333);
//     path0.lineTo(0, 0);
//     path0.lineTo(size.width, 0);
//     path0.close();
//
//     canvas.drawPath(
//         dashPath(
//           path0,
//           dashArray: CircularIntervalList<double>(<double>[15.0, 6]),
//         ),
//         paint0);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:buysellbiz/Presentation/Widgets/Dashboard/Profile/Components/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '',leading: true,),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column( children: [
                90.y,
                Image.asset(
                  Assets.splashImage,
                  height: 50,

                ),
                Text(
                  "Booking #1253",
                  style: Styles.circularStdRegular(
                    context,
                    fontSize: 16,
                  ),
                ),
                5.y,
                Text(
                  "Service Booked",
                  style: Styles.circularStdMedium(
                    context,
                    fontSize: 20,
                  ),
                ),
                5.y,
                Text(
                  "You’ve successfully booked wedding photography service!",
                  style: Styles.circularStdRegular(
                    context,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                18.y,
                //DottedContainer(color: Colors.amber, strokeWidth: 2, child: Container(height: 500,width: 1.sw,)),
                // Container(
                //   width :800,
                //   height: 500,
                //   child: Stack(
                //      fit: StackFit.expand,
                //     children: [
                //       Positioned.fill(
                //         child: CustomPaint(
                //           //size: Size(1.sw, 500),
                //           painter: RPSCustomPainter(),
                //
                //         ),
                //       ),
                //       Container(width: double.infinity,height: 400,),
                //     ],
                //   ),
                // ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [10, 10],
                  color: Colors.grey,
                  strokeWidth: 2,
                  child: Container(
                    height: 0.6.sh,
                    width: 0.9.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.blackColor.withOpacity(0.05)),
                    child: Column(
                      children: [
                        21.y,
                        Row(
                          children: [
                            Text(
                              "Wedding photography",
                              style: Styles.circularStdRegular(
                                context,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "12 Nov,2023",
                              style: Styles.circularStdRegular(
                                context,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        5.y,
                        Text(
                          "34 Russell Rd Shillingford St George, UK",
                          style: Styles.circularStdRegular(
                            context,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size oSize) {
    // Layer 1

    final Size size=oSize;

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 179, 17, 17)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    Path path_0 = Path();

    
    path_0.moveTo(size.width * 0.2531000, size.height * 0.1008400);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.5980000);
    path_0.lineTo(size.width * 0.2762500, size.height * 0.5980000);
    path_0.lineTo(size.width * 0.3025000, size.height * 0.6000000);
    path_0.lineTo(size.width * 0.3212500, size.height * 0.6220000);
    path_0.lineTo(size.width * 0.3250000, size.height * 0.6580000);
    path_0.lineTo(size.width * 0.3187500, size.height * 0.6860000);
    path_0.lineTo(size.width * 0.3029125, size.height * 0.7000000);
    path_0.lineTo(size.width * 0.2837500, size.height * 0.7020000);
    path_0.lineTo(size.width * 0.2662500, size.height * 0.7020000);
    path_0.lineTo(size.width * 0.2500625, size.height * 0.7014600);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.7460000);
    path_0.lineTo(size.width * 0.2487500, size.height * 0.8000000);
    path_0.lineTo(size.width * 0.2487500, size.height * 0.8980000);
    path_0.lineTo(size.width * 0.6287500, size.height * 0.8980000);
    path_0.lineTo(size.width * 0.6275000, size.height * 0.8020000);
    path_0.lineTo(size.width * 0.6275000, size.height * 0.7300000);
    path_0.lineTo(size.width * 0.6258250, size.height * 0.7013400);
    path_0.lineTo(size.width * 0.6062500, size.height * 0.7040000);
    path_0.lineTo(size.width * 0.5887500, size.height * 0.7040000);
    path_0.lineTo(size.width * 0.5700000, size.height * 0.7020000);
    path_0.lineTo(size.width * 0.5600000, size.height * 0.6960000);
    path_0.lineTo(size.width * 0.5508375, size.height * 0.6780000);
    path_0.lineTo(size.width * 0.5492000, size.height * 0.6460200);
    path_0.lineTo(size.width * 0.5575000, size.height * 0.6159800);
    path_0.lineTo(size.width * 0.5750000, size.height * 0.6060000);
    path_0.lineTo(size.width * 0.6004250, size.height * 0.6046800);
    path_0.lineTo(size.width * 0.6250000, size.height * 0.6040000);
    path_0.lineTo(size.width * 0.6237500, size.height * 0.5460000);
    path_0.lineTo(size.width * 0.6237500, size.height * 0.0980000);
    path_0.lineTo(size.width * 0.3866375, size.height * 0.0993400);

    canvas.drawPath(path_0, paintFill0);
    // Layer 1
    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    canvas.drawPath(path_0, paintStroke0);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
class DottedContainer extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final Widget child;

  DottedContainer({super.key,
    required this.color,
    required this.strokeWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(color: color, strokeWidth: strokeWidth),
      child: child,
    );
  }
}




class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double currentX = 0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}