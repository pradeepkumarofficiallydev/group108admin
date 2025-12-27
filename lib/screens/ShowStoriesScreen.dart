import 'package:flutter/material.dart';

import '../models/StoriesResponse.dart';

// class ShowStoriesScreen extends StatelessWidget {
//   final List<Map<String, String>> stories = [
//     {'name': 'John', 'image': 'https://via.placeholder.com/150'},
//     {'name': 'Alice', 'image': 'https://via.placeholder.com/150'},
//     {'name': 'Bob', 'image': 'https://via.placeholder.com/150'},
//     {'name': 'Emma', 'image': 'https://via.placeholder.com/150'},
//
//
//
//
//
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stories'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: stories.length,
//                 itemBuilder: (context, index) {
//                   final story = stories[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => FullScreenStoryView(
//                             stories: stories,
//                             initialIndex: index,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.symmetric(horizontal: 8),
//                           width: 70,
//                           height: 70,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image: NetworkImage(story['image']!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(story['name']!),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add more UI for the rest of the screen if needed.
//           ],
//         ),
//       ),
//     );
//   }
// }

class FullScreenStoryView extends StatefulWidget {
  final StoriesResponse stories;
  final int initialIndex;

  const FullScreenStoryView({
    Key? key,
    required this.stories,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _FullScreenStoryViewState createState() => _FullScreenStoryViewState();
}

class _FullScreenStoryViewState extends State<FullScreenStoryView> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.stories.data?.length??0,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final story = widget.stories.data![widget.initialIndex];
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Image.network(
                  story.name??"",


                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              SafeArea(



                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 48), // Space to balance the close icon
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
