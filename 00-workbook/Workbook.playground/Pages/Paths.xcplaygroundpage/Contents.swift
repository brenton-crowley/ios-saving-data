import Foundation
// Access the default FileManager
FileManager.default

// Find the user's document directory using urls
FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

FileManager.documentDirectoryURL // URL, and right-clickable

FileManager.documentDirectoryURL.path // String

// Using a URL to create a path to a directory.
let remindersDataURL = URL(
    filePath: "Reminders",
    directoryHint: .isDirectory,
    relativeTo: FileManager.documentDirectoryURL
)

// using a string to create a path to a directory
let stringURL = FileManager.documentDirectoryURL.appending(path: "String", directoryHint: .notDirectory)
    .appendingPathExtension("txt")

remindersDataURL.path
stringURL.path
