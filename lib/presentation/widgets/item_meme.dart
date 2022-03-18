import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc/common/colors.dart';
import 'package:sample_bloc/data/model/meme_model.dart';

class ItemMeme extends StatefulWidget {
  const ItemMeme({Key? key, this.meme}) : super(key: key);
  final MemeModel? meme;
  @override
  State<ItemMeme> createState() => _ItemMemeState();
}

class _ItemMemeState extends State<ItemMeme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.greyLight),
      child: ListTile(
        style: ListTileStyle.list,
        contentPadding: const EdgeInsets.all(10),
        leading: CachedNetworkImage(
          imageUrl: widget.meme!.url,
          imageBuilder: (context, provider) {
            return Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: provider, fit: BoxFit.cover),
              ),
            );
          },
          placeholder: (context, url) => const SizedBox(
              width: 30, height: 30, child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            widget.meme!.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        subtitle: Text(
            "${widget.meme!.width.toString()} X ${widget.meme!.height.toString()}",
            style: const TextStyle(fontSize: 12)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text(widget.meme!.id)],
        ),
      ),
    );
  }
}
