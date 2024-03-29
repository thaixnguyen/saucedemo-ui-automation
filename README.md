## Sauce Demo UI Automation with XCUITest
Automates the different flows for [Swag Labs](https://www.saucedemo.com/) using a iOS Mobile device with Safari.

**Requirements:** 
===
You'll need [XCode](https://developer.apple.com/xcode/) and all the dependencies that come with XCode to run this. 

You can also install this on your terminal via ```xcode-select --install``` if you want to run this on the terminal.

How to Run:
===
There's three ways you can run this:
1. You can either do this on the XCode UI, under the Test Navigator and running UITest under the `./tests/ui` directory.
2. You can run this command on your terminal: ```xcodebuild test -scheme testautomation -destination 'platform=iOS Simulator,name=iPhone 15 Pro Max' -only-testing tests/UITest```
3. Run the CI on this repo (Only currently set up for iPhone 14 devices)

Make sure you're in the root directory when running this command.

Issues:
===
Running the test using a tablet iOS device will not work, it has issues finding the URL.

Improvements:
===
Down the line, I want to look into implementing:

1. Look at a way to containizer the tests using Docker with a MacOS image via Docker.
2. Cleaning up some of the code, I can definitely improve some of the encapsulation for the screens.
3. Adding the rest of the elements on all the pages.
4. Adding Allure for cleaner test reports.
5. Integrate Screenplay into this rather than using Screens/POMs.
