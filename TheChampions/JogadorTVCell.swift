//
//  JogadorTVCell.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 25/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit

class JogadorTVCell: UITableViewCell {

    
    @IBOutlet weak var lblPosicao: UILabel!
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblNacionalidadeImg: UILabel!
    @IBOutlet weak var lblOverall: UILabel!
    @IBOutlet weak var lblSalario: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
