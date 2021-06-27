//
//  Info.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 22.06.2021.
//

import Foundation

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}
