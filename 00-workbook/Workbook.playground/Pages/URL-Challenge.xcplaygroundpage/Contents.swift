import Foundation
//: ## Sample
let remindersDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentDirectoryURL)
//: ## URLs & Paths
let stringURL = FileManager.documentDirectoryURL
  .appendingPathComponent("String")
  .appendingPathExtension("txt")

stringURL.path
//: ## Challenge
let challengeString: String = "To do list"
let challengeURL: URL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")

challengeURL.lastPathComponent // get the filename and type
