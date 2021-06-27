//
//  ContactDetailsViewModelType.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import Foundation
import UIKit

protocol ContactDetailsViewModelType {
    var fullName: String { get }
    var phone: String { get }
    var email: String { get }
    var image: UIImage { get }
    func callPhone()
    func sendEmail(email: String)
    
}

