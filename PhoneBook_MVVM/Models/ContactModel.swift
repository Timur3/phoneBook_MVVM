//
//  Employee.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 22.06.2021.
//

import Foundation

struct ContactModel: Decodable {
    let name: NameModel
    let email, phone : String
    let picture: Picture
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case phone = "phone"
        case picture = "picture"
    }
}
