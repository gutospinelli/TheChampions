//
//  FinancasVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 26/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework

class FinancasVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableViewFinancas: UITableView!

  var movimentacaoFinanceira : [MovimentoFinanceiro] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let clubeAtual =  BaseDados.instance.clubeJogador!
    
    movimentacaoFinanceira = Array(clubeAtual.historicoFinanceiro)
    
    let corPrincipal = HexColor(clubeAtual.corPrincipal)!
    //let corSecundaria = HexColor(clubeAtual.corSecundaria)!
    let corTexto = ContrastColorOf(corPrincipal, returnFlat: true)
    
    //Muda fundos
    self.view.backgroundColor = corPrincipal
    tableViewFinancas.backgroundColor = corPrincipal
    //Muda a cor de todos os textos
    for v in self.view.subviews {
      if v.isKind(of: UILabel.self) {
        let lab : UILabel = v as! UILabel
        lab.textColor = corTexto
      }
    }
  }

  
  // MARK: - TableView
  
  func numberOfSections(in tableView: UITableView) -> Int {
      return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return movimentacaoFinanceira.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "movimentacaoFinanceiraCell", for: indexPath) as! MovimentacaoTVCell
      cell.lblNome.text = movimentacaoFinanceira[indexPath.row].nomeEvento
      cell.lblValor.text = "\(movimentacaoFinanceira[indexPath.row].movimento)"
      cell.lblSaldo.text = "\(movimentacaoFinanceira[indexPath.row].saldo)"

      return cell
  }

}
