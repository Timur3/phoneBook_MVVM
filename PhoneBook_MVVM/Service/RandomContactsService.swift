//
//  ApiService.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 22.06.2021.
//

import Foundation

class RandomContactsService: ContactsServiceType {
    private let url = URL(string: "https://randomuser.me/api/?results=1000")!
    
    func getContacts(completion: @escaping ([ContactDTO]) -> ()) {
        getData { (data) in
            let contacts = data.contacts.map { ContactDTO(fullName: $0.name.fullName(), phone: $0.phone, email: $0.email, smallPicture: $0.picture.thumbnail, largePicture: $0.picture.large)}
            completion(contacts)
        }
    }
       
    private func getData(completion : @escaping (ResponseModel) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(ResponseModel.self, from: data)
                completion(empData)
            }
            
        }.resume()
    }
}
