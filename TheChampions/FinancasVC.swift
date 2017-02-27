//
//  FinancasVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 26/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit

class FinancasVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewFinancas: UITableView!
    
    var movimentacaoFinanceira : [(
        nome: String,
        valor: Int,
        saldo: Int)] =
        [
            ("Início Carreira",0,200000),
            ("Ingressos Man Untd vs Leicester",20000,220000),
            ("Salários",-15000,205000),
            ("Transferência Venda Ibra",500000,720000),
            ("Transferência Compra Pogba",-300000,420000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movimentacaoFinanceira.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movimentacaoFinanceiraCell", for: indexPath) as! MovimentacaoTVCell
        cell.lblNome.text = movimentacaoFinanceira[indexPath.row].nome
        cell.lblValor.text = "\(movimentacaoFinanceira[indexPath.row].valor)"
        cell.lblSaldo.text = "\(movimentacaoFinanceira[indexPath.row].saldo)"

        return cell
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
