import 'package:flutter/material.dart';

void main() => runApp(GroceryApp());

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/category': (context) => const CategoryScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<String> categories = [
    "Fruits",
    "Vegetables",
    "Meats",
    "Bakery"
  ];

  final List<Map<String, String>> popularItems = [
    {"name": "Strawberry", "image": "assets/pexels-asphotograpy-235294.jpg"},
    {"name": "Avocado", "image": "assets/avocado.png"},
    {"name": "Donuts", "image": "assets/donuts.png"},
    {"name": "Chicken", "image": "assets/chicken.png"},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _shopNow() {
    // Add your logic for Shop now button
    print('Shop now button clicked!');
  }

  void _onSearch(String query) {
    // Handle search logic here
    print('Search for: $query');
  }

  // Navigate to CategoryScreen when a category is clicked
  void _navigateToCategory(String category) {
    Navigator.pushNamed(context, '/category', arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(backgroundImage: AssetImage("assets/OIP (1).jpg")),
                  Icon(Icons.notifications_none_outlined),
                ],
              ),
              const SizedBox(height: 25),
              const Text("Hey Bobby🫡", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 7),
              Text("What fresh groceries you want", style: TextStyle(color: Colors.grey[600])),
              const SizedBox(height: 25),
              TextField(
                onChanged: _onSearch,
                decoration: InputDecoration(
                  hintText: "Search fresh groceries...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 25),
              // New Member 40% Off Container with Image
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Background Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/pexels-pixabay-264636.jpg",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Overlay content (Text and Button)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5), // Semi-transparent background for text and button
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "New Member\nGet 40%",
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: _shopNow,
                            child: const Text("Shop now"),
                            style: ElevatedButton.styleFrom(
                              iconColor: Colors.orangeAccent, // Button color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => _navigateToCategory(categories[index]),
                      child: Column(
                        children: [
                          CircleAvatar(radius: 30, backgroundColor: Colors.orange[200]),
                          const SizedBox(height: 6),
                          Text(categories[index])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("Popular", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: popularItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(popularItems[index]['image']!),
                            ),
                            const SizedBox(height: 10),
                            Text(popularItems[index]['name']!),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the category argument passed from the HomeScreen
    final category = ModalRoute.of(context)?.settings.arguments as String?;

    // Define categories to display
    final List<Map<String, String>> categories = [
      {'title': 'Fruits', 'image': 'assets/pexels-asphotograpy-867349.jpg'},
      {'title': 'Vegetables', 'image': 'assets/pexels-fotios-photos-1395958.jpg'},
      {'title': 'Snacks', 'image': 'assets/pexels-iriser-1379636.jpg'},
      {'title': 'Meats', 'image': 'assets/pexels-julieaagaard-2294477.jpg'},
      {'title': 'Cheese', 'image': 'assets/pexels-minan1398-1093837.jpg'},
      {'title': 'Drinks', 'image': 'assets/pexels-pixabay-46174.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category ?? 'Category', style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search from groceries...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        categories[index]['image']!,
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index]['title']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
