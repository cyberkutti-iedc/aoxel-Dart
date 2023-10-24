import 'package:aoxel_decoder/aoxel_decoder.dart';

Future<void> main() async {
  // The path to the AOX file.
  final aoxFilename = '../data/input.aox';

  // The path to the output directory.
  final outputDir = 'output_dir';

  // Decode the AOX file and save the WAV files to the output directory.
  await decodeAOX(aoxFilename, outputDir);
}
