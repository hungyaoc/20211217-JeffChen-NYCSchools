//
//  SchoolScoreModal.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/18/21.
//

import UIKit

struct SchoolScore: Decodable {
    let dbn :String
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_math_avg_score : String
    let sat_critical_reading_avg_score : String
    let sat_writing_avg_score: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case school_name = "school_name"
        case num_of_sat_test_takers = "num_of_sat_test_takers"
        case sat_math_avg_score = "sat_math_avg_score"
        case sat_critical_reading_avg_score = "sat_critical_reading_avg_score"
        case sat_writing_avg_score = "sat_writing_avg_score"
    }
}
