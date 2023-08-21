import Foundation
//: ## Data Types
//: ### Integers
// UInt8 means that the integer can store 8 bits (1 byte).
//

let age: UInt8 = 32 // positive only
MemoryLayout.size(ofValue: age)
MemoryLayout<UInt8>.size
UInt8.min
UInt8.max
let height: Int8 = 72
MemoryLayout.size(ofValue: height)
MemoryLayout<Int8>.size
Int8.min
Int8.max
MemoryLayout<Int16>.size
Int16.min
Int16.max
MemoryLayout<Int32>.size
Int32.min
Int32.max
MemoryLayout<Int64>.size
Int64.min
Int64.max
MemoryLayout<Int>.size
Int.min
Int.max
//: ### Floats
let weight: Float = 154.5

// The larger a float number becomes, the lower the precision of the float.
// Eg. A float range between 1-2 has high precision as memory can allocate space for many decimal places.
// But a range between 1-10000 will have much less precision because of the number of decimal places it can hold.
MemoryLayout.size(ofValue: weight)
MemoryLayout<Float>.size
Float.leastNormalMagnitude
Float.greatestFiniteMagnitude
//: ### Doubles
// Uses twice the bits as a single precision number.
let earthRadius: Double = 3958.8
MemoryLayout.size(ofValue: earthRadius)
MemoryLayout<Double>.size
Double.leastNormalMagnitude
Double.greatestFiniteMagnitude
//: ### Binary & Hexadecimal
// By deafult, when you use an integer literal, it's in base 10.
// Using a 0b refix means that you're using a base 2 literal.
// Split the number with an underscore in every 4 bits.
let ageBinary: UInt8 = 0b0010_0000
let ageBinaryNegative: Int8 = -0b0010_0000
// A group of 4 bits is known as a nibble.
// Often represented using a base 16 number. (Hexadecimal) 0-15 inclusive
// prefix for hex is 0x
let weightHexadecimal: UInt16 = 0x9B
let weightHexadecimalNegative: Int16 = -0x9B
//: ## Bytes
let favoriteBytes: [UInt8] = [
  240,          159,          152,          184,
  240,          159,          152,          185,
  0b1111_0000,  0b1001_1111,  0b1001_1000,  186,
  0xF0,         0x9F,         0x98,         187
]

MemoryLayout<UInt8>.size * favoriteBytes.count

//:## Saving and Loading Data
var favouriteBytesData = Data(favoriteBytes) // create a data object with the array of UInt8

var favouriteBytesURL = URL( // refer to the user's document directory to save the data
    fileURLWithPath: "Favourite Bytes",
    relativeTo: FileManager.documentDirectoryURL
)

try favouriteBytesData.write(to: favouriteBytesURL) // make the write happen

let savedFavouriteBytesData = try Data(contentsOf: favouriteBytesURL) // read the contents of the written file.
let savedFavouriteBytes = Array(savedFavouriteBytesData) // convert the data back into an array.

favoriteBytes == savedFavouriteBytes // true
favouriteBytesData == savedFavouriteBytesData // true

//: ## String
try favouriteBytesData.write(to: favouriteBytesURL.appendingPathExtension("txt"))

let string = String(data: savedFavouriteBytesData, encoding: .utf8)!

//: ## String Data Challenge
let catsURL = URL(filePath: "Cats", directoryHint: .notDirectory, relativeTo: FileManager.documentDirectoryURL)

try string.write(to: catsURL, atomically: true, encoding: .utf8)

let stringFile = try Data(contentsOf: catsURL)
let readString = String(data: stringFile, encoding: .utf8)

