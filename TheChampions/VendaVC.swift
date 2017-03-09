//
//  VendaVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 25/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework
import SCLAlertView

class VendaVC: UIViewController {

    var jogador = ""
    var valor = "$ 100"
    
    @IBOutlet weak var lblJogador: UILabel!
    @IBOutlet weak var lblValor: UILabel!

    @IBAction func aceitaVenda() {
      BaseDados.instance.vendeJogador(chamado: lblJogador.text!)
      self.dismiss(animated: true) {
        SCLAlertView().showSuccess("Informação do Agente", subTitle: "Jogador Vendido")
      }
    }
    @IBAction func recusaVenda() {
      self.dismiss(animated: true) {
        SCLAlertView().showError("Informação do Agente", subTitle: "Desistiu da Venda")
      }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblValor.text = valor
        lblJogador.text = jogador
        
        let colors:[UIColor] = [
            FlatOrange(),
            FlatYellow()
            
        ]
        self.view.backgroundColor = GradientColor(.radial, frame: view.frame, colors: colors)
    }

    
}
