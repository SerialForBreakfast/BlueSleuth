//
//  BTTableViewCell.swift
//  BlueSleuth
//
//  Created by Joseph McCraw on 4/23/19.
//  Copyright © 2019 Joseph McCraw. All rights reserved.
//

import UIKit

class BTTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var RSSILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
