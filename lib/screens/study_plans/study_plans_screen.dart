import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_buddy/const/colors.dart';

class StudyPlansScreen extends StatelessWidget {
  StudyPlansScreen({super.key});

  final List<Map<String, dynamic>> studyPlans = [
    {
      "title": "Quizlets",
      "time": "9:00 to 12:00",
      "progress": 75,
      "isFavorite": true
    },
    {
      "title": "Science",
      "time": "14:00 to 16:00",
      "progress": 50,
      "isFavorite": false
    },
    {
      "title": "Essay",
      "time": "12:00 to 13:00",
      "progress": 10,
      "isFavorite": true
    },
    {
      "title": "Projects",
      "time": "20:00 to 22:00",
      "progress": 85,
      "isFavorite": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Study",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000))),
                TextSpan(
                    text: "Plans",
                    style: TextStyle(fontSize: 24, color: Color(0xff000000)))
              ])),
            ),
          ),
          excludeHeaderSemantics: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Container(
                  height: 36,
                  width: 36,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffFFA40B)),
                  child: const Icon(
                    Icons.search,
                    size: 20,
                    color: Color(0xffffffff),
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(studyPlans.length, (index) {
              final data = studyPlans[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 13.h),
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff919191),
                        blurRadius: 10,
                        spreadRadius: -6,
                        offset: Offset(3, 4),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 108.h,
                      width: 108.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/study.jpg')),
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(data['title']),
                        Text(data['time']),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "${data['progress']}%",
                              style: const TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: " complete",
                              style: TextStyle(
                                color: Color(0xff919191),
                              )),
                        ])),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 6,
                          width: 120.w,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: LinearProgressIndicator(
                              value: data['progress'] / 100,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xffFFBF69)),
                              backgroundColor: const Color(0xffCBF3F0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: data["isFavorite"]
                              ? StudyBuddy.lightPrimary
                              : const Color(0xffffffff),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff919191),
                              blurRadius: 10,
                              spreadRadius: -6,
                              offset: Offset(3, 4),
                            ),
                          ]),
                      child: const Icon(
                        Icons.favorite_border,
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
