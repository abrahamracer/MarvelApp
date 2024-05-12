//
//  CharFavoriteCell.swift
//  MarvelApp
//
//  Created by Abraham Valderrabano Vega on 10/05/24
//

import UIKit

class CharFavoriteCell: UITableViewCell {
    
    
    @IBOutlet weak var charName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
