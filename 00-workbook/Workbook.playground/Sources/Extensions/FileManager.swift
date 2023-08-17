import Foundation

// create easy access to the user's files directory.
public extension FileManager {
    static var documentDirectoryURL: URL {
        // The backward quotes is called semantics because deafult is a reserved keyword
// `default` is just FileManager.default
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
