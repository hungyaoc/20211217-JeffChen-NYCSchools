//
//  MockWebService.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/19/21.
//

import XCTest
@testable import _0211217_JeffChen_NYCSchools

class MockWebService: WebServiceProtocol {
    func downloadSchoolData(completion : @escaping ([SchoolData]) -> ())
    {
        let data = SchoolData(dbn:"1234",
                              school_name: "ABC",
                              overview_paragraph: "Simple test",
                              location: "NY",
                              phone_number: "123")
        completion([data])
    }
    
    func downloadSchoolScore(completion : @escaping ([SchoolScore]) -> ())
    {
        let data = SchoolScore(dbn: "01M292",
                               school_name: "ABC",
                               num_of_sat_test_takers: "100",
                               sat_math_avg_score: "200",
                               sat_writing_avg_score: "300")
        completion([data])
    }
}
