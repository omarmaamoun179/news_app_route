import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:news_app_route/models/source_model.dart';
import 'package:news_app_route/shared/widgets/web_view_view.dart';

class ArticlesNews extends StatelessWidget {
  Article articles;
  Sources sources;
  ArticlesNews({super.key, required this.articles, required this.sources});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => WebViewScreen(
                    articles: articles,
                    sources: sources,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? '',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              sources.id!.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color(0xff79828B),
              ),
            ),
            Text(
              articles.description!.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xff42505C),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                articles.publishedAt!.toUpperCase().substring(0, 10),
                style: GoogleFonts.montserrat(
                  color: const Color(0xffA3A3A3),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
