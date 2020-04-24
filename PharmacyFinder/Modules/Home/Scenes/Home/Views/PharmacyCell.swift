//
//  PharmacyCell.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit

class PharmacyCell: UITableViewCell {
    
    
    @IBOutlet weak var labelCompanyName: UILabel!
    @IBOutlet weak var labelCompanyAddress: UILabel!
    @IBOutlet weak var labelCompanyDistrict: UILabel!
    
    var pharmacy: Record? {
        didSet {
            guard let pharmacy = pharmacy else {
                return
            }
            
            self.labelCompanyName.text = pharmacy.localNombre.capitalized
            self.labelCompanyAddress.text = pharmacy.localDireccion.capitalized
            self.labelCompanyDistrict.text = pharmacy.comunaNombre.capitalized
        }
    }
    

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
