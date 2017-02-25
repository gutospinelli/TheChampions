//
//  ClubeTableVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 25/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit

class ClubeTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var materias = ["DAD", "DCO","CEX","AFO","AUD","RLQ","ING","INFO","POR","TRIB","CONTB","CIVIL","LEG","LICIT","PENAL","TI"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jogadorCell", for: indexPath) as! JogadorTVCell
            cell.lblNome.text = "GianLuiggi Buffon"
            cell.lblOverall.text = "90"
            cell.lblPosicao.text = "GK"
            cell.lblNacionalidadeImg.text = "🇮🇹"
            cell.lblSalario.text = "200.000"

        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        //cell.lbDesc.text = materias[indexPath.row]
        //cell.lbNum.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materias.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            switch identifier {
            case "mostraDetalheJogador":
                segue.destination.hidesBottomBarWhenPushed =  true
            default:
                segue.destination.hidesBottomBarWhenPushed =  true
            }
        }

    }
    
}
