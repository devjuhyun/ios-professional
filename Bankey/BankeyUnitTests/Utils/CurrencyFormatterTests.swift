//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Juhyun Yun on 2023/06/30.
//

import Foundation

import XCTest

@testable import Bankey // Bankey 폴더에 있는 정보들을 import

// Unit Test
// 1. 유닛 테스트는 코드 디자인에 영향을 준다.
// 2. 유닛 테스트는 테스트로 실행 가능한 문서이다.
// 3. Continuous integration process의 한 부분이다.
class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    // This function gets called once per test
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466)
        XCTAssertEqual(result, "$929,466.00")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
    }
}
