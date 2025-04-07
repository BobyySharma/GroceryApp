import 'package:flutter/material.dart';
import 'package:untitled1/signup.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> data = [
    {
      "image": "assets/pexels-minan1398-1093837.jpg",
      "title": "Farm-fresh, straight to your door!",
      "desc": "You Want Fresh Veggies, why waiting till now, Jaldi Grofast Aao!"
    },
    {
      "image": "assets/pexels-pixabay-219794.jpg",
      "title": "Shop your daily necessary!",
      "desc": "Want fresh veggies? Why wait? Jaldi Grofast Aao, delivery ho ab aapke saath!"
    },
    {
      "image": "assets/pexels-wendywei-1656666.jpg",
      "title": "Fast Shipment to your home!",
      "desc": "Fresh veggies ka craving? Ab wait mat karo, Grofast se jaldi ghar tak le aao!"
    }
  ];

  // Create a PageController to control page transitions
  final PageController _pageController = PageController();
  int _currentIndex = 0; // To track the current page index

  @override
  void initState() {
    super.initState();
    // Add a listener to update the index on page change
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // PageView for the sliding images
          Expanded(
            child: PageView.builder(
              controller: _pageController, // Set the PageController
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      data[index]["image"]!,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover, // Ensure image covers the entire width
                    ),
                    SizedBox(height: 30),
                    Text(
                      data[index]["title"]!,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        data[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),

          // Page indicator (Sliding dots) - moved above the Next button
          Padding(
            padding: const EdgeInsets.only(bottom: 20), // Space between dots and next button
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentIndex == index ? 24 : 8,  // Larger dot for the current index
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),

          // Next button
          Padding(
            padding: const EdgeInsets.only(bottom: 30), // Space from the dots
            child: ElevatedButton(
              onPressed: () {
                if (_currentIndex == data.length - 1) {
                  // If we're on the last page, navigate to MyRegister
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                } else {
                  // If not on the last page, go to the next page
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease
                  );
                }
              },
              child: Text(_currentIndex == data.length - 1 ? "Start" : "Next"),
            ),
          ),
        ],
      ),
    );
  }
}
