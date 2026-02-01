import 'package:remote_rift_utils/src/version.dart';
import 'package:test/test.dart';

void main() {
  group('parse', () {
    test('parses valid version', () {
      final v = Version.parse('1.2.3');
      expect(v, Version(major: 1, minor: 2, patch: 3));
    });

    test('parses version with build metadata', () {
      final v = Version.parse('1.2.3+45');
      expect(v, Version(major: 1, minor: 2, patch: 3));
    });

    test('throws on invalid input', () {
      expect(() => Version.parse('1.2'), throwsA(VersionError.invalidInput));
      expect(() => Version.parse('a.b.c'), throwsA(VersionError.invalidInput));
      expect(() => Version.parse('01.2.3'), throwsA(VersionError.invalidInput));
    });
  });

  group('equals', () {
    test('versions with same values are equal', () {
      expect(Version(major: 1, minor: 2, patch: 3), Version(major: 1, minor: 2, patch: 3));
    });

    test('different versions are not equal', () {
      expect(Version(major: 1, minor: 2, patch: 3), isNot(Version(major: 1, minor: 2, patch: 4)));
    });
  });

  group('isAtLeast', () {
    test('returns true for same version', () {
      final v = Version(major: 1, minor: 2, patch: 3);
      expect(v.isAtLeast(v), isTrue);
    });

    test('returns true for higher version', () {
      final v = Version(major: 2, minor: 3, patch: 4);
      expect(v.isAtLeast(Version(major: 1, minor: 2, patch: 3)), isTrue);
    });

    test('returns false for lower version', () {
      final v = Version(major: 1, minor: 2, patch: 3);
      expect(v.isAtLeast(Version(major: 2, minor: 0, patch: 0)), isFalse);
    });
  });
}
