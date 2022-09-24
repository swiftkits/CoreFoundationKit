# CoreFoundationKit

![MIT license](https://img.shields.io/github/license/swiftkits/CoreFoundationKit)
![CoreUIKit CI workflow](https://github.com/swiftkits/CoreFoundationKit/actions/workflows/build.yml/badge.svg)
![Pod](https://img.shields.io/cocoapods/v/CoreFoundationKit)
![Carthage](https://img.shields.io/badge/Carthage-Compatible-green)
![SPM](https://img.shields.io/badge/SPM-Compatible-green)

`CoreFoundationKit` provides helpful extensions and rich features build on top of `Foundation` framework.

- [Installation Guide](#installation)
    - [Install using Cocoapods](#cocoapods)
    - [Install using Swift package manager](#swift-package-manager)
    - [Install using Carthage](#carthage)
- [Documentation](#documentation)
- [Examples](#examples)
- [Learn](#learn)

## Installation

### Cocoapods
CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. [Learn More!](https://cocoapods.org/)
```ruby
pod 'CoreFoundationKit', '0.1.0'
```

### Swift package manager
The Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies. [Learn More!](https://swift.org/package-manager/)
```swift
dependencies: [
    .package(url: "https://github.com/swiftkits/CoreFoundationKit.git", .upToNextMajor(from: "0.1.0"))
]
```

### Carthage
A simple, decentralized dependency manager for Cocoa. [Learn More!](https://github.com/Carthage/Carthage)
```ruby
github "CoreFoundationKit" ~> 0.1.0
```

## Documentation
- [CoreFoundationKit Code level doc](https://swiftkits.github.io/CoreFoundationKit/)

## Examples
- How to setup `FileOperation`
```swift
let manager = FileManager.default
let rootDir = try! manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

let directoryOperation = FileDirectoryOperation(manager: manager, rootDir: rootDir)
let fileOperations = FileOperation(directoryManager: directoryOperation)
```

- How to save file data into local file storage
```swift
let savedFile = try fileOperations.save(contentsOf: imageData, with: fileName)

//
// Returns
// FileItem with saved file info
//

savedFile.location // Local storage url of the file
savedFile.name     // Name of the file
savedFile.data     // data of the file

```

- How delete file from local storage
```swift
try fileOperations.deleteFile(at: localFileURL)
```

- How to fetch the saved file from local storage
```swift
try fileOperations.getFile(at: localFileURL)
```

## Learn
Following are the useful links for learning about autolayout.
- [FileManager](https://developer.apple.com/documentation/foundation/filemanager)
- [Date](https://developer.apple.com/documentation/foundation/date)
