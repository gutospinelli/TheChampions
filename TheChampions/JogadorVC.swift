//
//  JogadorVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 25/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework

class JogadorVC: UIViewController {

    
    @IBOutlet weak var lblJogador: UILabel!
    @IBOutlet weak var lblPosicao: UILabel!
    @IBOutlet weak var lblValorChute: UILabel!
    @IBOutlet weak var lblValorPasse: UILabel!
    @IBOutlet weak var lblValorDefesa: UILabel!
    @IBOutlet weak var lblSpecial: UILabel!
    @IBOutlet weak var lblSalario: UILabel!
    @IBOutlet weak var lblValorMercado: UILabel!
    @IBOutlet weak var lblNacionalidadeImg: UILabel!
    @IBOutlet weak var lblGols: UILabel!
    @IBOutlet weak var lblAssistencias: UILabel!
    @IBOutlet weak var lblValorOverall: UILabel!
    @IBOutlet weak var imgJogador: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colors:[UIColor] = [
            FlatLime(),
            FlatMint()
        ]
        self.view.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showSellPopover":
                if let vc = segue.destination as? VendaVC {
                    vc.jogador = lblJogador.text!
                    vc.valor = lblValorMercado.text!
                    //TODO: Pegar o ID CORRETO
                    vc.idJogador = 1
                }
            default:
                break
            }
        }
    }


}
