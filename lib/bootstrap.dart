import 'package:apod/api/apod_api.dart';
import 'package:apod/features/shared/models/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/shared/models/models.dart';
import 'models/models.dart';

late Repository<Apod> apodRepository;
late Repository<JournalEntry> journalRepository;
late CommentRepository<Comment> commentRepository;

late StateNotifierProvider<ApodManager, ApodState> apodManagerProvider;
late StateNotifierProvider<CommentManager, CommentState> commentManagerProvider;

Future<void> bootstrap() async {
  // This is required if we want to access platform channels.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize Hive and a persistence wrapper
  await Hive.initFlutter();
  final apodHive = LocalPersistenceSource<Apod>(
    fromJson: (Map<String, dynamic> data) => Apod.fromJson(data),
    toJson: (Apod obj) => obj.toJson(),
  );
  final journalHive = LocalPersistenceSource<JournalEntry>(
    fromJson: (Map<String, dynamic> data) => JournalEntry.fromJson(data),
    toJson: (JournalEntry obj) => obj.toJson(),
  );
  final commentHive = LocalPersistenceSource<Comment>(
    fromJson: (Map<String, dynamic> data) => Comment.fromJson(data),
    toJson: (Comment obj) => obj.toJson(),
  );
  await apodHive.ready();
  await journalHive.ready();
  await commentHive.ready();
  // commentHive.clear();

  appStateManager.initializeApp();

  // Create the full Apod Repository
  apodRepository = Repository<Apod>(
    sourceList: [
      LocalMemorySource<Apod>(),
      apodHive,
      ApiSource<Apod>(
        api: ApodApi.create(),
        fromJson: (Map<String, dynamic> data) => Apod.fromJson(data),
      )
    ],
  );

  // Create the full JournalEntry Repository
  journalRepository = Repository<JournalEntry>(
    sourceList: [
      LocalMemorySource<JournalEntry>(),
      journalHive,
    ],
  );

  // Create the full Comment Repository
  commentRepository = CommentRepository<Comment>(
    sourceList: [
      LocalMemorySource<Comment>(),
      commentHive,
      FirestoreSource<Comment>(
        toJson: (Comment comment) => comment.toJson(),
        fromJson: (Map<String, dynamic> json) => Comment.fromJson(json),
        collectionName: 'comments',
      ),
    ],
  );

  apodManagerProvider = StateNotifierProvider<ApodManager, ApodState>(
    (ref) => ApodManager(apodRepository),
  );

  commentManagerProvider = StateNotifierProvider<CommentManager, CommentState>(
    (ref) => CommentManager(commentRepository),
  );
}
