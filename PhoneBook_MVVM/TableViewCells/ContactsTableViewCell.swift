//
//  MainListTableViewCell.swift
//  PhoneBook_MVVM
//
//  Created by Timur on 24.06.2021.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtLabel: UILabel!
    static let identifier = "contactCell"
    
    fileprivate var img: UIImage? {
        get {
            return imgView.image
        }
        set {
            imgView.image = newValue
            imgView.sizeToFit()
        }
    }
    
    weak var cellViewModel: ContactCellViewModelType? {
        willSet(model) {            
            guard let model = model else { return }
            txtLabel.text = model.textLabel
            DispatchQueue.main.async {
                model.setPicture(url: model.imageUrl, imgView: self.imgView!)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        guard let image = imgView else { return }
        image.layer.cornerRadius = image.frame.height/2
        image.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
