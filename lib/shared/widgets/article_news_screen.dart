import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_route/models/articles_modle/article.dart';
import 'package:news_app_route/shared/widgets/web_view_view.dart';

class ArticlesNewsWidget extends StatelessWidget {
  Article articles;

  ArticlesNewsWidget({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => WebViewScreen(
                    articles: articles,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
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
              articles.source?.id?.toUpperCase() ?? '',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: const Color(0xff79828B),
              ),
            ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              articles.description?.toUpperCase() ?? '',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xff42505C),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                articles.publishedAt?.toUpperCase().substring(0, 10) ?? '',
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
