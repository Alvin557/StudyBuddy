import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/colors.dart';

class AddStudyPlans extends StatefulWidget {
  const AddStudyPlans({super.key});

  @override
  State<AddStudyPlans> createState() => _AddStudyPlansState();
}

class _AddStudyPlansState extends State<AddStudyPlans> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool switchState = false;
  final List<Map<String, dynamic>> days = [
    {'name': "S", 'isSelected': false},
    {'name': "M", 'isSelected': false},
    {'name': "T", 'isSelected': false},
    {'name': "W", 'isSelected': false},
    {'name': "T", 'isSelected': false},
    {'name': "F", 'isSelected': false},
    {'name': "S", 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Study Plan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Title "),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter title";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter title ",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff2EC4B6)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffB8B8D2)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffB8B8D2)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffB8B8D2)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "Start Time: "),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: StudyBuddy.lightPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Row(
                          children: [
                            Text(
                              "9:00 am",
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                            Icon(Icons.arrow_drop_down_outlined)
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "End Time: "),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: StudyBuddy.lightPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Row(
                          children: [
                            Text(
                              "9:00 am",
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                            Icon(Icons.arrow_drop_down_outlined)
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "Repeat"),
                    SizedBox(
                      child: Switch(
                          trackOutlineWidth: MaterialStateProperty.all(0),
                          activeColor: StudyBuddy.primaryColor,
                          inactiveTrackColor: StudyBuddy.primaryColor,
                          inactiveThumbColor: StudyBuddy.whiteColor,
                          value: switchState,
                          onChanged: (value) {
                            setState(() {
                              switchState = !switchState;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const CustomText(text: "Custom: "),
                Row(
                  children: List.generate(
                      days.length,
                      (index) => Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, right: 10, bottom: 20),
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () {
                                  setState(() {
                                    days[index]['isSelected'] =
                                        !days[index]['isSelected'];
                                  });
                                },
                                child: Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: StudyBuddy.primaryColor),
                                      color: days[index]['isSelected']
                                          ? StudyBuddy.primaryColor
                                          : StudyBuddy.whiteColor),
                                  child: Center(
                                      child: Text(
                                    days[index]['name'],
                                    style: TextStyle(
                                        color: days[index]['isSelected']
                                            ? StudyBuddy.whiteColor
                                            : StudyBuddy.primaryColor,
                                        fontSize: 16),
                                  )),
                                ),
                              ),
                            ),
                          )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(text: "Description"),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Enter description ",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff2EC4B6)),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffB8B8D2)),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffB8B8D2)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffB8B8D2)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: StudyBuddy.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Add to Plan",
                        style: TextStyle(
                            fontSize: 16, color: StudyBuddy.whiteColor),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text ",
      style: TextStyle(fontSize: 14.w, fontWeight: FontWeight.bold),
    );
  }
}
