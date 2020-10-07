/// Exceptions when we were unable to get the file type from a transactions file
class UnableToReadFileTypeException implements Exception {}

/// Exceptions when we were unable to get the generated timestamp from a transactions file
class UnableToReadGeneratedTimestampException implements Exception {}

/// Exceptions when we the transactions file where already imported
class FileAlreadyImportedException implements Exception {}

/// Exceptions when we where unable to determine the transactions kinds during the file import
class UnableToDetermineTransactionKind implements Exception {}
