String fixJson(String generatedJson) {
  return generatedJson.replaceAll('\n]\n\n[\n', ',\n');
}
