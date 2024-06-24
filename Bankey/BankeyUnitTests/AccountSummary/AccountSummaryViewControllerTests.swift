//
//  AccountSummaryViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by 이승민 on 6/24/24.
//

import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
        // vc.loadViewIfNeeded()
        
        mockManager = MockProfileManager()
        vc.profileManager = mockManager
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("서버 오류", titleAndMessage.0)
        XCTAssertEqual("요청을 처리할 수 없습니다. 다시 시도하십시오.", titleAndMessage.1)
    }
    
    func testTitleAndMessageForNetworkError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("네트워크 오류", titleAndMessage.0)
        XCTAssertEqual("인터넷에 연결되었는지 확인하십시오. 다시 시도하십시오.", titleAndMessage.1)
    }
    
    func testAlertForServerError() throws {
        mockManager.error = NetworkError.serverError
        vc.forceFetchProfile()
        
        XCTAssertEqual("서버 오류", vc.errorAlert.title)
        XCTAssertEqual("요청을 처리할 수 없습니다. 다시 시도하십시오.", vc.errorAlert.message)
    }
    
    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        vc.forceFetchProfile()
        
        XCTAssertEqual("네트워크 오류", vc.errorAlert.title)
        XCTAssertEqual("인터넷에 연결되었는지 확인하십시오. 다시 시도하십시오.", vc.errorAlert.message)
    }
}
