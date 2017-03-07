//
//  EstadioVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 03/03/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework

class EstadioVC: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var lblAssentos: UILabel!
  @IBOutlet weak var lblEstadio: UILabel!
  @IBOutlet weak var lblOcupacao: UILabel!
  @IBOutlet weak var lblValorIngresso: UILabel!
  @IBOutlet weak var lblManutencao: UILabel!
  
  // MARK: Carregamento
  override func viewDidLoad() {
      super.viewDidLoad()

    let colors:[UIColor] = [
      FlatLime(),
      FlatMint()
    ]
    self.view.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)
    
    let stade = BaseDados.instance.clubeJogador!.estadio!
    lblAssentos.text = "\(stade.assentos)"
    lblEstadio.text = stade.nome
    lblOcupacao.text = "\(stade.ocupacaoMedia)"
    lblManutencao.text = "Manutenção $" + "\(stade.custoManutencao)"
    lblValorIngresso.text = "\(stade.valorIngresso)"
  }
  
  // MARK: Metodos
  @IBAction func aumentaValorIngresso(_ sender: UIButton) {
    let novoValor = BaseDados.instance.aumentaIngresso(do: lblEstadio.text!, valorAtual: Int(lblValorIngresso.text!)!)
    lblValorIngresso.text = "\(novoValor)"
  }
  @IBAction func diminuiValorIngresso(_ sender: UIButton) {
    let novoValor = BaseDados.instance.diminuiIngresso(do: lblEstadio.text!, valorAtual: Int(lblValorIngresso.text!)!)
    lblValorIngresso.text = "\(novoValor)"
  }
  @IBAction func aumentaCapacidadeAssentos(_ sender: UIButton) {
    let novoValor = BaseDados.instance.constroiArquibancada(do: lblEstadio.text!)
    lblAssentos.text = "\(novoValor)"
  }


}
