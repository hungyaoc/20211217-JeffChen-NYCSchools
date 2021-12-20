//
//  _0211217_JeffChen_NYCSchoolsTests.swift
//  20211217-JeffChen-NYCSchoolsTests
//
//  Created by Jeff Chen on 12/17/21.
//

import XCTest
@testable import _0211217_JeffChen_NYCSchools

class _0211217_JeffChen_NYCSchoolsTests: XCTestCase {
    
    var viewModal: SchoolViewModal!
    var mockWebService: MockWebService!
    
    override func setUp() {
        mockWebService = MockWebService()
        viewModal = .init(webService: mockWebService)
    }
    
    func testViewModalWithSuccessSchoolList() {
        viewModal.getSchoolFromURL(completion: {(modalArray:[[String:Any]]) in
            XCTAssertTrue(modalArray != nil)
        })
    }
    
    func testViewModalWithSuccessSchoolScore() {
        viewModal.getSchoolFromURL(completion: {(modalArray:[[String:Any]]) in
            XCTAssertTrue(modalArray != nil)
        })
    }
}
