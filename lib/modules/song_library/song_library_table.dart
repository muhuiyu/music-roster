import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/models/service/song.dart';
import 'package:music_roster_admin/models/user/user_model.dart';

class SongLibraryTable extends StatelessWidget {
  final List<Song> songs;
  final Function(Song song) onEditButtonPressed;
  const SongLibraryTable({
    super.key,
    required this.songs,
    required this.onEditButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    List<String> dataColumns = [
      AppText.name,
      AppText.musicLink,
      AppText.sheet,
    ];

    if (songs.isEmpty) {
      return Container();
    }

    final double width = MediaQuery.of(context).size.width * 0.8;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: width,
        child: DataTable(
          columnSpacing: 0,
          columns: dataColumns
              .map((e) => DataColumn(
                  label: Center(
                      child: Text(e,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.tableHeader))))
              .toList(),
          rows: songs
              .map((song) => DataRow(
                    cells: [
                      _renderNameCell(song),
                      _renderMusicLinkCell(song),
                      _renderSheetCell(song),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  _renderNameCell(Song song) {
    return DataCell(
      Text(song.name, style: AppTextStyle.tableContent),
      onTap: () {
        // TODO: tap to copy
      },
    );
  }

  _renderMusicLinkCell(Song song) {
    return DataCell(
      SvgPicture.asset(
        AppImage.youtubeLogo,
        semanticsLabel: 'YouTube logo',
        width: WidgetSize.songLibraryIconSize,
      ),
      onTap: () {
        // _showRolesMultiSelect(context);
      },
    );
  }

  _renderSheetCell(Song song) {
    return DataCell(
      Icon(Icons.note),
      // Text(song.sheetLinkString ?? '', style: AppTextStyle.tableContent),
      onTap: () {
        // TODO: Tap to copy
      },
    );
  }

  _renderActionsCell(Song song) {
    return DataCell(Row(
      children: [
        IconButton(
          onPressed: () {
            onEditButtonPressed(song);
          },
          icon: Icon(Icons.edit),
        ),
        IconButton(
          onPressed: () {
            // TODO:
          },
          icon: Icon(Icons.more),
        )
      ],
    ));
  }
}
