import Foundation

// Access the default FileManager
FileManager.default

// Find the user's document directory using urls
FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

FileManager.documentDirectoryURL
