class CanLoadFile {
  const CanLoadFile(this.path);

  final String path;

  String get npath => path.replaceAll('\\', '/');
}
