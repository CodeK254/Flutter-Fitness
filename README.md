# Flutter Fitness App

## Packages Used
---
- flutter_animate: ^4.1.1+1
- photo_view: ^0.14.0
- carousel_slider: ^4.2.1
- flutter_native_splash: 
- flutter_launcher_icons: 

## Key Widgets
---
- GetMatelialApp()
- CarouselSlider()
- PhotoView()
- Obx(() => )
- BottomNavigationBarTheme()
- SingleChildScrollView()

## GetX Classes & Functions User
---
- .obs
- GetxController
- Get.lazyPut<Controller>(() => Controller)
- Get.find<Controller>()
- Get.put(Controller())
- BindingsBuilder()
  
## Sample Code
---
```
class WorkoutPlan extends StatelessWidget {
  final String imageUrl;
  final String workout;
  final String repsCount;
  final String setsCount;
  const WorkoutPlan({super.key, required this.imageUrl, required this.workout, required this.repsCount, required this.setsCount});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: screenSize.height * 0.4,
            width: screenSize.width,
            color: Colors.transparent,
            child: Image(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomText(
                      text: "Workout Title: ",
                      fontSize: 15,
                      color: greyCustom,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: workout,
                      fontSize: 18,
                      color: blueCustom,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomText(
                      text: "Number of reps: ",
                      color: greyCustom,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: repsCount,
                      color: Colors.brown[800],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CustomText(
                      text: "Number of sets: ",
                      color: greyCustom,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: setsCount,
                      color: Colors.brown[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: screenSize.height * 0.02,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
```