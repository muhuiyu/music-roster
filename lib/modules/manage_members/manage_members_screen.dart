import 'package:flutter/material.dart';
import 'package:music_roster_admin/api/providers/data_provider.dart';
import 'package:music_roster_admin/constants/constants.dart';
import 'package:music_roster_admin/helpers/app_message.dart';
import 'package:music_roster_admin/models/common/screen_name.dart';
import 'package:music_roster_admin/models/user/user_model.dart';
import 'package:music_roster_admin/modules/common/widgets/custom_page.dart';
import 'package:music_roster_admin/modules/common/widgets/search_bar.dart';
import 'package:music_roster_admin/modules/manage_members/edit_member_dialog.dart';
import 'package:music_roster_admin/modules/manage_members/manage_members_table.dart';
import 'package:music_roster_admin/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ManageMembersScreen extends StatefulWidget {
  const ManageMembersScreen({super.key});

  @override
  State<ManageMembersScreen> createState() => _ManageMembersScreenState();
}

class _ManageMembersScreenState extends State<ManageMembersScreen> {
  late TextEditingController _editingController;
  late Map<String, UserModel> _users = {};
  late List<UserModel> _displayedUsers = [];
  late DataProvider _dataProvider;

  @override
  void initState() {
    _editingController = TextEditingController();
    _dataProvider = Provider.of<DataProvider>(context, listen: false);
    Future.delayed(Duration.zero, () {
      _fetchData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _users.clear();
    _displayedUsers.clear();
    super.dispose();
  }

  int getTotalNumberOfPages(List<UserModel> users) {
    return (users.length / DataProvider.numberOfEntriesPerPage).ceil();
  }

  _fetchData() async {
    _dataProvider.fetchAllUsers().then((value) {
      setState(() {
        _users = value;
        _displayedUsers = _users.values.toList();
      });
    }).onError((error, stackTrace) {
      AppMessage.errorMessage(error.toString());
    });
  }

  _filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        _displayedUsers = _users.values.toList();
      } else {
        _displayedUsers = _users.values
            .where(
                (user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  _onEditButtonPressed(UserModel user) {
    // return showDialog(
    //   context: context,
    //   builder: (context) {
    //     return EditMemberDialog();
    //   },
    // );
    // Get.toNamed(Routes.editMemberScreen,
    //     arguments: Routes.editMemberArgument(user));
  }

  @override
  Widget build(BuildContext context) {
    return CustomPage(
      currentScreen: ScreenName.manageMembers,
      widgets: [
        _renderHeader(),
        Paddings.inlineSpacingBox,
        _renderTable(),
      ],
    );
  }

  _showAddMemberDialog() {
    // TODO:
  }

  _renderHeader() {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: SearchBar(
              editingController: _editingController,
              onChanged: _filterSearchResults),
        ),
        const Spacer(),
        CustomTextButton(
            text: AppText.addMemberButtonText,
            onPressed: () {
              _showAddMemberDialog();
            },
            type: CustomButtonType.primary),
      ],
    );
  }

  _renderTable() {
    if (_users.isEmpty) {
      return Container();
    }
    return ManageMembersTable(
      users: _displayedUsers,
      onEditButtonPressed: _onEditButtonPressed,
    );
  }
}
