//
//  ContactCellViewModel.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import Foundation
import UIKit

class ContactCellViewModel: ContactCellViewModelType {
    
    var contact: ContactDTO
    
    var textLabel: String {
        return contact.fullName
    }
    var imageUrl: String {
        return contact.smallPicture
    }
    
    init(contact: ContactDTO) {
        self.contact = contact
    }
    
    func setPicture(url: String, imgView: UIImageView) {
        let imageURL = URL(string: url)
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        imgView.image = UIImage(data: imageData)
    }
}
