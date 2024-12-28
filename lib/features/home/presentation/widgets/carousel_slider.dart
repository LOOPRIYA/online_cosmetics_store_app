import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final List<String> imageUrls;
  final double height;

  const CarouselSlider(
      {super.key, required this.imageUrls, this.height = 200.0});

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.imageUrls[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Image not found'));
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // Align to bottom
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Скидка -15%',
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                            const SizedBox(height: 8),
                            Text('Сыворотка\nHA EYE & NECK SERUM',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            const SizedBox(height: 10)
                          ],
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        side: const BorderSide(
                                            color: Colors.white)),
                                    elevation: 0.0,
                                    overlayColor: Colors.transparent),
                                child: const Text('Перейти к акции',
                                    style: TextStyle(color: Colors.white))))
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 50,
            left: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageUrls.length,
                  (index) => _buildPageIndicator(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? Colors.white : Colors.grey),
    );
  }
}
