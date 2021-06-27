//
//  DetailsContactViewController.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func sendEmail(_ sender: Any) {
    }
    
    var contactDetailsViewModel: ContactDetailsViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contact details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let cdvm = contactDetailsViewModel else { return }
        self.fullNameLabel.text = cdvm.fullName
        self.phoneLabel.text = cdvm.phone
        self.emailLabel.text = cdvm.email
        DispatchQueue.main.async {
            self.avatarImgView.image = cdvm.image
        }
    }
    
    @IBAction func callPhone(_ sender: UIButton) {
        guard let vm = contactDetailsViewModel else { return }
        vm.callPhone()
    }
}
