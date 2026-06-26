# CR Coin Flip

CR Coin Flip is a very simple macOS menu bar app for flipping a coin.

Click the menu bar icon, press **Flip a Coin**, and the app will show either **Heads!** or **Tails!**.

That is all it does. It is a small SwiftUI/AppKit project made as a basic utility app.

## Requirements

- macOS
- Xcode

## Running

Open `CRCoinFlip.xcodeproj` in Xcode and press Run.

## Downloading

Release builds can be shared from the GitHub Releases page as a zipped `.app`.

This app is distributed for free and is not notarized. If macOS blocks the app after download, right-click the app and choose **Open**.

## Creating a Release Zip

Build the release app:

```sh
xcodebuild -project CRCoinFlip.xcodeproj -scheme CRCoinFlip -configuration Release -derivedDataPath ./DerivedData CODE_SIGNING_ALLOWED=NO build
```

Create the zip file:

```sh
ditto -c -k --keepParent "DerivedData/Build/Products/Release/CR Coin Flip.app" "CR-Coin-Flip-macOS.zip"
```

Upload `CR-Coin-Flip-macOS.zip` to a GitHub Release.

## License

This project is available under the MIT License.
