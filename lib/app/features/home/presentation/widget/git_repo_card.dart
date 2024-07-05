import 'dart:ui' as ui show PlaceholderAlignment;

import 'package:ailoitte/app/core/constants/app_colors.dart';
import 'package:ailoitte/app/core/helper/size_config.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GitRepoCard extends StatelessWidget {
  final Item item;
  const GitRepoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor)),
      padding: ResponsiveDesign.all(16, context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              "${item.owner.login}/${item.name}",
              style: TextStyle(
                  fontSize: ResponsiveDesign.fontSize(16, context),
                  fontWeight: FontWeight.w500,
                  color: color_0969da),
            ),
          ),
          SizedBox(
            height: ResponsiveDesign.height(3, context),
          ),
          if (item.description != null) ...[
            Text(
              item.description!,
              style: TextStyle(
                  fontSize: ResponsiveDesign.fontSize(14, context),
                  color: color_1f2328),
            )
          ],
          if (item.topics.isNotEmpty) ...[
            SizedBox(
              height: ResponsiveDesign.height(3, context),
            ),
            Wrap(
              spacing: ResponsiveDesign.width(5, context),
              runSpacing: ResponsiveDesign.height(5, context),
              children: item.topics
                  .map((e) =>
                      e.isNotEmpty ? _topicContainer(context, e) : Container())
                  .toList(),
            )
          ],
          SizedBox(
            height: ResponsiveDesign.height(3, context),
          ),
          Text.rich(TextSpan(children: [
            WidgetSpan(
                alignment: ui.PlaceholderAlignment.middle,
                child: Icon(
                  Icons.star_border_rounded,
                  size: ResponsiveDesign.height(18, context),
                )),
            TextSpan(
                text: " ${item.stargazersCount.toString()}\t\t\t",
                style: TextStyle(
                    color: color_636c76,
                    fontSize: ResponsiveDesign.fontSize(12, context))),
            WidgetSpan(
                alignment: ui.PlaceholderAlignment.middle,
                child: Icon(
                  Icons.circle,
                  size: ResponsiveDesign.height(3, context),
                )),
            TextSpan(
                text:
                    "\t\t\tUpdated on ${DateFormat('dd MMM yyyy').format(item.updatedAt)}",
                style: TextStyle(
                    color: color_636c76,
                    fontSize: ResponsiveDesign.fontSize(12, context))),
          ]))
        ],
      ),
    );
  }

  Widget _topicContainer(BuildContext context, String topics) {
    return Container(
      decoration: BoxDecoration(
        color: color_ddf4ff,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: ResponsiveDesign.symmetric(horizontal: 5, vertical: 2, context),
      child: Text(
        topics,
        style: TextStyle(
            color: color_0969da,
            fontSize: ResponsiveDesign.fontSize(12, context)),
      ),
    );
  }
}
