# Learning (a bit) iOS

## TODO list:

- [x] Simple UI application to allow device token creation
- [x] Run the application on a device
- [x] push messages using APNs (no firebase and no pushy lib. Just plain xCode and SWIFT)

## Prerequisites

- MacOS (tested with macOS Monterey v.12.4 - Darwin 21.5.0)
- xCode (tested with v.13.3)
- CocoaPod : `brew install cocoapods` (tested with v.1.11.3)
- An registered appleId
- An apple device (tested on iPad PRO 11, iPadOS 15.5)

## How to build the project

- Run `pod install`
- Close xCode and import the *.xcworkspace
- Run/Debug project on device (connected via USB type C cable)

## How to release to appcenter (https://appcenter.ms/)

- TBD

## Documentation

- [on developer.apple.com - Build basic UI](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1)
- [read more about Firebase Messaging](https://firebase.google.com/docs/cloud-messaging)
- [how to create a IPA file from xarchive](https://stackoverflow.com/a/47940681/1102761)

