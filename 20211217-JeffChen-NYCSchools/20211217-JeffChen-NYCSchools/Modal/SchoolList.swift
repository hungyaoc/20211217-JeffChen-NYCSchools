//
//  SchoolDataModal.swift
//  20211217-JeffChen-NYCSchools
//
//  Created by Jeff Chen on 12/18/21.
//

import UIKit

struct SchoolData: Decodable {
    let dbn :String
    let school_name: String
    let overview_paragraph, location, phone_number: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case school_name = "school_name"
        case overview_paragraph = "overview_paragraph"
        case location = "location"
        case phone_number = "phone_number"
    }
}

