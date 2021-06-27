//
//  ResponseModel.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 22.06.2021.
//

import Foundation

struct ResponseModel: Decodable {
    let contacts: [ContactModel]
    let info: Info
    
    enum CodingKeys: String, CodingKey {
        case contacts = "results"
        case info = "info"
    }
}
