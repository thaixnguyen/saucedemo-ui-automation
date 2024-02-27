## Sauce Demo UI Automation with XCUITest
A testing framework that automates the login purchase flow for https://www.saucedemo.com/ using iOS with Safari.

**Requirements:** 
===
You'll need [XCode 15](https://developer.apple.com/xcode/) and all the dependencies that come with XCode to run this. 

You can also install this on your terminal via ```xcode-select --install``` if you want to run this on the terminal.

How to Run:
===
There's two ways you can run this. You can either do this on the XCode UI, under the Test Navigator and running UITest under the tests directory or you can run this command on your terminal: 

```xcodebuild test -scheme <name_of_scheme> -destination 'platform=iOS Simulator,name=<iPhone Device Name>' -only-testing tests/UITest```

Make sure you're in the root directory when running this command.

Improvements:
===
Down the line, I want to look into implementing:

1. Cleaning up some of the code, I can definitely improve some of the encapsulation for the screens.
2. Adding the rest of the elements on all the pages.
3. Adding Allure for cleaner test reports.
4. Adding CI via Github Actions.
5. Integrate Screenplay into this rather than using Screens/POMs.
