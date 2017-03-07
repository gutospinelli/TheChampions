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
  var corPrincipal = FlatWhite()
  var corTexto = FlatRed()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    carregaDados()

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    carregaDados()
    tableViewFinancas.reloadData()
  }
  
  func carregaDados() {
    let clubeAtual =  BaseDados.instance.clubeJogador!
    movimentacaoFinanceira = Array(clubeAtual.historicoFinanceiro)
    
    corPrincipal = HexColor(clubeAtual.corPrincipal)!
    corTexto = ContrastColorOf(corPrincipal, returnFlat: true)
    
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
    
    let mov = NSDecimalNumber(decimal: Decimal(movimentacaoFinanceira[indexPath.row].movimento))
    let saldo = NSDecimalNumber(decimal: Decimal(movimentacaoFinanceira[indexPath.row].saldo))
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.locale = Locale(identifier: "en_US")
    
    cell.lblValor.text = numberFormatter.string(from: mov)
    cell.lblSaldo.text = numberFormatter.string(from: saldo)
    

    
    cell.backgroundColor = corPrincipal
    cell.lblNome.textColor = corTexto
    cell.lblValor.textColor = corTexto
    cell.lblSaldo.textColor = corTexto


      return cell
  }

}
