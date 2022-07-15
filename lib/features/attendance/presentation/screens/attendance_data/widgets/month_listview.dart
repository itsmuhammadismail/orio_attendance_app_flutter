import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:orio_attendance_app_flutter/resources/colors.dart';
import 'package:orio_attendance_app_flutter/resources/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MonthListView extends HookWidget {
  const MonthListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalMonthThisYear = useState(1);
    final selectedMonth =
        useState(kCompleteMonthNames[DateTime.now().month - 1]);
    late ItemScrollController controller = ItemScrollController();

    void changeSelectedMonth(int monthNo, String month) async {
      selectedMonth.value = month;
    }

    void changeController() {
      for (int i = 0; i < kCompleteMonthNames.length; i++) {
        if (kCompleteMonthNames[i] == selectedMonth.value) {
          controller.scrollTo(
              index: i, duration: const Duration(milliseconds: 1));
        }
      }
    }

    useEffect(() {
      for (int i = 0; i < kCompleteMonthNames.length; i++) {
        if (kCompleteMonthNames[i] == selectedMonth.value) {
          totalMonthThisYear.value = i + 1;
        }
      }
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        changeController();
      });
      return null;
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ScrollablePositionedList.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemScrollController: controller,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: kCompleteMonthNames[index] == selectedMonth.value
                ? Container(
                    decoration: BoxDecoration(
                      gradient: kGradient,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: 130,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          primary: Colors.transparent,
                        ),
                        child: Text(kCompleteMonthNames[index])),
                  )
                : TextButton(
                    onPressed: () => changeSelectedMonth(
                        index + 1, kCompleteMonthNames[index]),
                    style: TextButton.styleFrom(
                      primary: Colors.grey,
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    child: Text(kCompleteMonthNames[index]),
                  ),
          ),
          itemCount: totalMonthThisYear.value,
        ),
      ),
    );
  }
}
