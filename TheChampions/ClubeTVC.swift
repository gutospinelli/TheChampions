//
//  ClubeTVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 26/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit



class ClubeTVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableViewJogadores: UITableView!
    
    var jogadores : [(
        posicao: String,
        nome: String,
        nacionalidadeImg: String,
        overall: String,
        salario: String)] =
        [
            ("GK","GianLuiggi Buffon","🇮🇹","90","310.000"),
            ("DEF","Chiellini","🇮🇹","82","100.000")
        ]
//    
//    var estudoArray : [(materia: String, data: Date, tempo: String)] = [] {
//        didSet {
//            estudoArray.sort { $0.data > $1.data}
//            tblViewEstudoDiario.reloadData()
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewJogadores.delegate = self
        tableViewJogadores.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return jogadores.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jogadorCell", for: indexPath) as! JogadorTVCell
        cell.lblNome.text = jogadores[indexPath.row].nome
        cell.lblOverall.text = jogadores[indexPath.row].overall
        cell.lblPosicao.text = jogadores[indexPath.row].posicao
        cell.lblNacionalidadeImg.text = jogadores[indexPath.row].nacionalidadeImg
        cell.lblSalario.text = jogadores[indexPath.row].salario
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        //cell.lbDesc.text = materias[indexPath.row]
        //cell.lbNum.text = String(indexPath.row + 1)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
