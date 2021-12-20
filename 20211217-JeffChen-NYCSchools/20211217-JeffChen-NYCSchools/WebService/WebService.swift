//
//  WebService.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/17/21.
//

import UIKit

protocol WebServiceProtocol {
    func downloadSchoolData(completion : @escaping ([SchoolData]) -> ())
    func downloadSchoolScore(completion : @escaping ([SchoolScore]) -> ())
}

class WebService: WebServiceProtocol {
    let schoolListURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
    let schoolScoreURL = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
    
    func downloadSchoolData(completion : @escaping ([SchoolData]) -> ()){
        URLSession.shared.dataTask(with: schoolListURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let schoolArray = try! jsonDecoder.decode([SchoolData].self, from: data)
                
                completion(schoolArray)
            }
        }.resume()
    }
    
    func downloadSchoolScore(completion : @escaping ([SchoolScore]) -> ()){
        URLSession.shared.dataTask(with: schoolScoreURL) { (data, urlResponse, error) in
            if let data = data {
                    
                /*let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [[String: Any]] {
                    completion(responseJSON)
                }*/
                
                let jsonDecoder = JSONDecoder()
                let schoolData = try! jsonDecoder.decode([SchoolScore].self, from: data)
                    completion(schoolData)
            }
        }.resume()
    }
}
