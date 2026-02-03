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
    test('patch matching', () {
      final v = Version(major: 1, minor: 2, patch: 3);

      expect(v.isAtLeast(Version(major: 1, minor: 2, patch: 3)), isTrue);
      expect(v.isAtLeast(Version(major: 1, minor: 2, patch: 2)), isTrue);
      expect(v.isAtLeast(Version(major: 1, minor: 2, patch: 4)), isFalse);
    });

    test('minor matching', () {
      final v = Version(major: 1, minor: 2, patch: 0);

      expect(v.isAtLeast(Version(major: 1, minor: 2, patch: 99), matching: .minor), isTrue);
      expect(v.isAtLeast(Version(major: 1, minor: 2, patch: 0), matching: .minor), isTrue);
      expect(v.isAtLeast(Version(major: 1, minor: 3, patch: 0), matching: .minor), isFalse);
    });

    test('major matching', () {
      final v = Version(major: 2, minor: 0, patch: 0);

      expect(v.isAtLeast(Version(major: 1, minor: 99, patch: 99), matching: .major), isTrue);
      expect(v.isAtLeast(Version(major: 2, minor: 0, patch: 0), matching: .major), isTrue);
      expect(v.isAtLeast(Version(major: 3, minor: 0, patch: 0), matching: .major), isFalse);
    });
  });
}
