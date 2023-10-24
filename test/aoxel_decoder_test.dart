import 'package:test/test.dart';
import 'package:aoxel_decoder/aoxel_decoder.dart'; 
import 'dart:io';

void main() {
  group('AOX Decoder Tests', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('aox_decoder_tests');
    });

    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });

    test('Decode AOX with valid format', () async {
      final aoxFilename = './test_resources/test.aox'; // Change to a valid AOX file path
      final outputDir = tempDir.path;

      await decodeAOX(aoxFilename, outputDir);
      // Add assertions to check if the decoding is successful.
      // For example, you can check if the decoded WAV files exist in the temp directory.
      
    });

   test('Decode AOX with invalid format', () async {
      final aoxFilename = 'test_resources/invalid.aox'; // Change to an invalid AOX file path
      final outputDir = tempDir.path;

      await decodeAOX(aoxFilename, outputDir);
      // Add assertions to check if the decoding fails as expected.
      // For example, you can check if an error is thrown.
    });
  });
}
