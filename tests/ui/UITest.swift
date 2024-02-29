//
//  UITest.swift
//  tests
//
//  Created by Thai Nguyen on 2024-02-23.
//

import Foundation
import XCTest

final class UITest: BaseTest {
    private var purchasedOneItem = 1
    private var purchasedThreeItems = 3

    func testLoginPurchaseFlowStandardUser() throws {
        // This tests logs in with standard user and completes the checkout flow.

        // Perform login with standard_user
        loginScreen.logIntoApp(username: Credentials.standardUser, password: Credentials.password)

        // Click on Nav Side Bar, Reset the App State and Close the Nav Side Bar
        navSideBarScreen.openSideNavBar()
        navSideBarScreen.clickOnResetAppStateButton()
        navSideBarScreen.clickOnCloseNavButton()

        // Adds the first item to the cart and go to cart to checkout
        homeScreen.addToCart(numberOfItems: purchasedOneItem)
        homeScreen.clickOnCart(numberOfItems: String(purchasedOneItem))

        // Click on checkout to checkout
        checkOutScreen.clickCheckout()

        // Goes through checkout flow, fills in first name, last name and zipcode and then continues to the final screen
        checkOutInfoScreen.fillCheckout(firstName: CheckoutUser.firstName, lastName: CheckoutUser.lastName, zipCode: CheckoutUser.zipCode)
        assistUtils.hideKeyboard()
        checkOutInfoScreen.clickContinue()

        // Clicks on finish to finish the check out flow
        checkOutOverviewScreen.clickFinish()

        // Do an assertion to see if the checkout was successful.
        XCTAssertTrue(checkOutCompleteScreen.checkOutSuccessful(), AssertionsMessages.checkOutNotComplete)
    }

    func testLoginPurchaseThreeMostExpensiveItemsStandardUser() throws {
        // This tests logs in with standard user, sorts by highest price to lowest price
        // closes Safari and then logs back in to check if the items are still in the
        // cart.

        // Perform login with standard_user
        loginScreen.logIntoApp(username: Credentials.standardUser, password: Credentials.password)

        // Click on Nav Side Bar, Reset the App State and Close the Nav Side Bar
        navSideBarScreen.openSideNavBar()
        navSideBarScreen.clickOnResetAppStateButton()
        navSideBarScreen.clickOnCloseNavButton()

        // Sort items from highest price to lowest price and adds them to the cart
        homeScreen.sortFromHighestToLowest()
        homeScreen.addToCart(numberOfItems: purchasedThreeItems)

        // Terminate the app
        try tearDownWithError()

        // Open the app again
        try setUpWithError()

        // Log in
        loginScreen.logIntoApp(username: Credentials.standardUser, password: Credentials.password)

        // Assertion to check if the items are still in the cart.
        XCTAssertTrue(homeScreen.checkNumberOfItemsInCart(numberOfItems: String(purchasedThreeItems)), AssertionsMessages.itemsNotInCart)
    }

    func testLoginPurchaseFlowGlitchUser() throws {
        // This tests logs in with performance glitch user and completes the checkout flow.

        // Perform login with performance_glitch_user
        loginScreen.logIntoApp(username: Credentials.performanceUser, password: Credentials.password)

        // Click on Nav Side Bar and then reset the App State and close the Nav Side Bar
        navSideBarScreen.openSideNavBar()
        navSideBarScreen.clickOnResetAppStateButton()
        navSideBarScreen.clickOnCloseNavButton()

        // Adds the first item to the cart and go to cart to checkout
        homeScreen.addToCart(numberOfItems: purchasedOneItem)
        homeScreen.clickOnCart(numberOfItems: String(purchasedOneItem))

        // Click on checkout to checkout
        checkOutScreen.clickCheckout()

        // Goes through checkout flow, fills in first name, last name and zipcode and then continues to the final screen
        checkOutInfoScreen.fillCheckout(firstName: CheckoutUser.firstName, lastName: CheckoutUser.lastName, zipCode: CheckoutUser.zipCode)
        assistUtils.hideKeyboard()
        checkOutInfoScreen.clickContinue()

        // Clicks on finish to finish the check out flow
        checkOutOverviewScreen.clickFinish()

        // Do an assertion to see if the checkout was successful.
        XCTAssertTrue(checkOutCompleteScreen.checkOutSuccessful(), AssertionsMessages.checkOutNotComplete)
    }

    func testLoginLockedUser() throws {
        // This test is expected to fail because the user we're logging in with locked.
        // Assuming we have this assumption, to make this test "pass", we are expecting that the error that the
        // user has been locked out of their account. So we do a check that this is true.

        // Perform login with locked_out_user
        loginScreen.logIntoApp(username: Credentials.lockedUser, password: Credentials.password)

        // Since this test is expected to "fail", we want to do a check if the user is locked out or not,
        // so we do an assertion this user has been locked out or not.
        XCTAssertTrue(loginScreen.checkLockedUser(), AssertionsMessages.notLockedUser)
    }

    func testLoginPurchaseFlowProblemUser() throws {
        // This test is expected to fail as well because there is a "problem" with
        // this user. When we get to the check out screen and we try to type into
        // last name, we notice that the first name textbox is getting filled in
        // instead of the last name. Assuming that we know this and this is expected
        // for this user, we will do an assertion to check for the error message for
        // last name so this test "passes"

        // Perform login with problem_user
        loginScreen.logIntoApp(username: Credentials.problemUser, password: Credentials.password)

        // Click on Nav Side Bar, Reset the App State and Close the Nav Side Bar
        navSideBarScreen.openSideNavBar()
        navSideBarScreen.clickOnResetAppStateButton()
        navSideBarScreen.clickOnCloseNavButton()

        // Adds the first item to the cart and go to cart to checkout
        homeScreen.addToCart(numberOfItems: purchasedOneItem)
        homeScreen.clickOnCart(numberOfItems: String(purchasedOneItem))

        // Click on checkout to checkout
        checkOutScreen.clickCheckout()

        // Goes through checkout flow, fills in first name, last name and zipcode and attempts to go to the final screen
        checkOutInfoScreen.fillCheckout(firstName: CheckoutUser.firstName, lastName: CheckoutUser.lastName, zipCode: CheckoutUser.zipCode)
        assistUtils.hideKeyboard()
        checkOutInfoScreen.clickContinue()

        // As expected, we can't get to the final screen so we do an assertion to see that last name was not filled in properly
        XCTAssertTrue(checkOutInfoScreen.validateLastNameErrorMessage(), AssertionsMessages.notProblemUser)
    }
}
