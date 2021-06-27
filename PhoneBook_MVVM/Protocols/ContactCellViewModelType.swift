//
//  MainListCellViewModelType.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import Foundation
import UIKit

protocol ContactCellViewModelType: class {
    var textLabel: String { get  }
    var imageUrl: String { get }
    func setPicture(url: String, imgView: UIImageView)
}
