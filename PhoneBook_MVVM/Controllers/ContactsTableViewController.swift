//
//  MainListTableViewController.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    private var contactsViewModel: ContactsViewModel!
    private var searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let str = searchController.searchBar.text else { return false }
        return str.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contacts"
        configuration()
        callViewModels()
    }

    private func configuration() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {

        }
        definesPresentationContext = true
    }
    
    private func callViewModels() {
        contactsViewModel = ContactsViewModel()
        contactsViewModel.bindContactsViewModelToController = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactsViewModel.numbersOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.identifier, for: indexPath) as? ContactsTableViewCell
        guard let tableCell = cell else { return UITableViewCell() }
        tableCell.cellViewModel = contactsViewModel.getContactCellViewModel(for: indexPath)
        return tableCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewModel = contactsViewModel else { return }
        viewModel.selectRow(for: indexPath)
        performSegue(withIdentifier: EnumSegues.contactDetails.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
              let viewModel = contactsViewModel else { return }
        if identifier == EnumSegues.contactDetails.rawValue {
            if let vc = segue.destination as? ContactDetailsViewController {
                vc.contactDetailsViewModel = viewModel.getContactDetailsViewVodel()
            }
        }
    }
}

// MARK: - SEARCH
extension ContactsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if (!searchBarIsEmpty) {
            filterContent(searchController.searchBar.text!)
        } else {
            contactsViewModel.searchStop()
        }
    }
    private func filterContent(_ searchText: String)
    {
        contactsViewModel.filterContent(searchText: searchText)
    }
    
}
