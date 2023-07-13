//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Juhyun Yun on 2023/07/12.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }

    /*
     if shouldResetCriteria {
         // Inline validation (✅ or ⚪️)
     } else {
         ...
     }
     
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // loss of focus
    }
    
    /*
     if shouldResetCriteria {
     ...
     } else {
     // Focus lost (✅ or ❌)
     }
     */
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        // 🕹 Ready Player1
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        // 🕹 Ready Player1
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // ❌
    }
}

class PasswordStatusViewTests_Validate_Three_Of_Four: XCTestCase {

    var statusView: PasswordStatusView!
    let oneCriteriaMet = "12345678"
    let twoCriteriaMet = "12345678a"
    let threeCriteriaMet = "12345678aA"
    let fourCriteriaMet = "12345678aA!"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }
    
    func testOneCriteriaMet() throws {
        XCTAssertFalse(statusView.validate(oneCriteriaMet))
    }
    
    func testTwoCriteriaMet() throws {
        XCTAssertFalse(statusView.validate(twoCriteriaMet))
    }
    
    func testThreeCriteriaMet() throws {
        XCTAssertTrue(statusView.validate(threeCriteriaMet))
    }
    
    func testFourCriteriaMet() throws {
        XCTAssertTrue(statusView.validate(fourCriteriaMet))
    }
}
