//
//  ContactDetailsViewModel.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 25.06.2021.
//

import Foundation
import UIKit

class ContactDetailsViewModel: ContactDetailsViewModelType {
    var contact: ContactDTO
    
    var fullName: String {
        return contact.fullName
    }
    var phone: String {
        return contact.phone
    }
    var email: String {
        return contact.email
    }
    var image: UIImage {
        let imageURL = URL(string: contact.largePicture)
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return UIImage() }
        return UIImage(data: imageData) ?? UIImage()
    }
    func callPhone() {
        if let phoneUrl = URL(string: "telprompt://\(phone)") {
            let application = UIApplication.shared
            if (application.canOpenURL(phoneUrl)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneUrl, options: [:], completionHandler: nil)
                } else {
                    // для версий выше
                    application.openURL(phoneUrl as URL)
                }
            }
        }
    }
    
    func sendEmail(email: String) {
        
    }
    
    init(contact: ContactDTO) {
        self.contact = contact
    }
    
}
