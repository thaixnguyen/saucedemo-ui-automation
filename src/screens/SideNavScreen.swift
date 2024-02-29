//
//  SideNavScreen.swift
//  src
//
//  Created by Thai Nguyen on 2024-02-25.
//

import Foundation
import XCTest

class SideNavScreen: BaseScreen {
    private lazy var openSideNav = app.buttons[TestIDs.sideNavBarID]
    private lazy var allItemsButton = app.staticTexts[TestIDs.allItemID]
    private lazy var aboutButton = app.staticTexts[TestIDs.aboutID]
    private lazy var logOutButton = app.staticTexts[TestIDs.logOutID]
    private lazy var resetAppStateButton = app.staticTexts[TestIDs.resetAppStateID]
    private lazy var closeButton = app.buttons[TestIDs.closeNavBarID]

    func openSideNavBar() {
        openSideNav.tap()
    }

    func clickOnAllItemsButton() {
        allItemsButton.tap()
    }

    func clickOnAboutButton() {
        aboutButton.tap()
    }

    func clickOnLogOutButton() {
        logOutButton.tap()
    }

    func clickOnResetAppStateButton() {
        resetAppStateButton.tap()
    }

    func clickOnCloseNavButton() {
        // Added a sleep here because there was
        // something funky going on when clicking
        // on the close button from my end.
        // Not the most ideal solution.
        closeButton.tap()
        sleep(1)
    }
}
