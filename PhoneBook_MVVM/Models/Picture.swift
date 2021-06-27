//
//  Picture.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 22.06.2021.
//

import Foundation

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case large = "large"
        case medium = "medium"
        case thumbnail = "thumbnail"
    }
}
