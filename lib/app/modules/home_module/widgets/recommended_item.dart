import 'package:bluestacks_assignment/app/data/models/recommended_tournament_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedItem extends StatelessWidget {
  final Tournament tournament;

  RecommendedItem(this.tournament);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 428,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: const Offset(
                4.0,
                4.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: tournament.coverUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      height: constraints.maxHeight * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: constraints.maxHeight * 0.5,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: constraints.maxHeight * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Icon(Icons.error),
                    ),
                  )),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
                child: Container(
                  height: constraints.maxHeight * 0.5,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240.h,
                              child: Text(
                                tournament.name,
                                style: TextStyle(
                                    color: Color(0xff2D2D32),
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              tournament.gameName,
                              style: TextStyle(
                                  color: Color(0xff9BA1B7),
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff7A7A7E),
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
