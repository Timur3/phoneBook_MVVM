//
//  ApiServiceType.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 25.06.2021.
//

import Foundation
protocol ContactsServiceType {
    func getContacts(completion: @escaping ([ContactDTO]) -> ())
}
