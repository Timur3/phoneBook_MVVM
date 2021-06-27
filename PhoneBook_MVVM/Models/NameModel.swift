//
//  Name.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 22.06.2021.
//

import Foundation

struct NameModel: Decodable {
    let surname: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case surname = "first"
        case name = "last"
    }
    
    func fullName() -> String {
        return surname + " " + name
    }
}
