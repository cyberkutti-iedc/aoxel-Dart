# Aoxel Decoder (Dart)

Aoxel Decoder is a Dart library designed to decode Aoxel audio files, a unique audio format with advanced encoding technology optimized for uncompressed audio. Aoxel files can simultaneously store up to 32 audio files. This decoder library provides an efficient solution to extract audio data from Aoxel files and save it as WAV files.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Decoding an Aoxel File](#decoding-an-aoxel-file)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Installation

To use the Aoxel Decoder library in your Dart project, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  aoxel_decoder: ^1.0.0
```

Then, run:

```shell
dart pub get
```

## Usage

### Decoding an Aoxel File

To decode an Aoxel file, follow these steps:

```dart
import 'package:aoxel_decoder/aoxel_decoder.dart';

void main() async {
  // Define the path to the Aoxel file.
  final aoxFilename = 'path/to/input.aox';

  // Specify the output directory where WAV files will be saved.
  final outputDir = 'output_dir';

  // Decode the Aoxel file and save the WAV files to the output directory.
  await decodeAOX(aoxFilename, outputDir);
}
```

Replace `'path/to/input.aox'` with the actual path to your Aoxel file and `'output_dir'` with the directory where you wish to save the decoded WAV files.

## Testing

The Aoxel Decoder library includes a set of test cases to ensure its functionality. You can also write your custom test cases using the provided test framework.

To run the tests, use the following command:

```shell
dart test
```

### Custom Test Example

Here's an example of a custom test case:

```dart
import 'package:test/test.dart';
import 'package:aoxel_decoder/aoxel_decoder.dart';
import 'dart:io';

void main() {
  group('Aoxel Decoder Tests', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('aox_decoder_tests');
    });

    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });

    test('Decode Aoxel with valid format', () async {
      final aoxFilename = './test_resources/test.aox'; // Update with a valid Aoxel file path
      final outputDir = tempDir.path;

      await decodeAOX(aoxFilename, outputDir);
      // Add assertions to verify successful decoding, e.g., check if the decoded WAV files exist in the temp directory.
    });

    test('Decode Aoxel with invalid format', () async {
      final aoxFilename = 'test_resources/invalid.aox'; // Update with an invalid Aoxel file path
      final outputDir = tempDir.path;

      await decodeAOX(aoxFilename, outputDir);
      // Add assertions to verify that decoding fails as expected, e.g., check if an error is thrown.
    });
  });
}
```

## Contributing

We welcome contributions! If you'd like to enhance the Aoxel Decoder library, please open issues, create pull requests, or discuss potential improvements.

## License

The Aoxel Decoder library is licensed under the [aoxel Source License](LICENSE). 