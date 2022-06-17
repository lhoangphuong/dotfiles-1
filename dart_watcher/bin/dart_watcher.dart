// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Watches the given directory and prints each modification to it. library watch;
import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';

void main(List<String> arguments) {
  if (arguments.length != 2) {
    print('Usage: watch <directory path> <command>');
    return;
  }

  final workingDir = arguments.first;
  final command = arguments.last.split(' ');

  final watcher = DirectoryWatcher(
    p.absolute(
      workingDir,
    ),
  );
  watcher.events.listen(
    (event) {
      print(event);
      if (p.extension(event.path) == '.dart') {
        io.Process.run(command.first, command.skip(0).toList(),
                runInShell: false)
            .then((value) => value.stdout)
            .then(print);
      }
    },
  );
}
