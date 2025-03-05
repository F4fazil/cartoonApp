// lib/views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_awesome/views/youtube_player.dart';
import 'package:ui_awesome/widgets/Textstyle.dart';

import '../viewmodel/cartoonview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CartoonViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Cartoon Videos", style: kTitleStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              viewModel.fetchCartoonVideos();
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: viewModel.fetchCartoonVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final videos = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                final thumbnail = video['snippet']['thumbnails']['high']['url'];
                final title = video['snippet']['title'];
                final videoId = video['id']['videoId'];

                return ListTile(
                  leading: Image.network(thumbnail),
                  title: Text(title),
                  isThreeLine: false,
                  onTap: () {
                    // Navigate to a video player screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => VideoPlayerScreen(videoId: videoId),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
