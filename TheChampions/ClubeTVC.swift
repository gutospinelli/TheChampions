//
//  ClubeTVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 26/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

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
  @IBOutlet weak var btnJogar: UIButton!
  @IBOutlet weak var btnConquistas: UIButton!
  @IBOutlet weak var line1: UILabel!
  @IBOutlet weak var line2: UILabel!
  @IBOutlet weak var line3: UILabel!
  
  // MARK: - Carregamento VC
  var jogadores : [Jogador] = []
  var realm = try! Realm()
  var clubeJogador = "Real Madrid"
  var qtd = 0
  var corPrincipal = FlatWhite()
  var corSecundaria = FlatBlack()
  var corTexto = FlatBlue()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      tableViewJogadores.delegate = self
      tableViewJogadores.dataSource = self
      //Pega o clube do jogador da tabela de configuracao
      if let config = realm.objects(Config.self).first {
        clubeJogador = config.clubeUsuario
      }
      
      let filtro = "name = '" + clubeJogador + "'"
      if let clubeAtual = realm.objects(Clube.self).filter(filtro).first {
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
        
        corPrincipal = HexColor(clubeAtual.corPrincipal)!
        corSecundaria = HexColor(clubeAtual.corSecundaria)!
        corTexto = ContrastColorOf(corPrincipal, returnFlat: true)

        //Muda fundos
        self.view.backgroundColor = corPrincipal
        tableViewJogadores.backgroundColor = corPrincipal
        //Muda a cor de todos os textos
        for v in self.view.subviews {
          if v.isKind(of: UILabel.self) {
            let lab : UILabel = v as! UILabel
            lab.textColor = corTexto
          }
        }
        //Muda quem deve ter cor secundária
        lblNomeClube.textColor = corSecundaria
        line1.textColor = corSecundaria
        line2.textColor = corSecundaria
        line3.textColor = corSecundaria
        //Muda cor dos botões
        btnJogar.tintColor = corTexto
        btnConquistas.tintColor = corTexto
      
      }


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
    
      cell.backgroundColor = corPrincipal
      cell.lblNome.textColor = corTexto
      cell.lblOverall.textColor = corTexto
      cell.lblPosicao.textColor = corTexto
      cell.lblNacionalidadeImg.textColor = corTexto
      cell.lblSalario.textColor =  corTexto
      
      
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
