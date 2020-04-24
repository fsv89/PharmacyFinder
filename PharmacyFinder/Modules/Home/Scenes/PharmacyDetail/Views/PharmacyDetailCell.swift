//
//  PharmacyDetailCell.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 24-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class PharmacyDetailCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
