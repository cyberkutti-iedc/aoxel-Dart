import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

Future<void> decodeAOX(String aoxFilename, String outputDir) async {
  try {
    final aoxFile = await File(aoxFilename).readAsBytes();
    final header = utf8.decode(aoxFile.sublist(0, 3));

    if (header != 'aox') {
      print('Invalid AOX file format.');
      return;
    }

    var offset = 3;
    final numWavFiles = aoxFile.buffer.asByteData(offset, 4).getUint32(0, Endian.little);
    offset += 4;

    final metadataLength = aoxFile.buffer.asByteData(offset, 4).getUint32(0, Endian.little);
    offset += 4;
    final metadata = utf8.decode(aoxFile.sublist(offset, offset + metadataLength));
    print('Metadata: $metadata');
    offset += metadataLength;

    for (var i = 0; i < numWavFiles; i++) {
      final wavFilenameLength = aoxFile.buffer.asByteData(offset, 4).getUint32(0, Endian.little);
      offset += 4;
      final wavFilename = utf8.decode(aoxFile.sublist(offset, offset + wavFilenameLength));
      offset += wavFilenameLength;

      final wavSize = aoxFile.buffer.asByteData(offset, 4).getUint32(0, Endian.little);
      offset += 4;
      final wavData = aoxFile.sublist(offset, offset + wavSize);
      offset += wavSize;

      final outputWavPath = wavFilename;
      await Directory(outputDir).create(recursive: true);
      await File(outputWavPath).writeAsBytes(wavData);

      print('Decoded $aoxFilename to WAV file: $outputWavPath');
    }

    print('Decoded $aoxFilename to WAV files in $outputDir');
  } catch (err) {
    print(err);
  }
}

