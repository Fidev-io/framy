import 'dart:async';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:meta/meta.dart';
import 'package:ozzie/reporter.dart';
import 'package:ozzie/zip_generator.dart';

const rootFolderName = "ozzie";

/// A copied Ozzie class but without timestamp, as we cant archive files with semicolon in Github Actions
class GithubFriendlyOzzie {
  final FlutterDriver driver;
  final String groupName;
  final bool shouldTakeScreenshots;

  GithubFriendlyOzzie._internal(
    this.driver, {
    @required this.groupName,
    @required this.shouldTakeScreenshots,
  }) : assert(driver != null);

  /// Build an [Ozzie] object with the given [FlutterDriver]. If a `groupName`
  /// is given, it will be used to group your screenshots in the HTML report;
  /// otherwise, they will be placed under a "default" group.
  /// This method is intended to be called in your tests `setUp`, immediately
  /// after a [FlutterDriver] object has been built.
  ///
  /// Usage:
  ///
  /// ```
  /// Ozzie.initWith(driver) -> will group the screenshots taken under "default"
  /// Ozzie.initWith(driver, 'my_report') -> will group the screenshots taken under "my_report"
  /// ```
  factory GithubFriendlyOzzie.initWith(
    FlutterDriver driver, {
    String groupName = "default",
    bool shouldTakeScreenshots = true,
  }) =>
      GithubFriendlyOzzie._internal(
        driver,
        groupName: groupName,
        shouldTakeScreenshots: shouldTakeScreenshots,
      );

  /// It takes a an PNG screnshot of the given state of the application when
  /// being called. The name of the screenshot will be the given `screenshotName`
  /// prefixed by the timestamp of that moment, and suffixed by `.png`.
  /// It will be stored in a folder whose name will be the given `groupName`
  /// when calling `Ozzie.initWith`.
  Future takeScreenshot(String screenshotName) async {
    if (shouldTakeScreenshots) {
      final filePath = _filePath(screenshotName);
      final file = await File(filePath).create(recursive: true);
      final pixels = await driver.screenshot();
      await file.writeAsBytes(pixels);
      print('Ozzie took screenshot: $filePath');
    }
  }

  /// This is the method that will generate the HTML report with all the
  /// screenshots taken during integration tests.
  /// This is method is intended to be called in your tests `tearDown`,
  /// immediately after closing the given [FlutterDriver].
  Future generateHtmlReport() async {
    if (!await Directory(_groupFolderName).exists()) {
      await Directory(_groupFolderName).create(recursive: true);
    }
    await _generateZipFiles();
    final reporter = Reporter();
    await reporter.generateHtmlReport(
      rootFolderName: rootFolderName,
      groupName: groupName,
    );
  }

  /// This method will wrap your `body` into the the `traceAction`
  /// method of the `FlutterDriver` instance, and will generate
  /// both the the timeline report and the summary report with the
  /// given `reportName` into your `groupName` folder, under a new
  /// folder named "profiling"
  Future<void> profilePerformance(
    String reportName,
    Future<dynamic> body(),
  ) async {
    final timeline = await driver.traceAction(() async => await body());
    final summary = TimelineSummary.summarize(timeline);
    await summary.writeSummaryToFile(
      reportName,
      destinationDirectory: 'ozzie/$groupName/profiling',
      pretty: true,
    );
    await summary.writeTimelineToFile(
      reportName,
      destinationDirectory: 'ozzie/$groupName/profiling',
      pretty: true,
    );
  }

  Future _generateZipFiles() async {
    final zipGenerator = ZipGenerator();
    await zipGenerator.generateZipWithAllGroups();
    await zipGenerator.generateZipInFolder(
      groupFolderName: _groupFolderName,
      groupName: groupName,
    );
  }

  String get _groupFolderName => '$rootFolderName/$groupName';

  String _fileName(String screenshotName) => '$screenshotName.png';

  String _filePath(String screenshotName) {
    final fileName = _fileName(screenshotName);
    return '$_groupFolderName/$fileName';
  }
}
