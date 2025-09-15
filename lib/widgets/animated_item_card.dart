import 'package:flutter/material.dart';
import 'package:minecraft_manager/models/item.dart';
import 'package:minecraft_manager/image_proxy.dart';
import 'package:minecraft_manager/screens/item_detail_screen.dart';

class AnimatedItemCard extends StatefulWidget {
  final Item item;

  const AnimatedItemCard({super.key, required this.item});

  @override
  State<AnimatedItemCard> createState() => _AnimatedItemCardState();
}

class _AnimatedItemCardState extends State<AnimatedItemCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailScreen(item: widget.item),
            ),
          );
        },
        child: ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 0.95).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
          )),
          child: Card(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: widget.item.namespacedId,
                  child: ImageProxy.buildImage(
                    widget.item.imageUrl,
                    height: 80, // Altura ainda menor para a imagem
                    fit: BoxFit.contain,
                  ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.item.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

