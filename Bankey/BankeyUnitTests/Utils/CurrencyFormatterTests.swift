//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by 이승민 on 5/27/24.
//

import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() { // 단위 테스트를 실행할 때마다
        super.setUp()
        
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466") // 결과의 첫 번째 값(달러 부분)이 예상 값과 같은지 확인
        XCTAssertEqual(result.1, "23") // 결과의 두 번째 값(센트 부분)이 예상 값과 같은지 확인
    }
    
    func testBreakZeroDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(0.00)
        XCTAssertEqual(result.0, "0")
        XCTAssertEqual(result.1, "00")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")
    }

    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }

    /*
     CurrencyFormatter에서 지역 하드코딩 안해줬을 때 통화기호 유연하게 테스트
     
     func testDollarsFormattedWithCurrencySymbol() throws {
         let locale = Locale.current
         let currencySymbol = locale.currencySymbol!
         
         let result = formatter.dollarsFormatted(929466.23)
         XCTAssertEqual(result, "\(currencySymbol)929,466.23")
     }
     */
}
