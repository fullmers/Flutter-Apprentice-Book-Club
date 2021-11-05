import 'package:apod/features/home/home.dart';
import 'package:apod/features/shared/widgets/apod_detail.dart';
import 'package:apod/features/splash/splash_page.dart';
import 'package:apod/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Routes {
  static final splash = GoRoute(
    path: '/splash',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        SplashPage.page(key: state.pageKey),
  );

  static final home = GoRoute(
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        HomePage.page(key: state.pageKey),
    routes: [
      writeJournal,
      apodDetail,
    ],
  );

  static final apodDetail = GoRoute(
    name: 'apodDetail',
    path: 'apod/:id',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        ApodDetail.page(id: int.parse(state.params['id']!)),
  );

  static final writeJournal = GoRoute(
    name: 'editJournal',
    path: 'journal/:jid',
    pageBuilder: (BuildContext context, GoRouterState state) {
      final journalManager =
          Provider.of<JournalManager>(context, listen: false);

      if (state.params['jid'] == 'add') {
        // Handle /journal/add
        return AddJournalEntryPage.page(
          onSave: journalManager.setItem,
          entry: null,
        );
      }

      return AddJournalEntryPage.page(
        onSave: journalManager.setItem,
        entry: journalManager.getItem(state.params['jid']!),
      );
    },
  );
}
