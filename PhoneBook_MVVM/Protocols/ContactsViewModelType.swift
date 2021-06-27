//
//  MainListViewModelType.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import Foundation
protocol ContactsViewModelType {
    var filtering: Bool { get }
    var contacts: [ContactDTO]? { get }
    var filteredContacts: [ContactDTO]? { get }
    
    func numbersOfRows() -> Int
    func getContactCellViewModel(for indexPath: IndexPath) -> ContactCellViewModelType
    func getContactDetailsViewVodel() -> ContactDetailsViewModelType?
    func selectRow(for indexPath: IndexPath)
    func filterContent(searchText: String)
    func searchStop()
}
