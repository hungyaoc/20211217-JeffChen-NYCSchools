//
//  SchoolViewModal.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/18/21.
//

import UIKit

class SchoolViewModal: NSObject {
    private var webService : WebServiceProtocol!

    private(set) var modalData : [String:Any]! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    // work for both WebService and MockWebService .. design for testing
    init(webService : WebServiceProtocol = WebService()) {
        super.init()
        self.webService = webService
    }
    
    // get school list from URL
    public func getSchoolFromURL(completion : @escaping ([SchoolData]) -> ()) {
        self.webService.downloadSchoolData(completion: {
            (modalArray:[SchoolData]) in
            completion(modalArray)
        })
    }
    
    // get school score from URL
    public func getScoreFromURL(completion : @escaping ([SchoolScore]) -> ()) {
        self.webService.downloadSchoolScore(completion: {
            (modalArray:[SchoolScore]) in
            completion(modalArray)
        })
    }
}
