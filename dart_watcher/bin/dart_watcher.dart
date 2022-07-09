// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Watches the given directory and prints each modification to it. library watch;
import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Usage: watch <directory path>');
    return;
  }

  final workingDir = arguments.first;

  final watcher = DirectoryWatcher(
    p.absolute(
      workingDir,
    ),
  );

  print('program started');

  watcher.events.listen(
    (event) {
      print(event);
      final extension = p.extension(event.path);

      if (extension == '.dart' || extension == '.feature') {
        print('run test');
        io.Process.run(
          'dart test_driver/app_test.dart',
          [],
          runInShell: true,
        ).then((value) => value.stdout).then(print);
      }
    },
  );
}
