//
//  MovimentacaoTVCell.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 26/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit

class MovimentacaoTVCell: UITableViewCell {

    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblValor: UILabel!
    @IBOutlet weak var lblSaldo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
