//
//  ClubeTVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 26/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import RealmSwift



class ClubeTVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

  // MARK: - Outlets
  @IBOutlet weak var tableViewJogadores: UITableView!
  @IBOutlet weak var lblNomeClube: UILabel!
  @IBOutlet weak var lblNomeClubeCasa: UILabel!
  @IBOutlet weak var lblPaisClubeCasa: UILabel!
  @IBOutlet weak var lblNomeClubeFora: UILabel!
  @IBOutlet weak var lblPaisClubeFora: UILabel!
  @IBOutlet weak var lblEstadio: UILabel!
  @IBOutlet weak var lblCapacidadeEstadio: UILabel!
  @IBOutlet weak var lblTecnico: UILabel!
  @IBOutlet weak var lblTemporada: UILabel!
  @IBOutlet weak var lblValorCaixa: UILabel!
  @IBOutlet weak var lblValorSalarios: UILabel!
  @IBOutlet weak var lblPontos: UILabel!
  @IBOutlet weak var lblPosicao: UILabel!
  
  // MARK: - Carregamento VC
  var jogadores : [Jogador] = []
  var realm = try! Realm()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewJogadores.delegate = self

        tableViewJogadores.dataSource = self
      
      if BaseDados.instance.jogadores.count == 0 {
        BaseDados.instance.deleteAllDatabase()
        BaseDados.instance.clubes.append(BaseDados.instance.createBarca())
        BaseDados.instance.clubes.append(BaseDados.instance.createReal())
        BaseDados.instance.startTemporada(inicioEm: 2017, participantes: BaseDados.instance.clubes)
      }
      
      let results = realm.objects(Clube.self).filter("name = 'Barcelona FC'")
      let clubeAtual = results[0]
      jogadores = Array(clubeAtual.elenco)
      lblNomeClube.text = clubeAtual.name
      lblNomeClubeCasa.text = clubeAtual.name
      lblEstadio.text = clubeAtual.estadio?.nome
      let capacidade : Int = (clubeAtual.estadio?.assentos)!
      lblCapacidadeEstadio.text = "\(capacidade)"
      lblTecnico.text = clubeAtual.tecnico
      lblValorCaixa.text = "\(clubeAtual.valorCaixa)"
      let somaSalarios : Int = clubeAtual.elenco.sum(ofProperty: "salario")
      lblValorSalarios.text = "\(somaSalarios)"
      
      //lblPosicao.text = "\(clubeAtual.posicaoTemporadaAtual?.posicao)"
      //lblPontos.text = "\(clubeAtual.posicaoTemporadaAtual?.pontos)"

    }


    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jogadores.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jogadorCell", for: indexPath) as! JogadorTVCell
        cell.lblNome.text = jogadores[indexPath.row].nome
        cell.lblOverall.text = "\(jogadores[indexPath.row].overall)"
        cell.lblPosicao.text = jogadores[indexPath.row].posicao
        cell.lblNacionalidadeImg.text = jogadores[indexPath.row].nacionalidade
        cell.lblSalario.text =  "\(jogadores[indexPath.row].salario)"
        return cell
    }

    
    // MARK: - Navigation
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
