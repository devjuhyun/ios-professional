//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Juhyun Yun on 2023/07/12.
//

import Foundation
import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {

    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }

    func testLong() throws {
        // 🕹
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws {
        // 🕹
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }

    func testValidLong() throws {
        // 🕹
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("A"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("a"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("A"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("\\"))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("a"))
    }
    
}
