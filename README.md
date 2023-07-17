# Logger

Swift Simple Console Logger

## Overview

<img src="https://github.com/InstaRobot/Logger/blob/master/Assets/demo.png" width="500" height="119" />

## Installation

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/InstaRobot/Logger.git`

_OR_

Update `dependencies` in `Package.swift`

```swift

dependencies: [
    .package(url: "https://github.com/InstaRobot/Logger.git", .upToNextMajor(from: "1.0.0"))
]

```

## Usage

```swift

import Logger

Logger.info("debug")		// 🔵
Logger.error("debug")		// 🔴
Logger.warning("debug")	    // 🟡
Logger.debug("debug")		// 🟢

```