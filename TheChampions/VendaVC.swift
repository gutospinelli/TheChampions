//
//  VendaVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 25/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework

class VendaVC: UIViewController {

    var idJogador = 1
    var jogador = ""
    var valor = "$ 100"
    
    @IBOutlet weak var lblJogador: UILabel!
    @IBOutlet weak var lblValor: UILabel!

    @IBAction func aceitaVenda() {
    }
    @IBAction func recusaVenda() {
        self.dismiss(animated: true, completion: nil)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
