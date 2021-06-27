//
//  MainListViewModel.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import Foundation
class ContactsViewModel: ContactsViewModelType {
    var selectedIndexPath: IndexPath?
    
    var filtering: Bool = false {
        willSet(value) {
            if !value {
                self.bindContactsViewModelToController()
            }
        }
    }
    private let api: ContactsServiceType?
    
    var contacts: [ContactDTO]? {
        didSet {
            self.bindContactsViewModelToController()
        }
    }
    var filteredContacts: [ContactDTO]? {
        didSet {
            self.bindContactsViewModelToController()
        }
    }
    
    func numbersOfRows() -> Int {
        debugPrint()
        return filtering ? filteredContacts?.count ?? 0 : contacts?.count ?? 0
    }
    
    var bindContactsViewModelToController: (()->()) = {}
    
    init() {
        self.api = RandomContactsService()
        getContacts()
    }
    
    func getContacts() {
        self.api?.getContacts(completion: { (data) in
            self.contacts = data
        })
    }
    
    func getContactCellViewModel(for indexPath: IndexPath) -> ContactCellViewModelType {
        let index = indexPath.row
        let data = filtering ? filteredContacts![index] : contacts![index]
        return ContactCellViewModel(contact: data)
    }
    
    func getContactDetailsViewVodel() -> ContactDetailsViewModelType? {
        guard let index = selectedIndexPath else { return nil }
        let data = filtering ? filteredContacts![index.row] : contacts![index.row]
        return ContactDetailsViewModel(contact: data)
    }
    
    func selectRow(for indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    private func filter(searchText: String) {
        guard let contacts = contacts else { return }
        let filteredContacts = contacts.filter({ (contact: ContactDTO) -> Bool in
            return contact.fullName.lowercased().contains(searchText.lowercased())
        })
        self.filteredContacts =  filteredContacts
    }
    
    func searchStop() {
        filtering = false
    }
    
    func filterContent(searchText: String){
        filtering = true
        filter(searchText: searchText)
    }
}
