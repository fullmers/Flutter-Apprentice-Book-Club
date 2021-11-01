import 'package:apod/features/journal/journal.dart';
import 'package:apod/features/splash/splash_page.dart';
import 'package:apod/home_page.dart';
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
      addJournal,
      editJournal,
    ],
  );

  static final addJournal = GoRoute(
    name: 'addJournal',
    path: 'journal-add',
    pageBuilder: (BuildContext context, GoRouterState state) {
      final journalManager =
          Provider.of<JournalManager>(context, listen: false);

      return AddJournalEntryPage.page(
        onSave: journalManager.setItem,
        entry: null,
      );
    },
  );

  static final editJournal = GoRoute(
    name: 'editJournal',
    path: 'journal/:jid',
    pageBuilder: (BuildContext context, GoRouterState state) {
      final journalManager =
          Provider.of<JournalManager>(context, listen: false);

      return AddJournalEntryPage.page(
        onSave: journalManager.setItem,
        entry: journalManager.getItem(state.params['jid']!),
      );
    },
  );
}
