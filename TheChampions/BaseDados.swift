//
//  BaseDados.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 02/03/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift
import ChameleonFramework

class BaseDados {

  static let instance = BaseDados()
  
  var jogadores : [Jogador] = []
  var clubes : [Clube] = []
  var clubeJogador : Clube? = nil
  let realm = try! Realm()
  
  func deleteAllDatabase() {
    try! realm.write {
      realm.deleteAll()
    }
  }
  
  func startTemporada(inicioEm ano: Int, participantes equipes: [Clube]) {
    let t = Temporada()
    t.ano = ano
    
    let tabela = TabelaClassificacao()
    tabela.temporada = t
    
    for equipe in equipes {
      let p = PosicaoTabela()
      p.equipe = equipe
      p.temporada = t
      tabela.classificacao.append(p)
    }
    
    do {
      //let realm = try Realm()
      try! realm.write {
        realm.add(tabela)
      }
    }
  }
  
  func escolherClube(jogarCom clube: String) {
    do
    {
      //let realm = try Realm()
      let configuracaoJogo = realm.objects(Config.self)
      
      //Neste caso não há configuração, precisamos criá-la
      if configuracaoJogo.count == 0 {
        let c = Config()
        c.clubeUsuario = clube
        try! realm.write {
          realm.add(c)
        }
      } else { //Se temos, só mudamos para o clube escolhido
        try! realm.write {
          configuracaoJogo[0].clubeUsuario = clube
        }
      }
      let filtro = "name = '" + clube + "'"
      clubeJogador = realm.objects(Clube.self).filter(filtro).first
    }
  }
  
  func aumentaIngresso(do estadioNome: String, valorAtual ingresso: Int) -> Int {
    let filtro = "nome = '" + estadioNome + "'"
    let estadio = realm.objects(Estadio.self).filter(filtro).first
    try! realm.write {
      estadio?.valorIngresso = estadio!.valorIngresso + 1
    }
    return estadio!.valorIngresso
  }
  
  func diminuiIngresso(do estadioNome: String, valorAtual ingresso: Int) -> Int {
    let filtro = "nome = '" + estadioNome + "'"
    let estadio = realm.objects(Estadio.self).filter(filtro).first
    try! realm.write {
      estadio?.valorIngresso = estadio!.valorIngresso - 1
    }
    return estadio!.valorIngresso
  }
  
  func constroiArquibancada(do estadioNome: String) -> Int {
    let filtro = "nome = '" + estadioNome + "'"
    let estadio = realm.objects(Estadio.self).filter(filtro).first
    let movimentacao = MovimentoFinanceiro()
    movimentacao.dataEvento = Date()
    movimentacao.movimento = -100000
    movimentacao.nomeEvento = "Construção arquibancada"
    movimentacao.saldo = (estadio!.clube.first?.valorCaixa)! - 100000
    
    try! realm.write {
      estadio?.assentos = estadio!.assentos + 5000
      estadio!.clube.first?.valorCaixa -= 100000
      estadio!.clube.first?.historicoFinanceiro.append(movimentacao)
    }
    return estadio!.assentos
  }
  
  func vendeJogador(chamado nome: String) {
    let filtro = "nome = '" + nome + "'"
    let jogador = realm.objects(Jogador.self).filter(filtro).first
    let clube = BaseDados.instance.clubeJogador
    let index = clube?.elenco.index(of: jogador!)
    let movimentacao = MovimentoFinanceiro()
    movimentacao.dataEvento = Date()
    movimentacao.movimento = jogador!.valor
    movimentacao.nomeEvento = "Venda do " + jogador!.nome
    movimentacao.saldo = clube!.valorCaixa + jogador!.valor
    try! realm.write {
      clube?.valorCaixa += jogador!.valor
      clube?.elenco.remove(objectAtIndex: index!)
      clube?.historicoFinanceiro.append(movimentacao)
    }
    
  }
  
  func retornaJogador(chamado nome: String) -> Jogador {
    let filtro = "nome = '" + nome + "'"
    return realm.objects(Jogador.self).filter(filtro).first!
  }
  
  func readJson(json arquivo:String) -> [[Any]] {
    do {
      if let file = Bundle.main.url(forResource: arquivo, withExtension: "json") {
        let data = try Data(contentsOf: file)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        if let object = json as? [[Any]] {
          return object //se transformou, retorna
        } else {
          print("JSON is invalid")
        }
      } else {
        print("no file")
      }
    } catch {
      print(error.localizedDescription)
    }
    return [[]] //Se deu pau, retorna um array vazio
  }
  
  func createBarca() -> Clube {
    
    let e = Estadio()
    e.nome = "Camp Nou"
    e.assentos = 99354
    e.custoManutencao = 200000
    e.valorIngresso = 15
    
    let c = Clube()
    c.name = "Barcelona FC"
    c.tecnico = "Luis Henrique"
    c.valorCaixa = 24500000
    c.estadio = e

    c.corPrincipal = FlatBlueDark().hexValue()
    c.corSecundaria = FlatRed().hexValue()
    
    
    let m = MovimentoFinanceiro()
    m.dataEvento = Date()
    m.nomeEvento = "Valor Inicio Carreira"
    m.saldo = c.valorCaixa
    m.movimento = c.valorCaixa
    c.historicoFinanceiro.append(m) //associa histórico ao clube
  
    let clubes = readJson(json: "clubes")
    for i in 0 ..< clubes.count{
      let j = Jogador()
      j.posicao = clubes[i][1] as! String
      j.nome = clubes[i][2] as! String
      j.nacionalidade = clubes[i][3] as! String
      j.passe = clubes[i][4] as! Int
      j.ataque = clubes[i][5] as! Int
      j.defesa = clubes[i][6] as! Int
      j.overall = (j.ataque + j.defesa + j.passe) / 3
      j.salario = clubes[i][7] as! Int
      j.valor = clubes[i][8] as! Int
      j.especial = clubes[i][9] as! String
      jogadores.append(j)
      c.elenco.append(j)
    }
    
    do {
      //Adiciona jogadores, clube e elenco no Realm
      try! realm.write {
        realm.add(e)
        realm.add(c)
      }
    }
    
    print(Realm.Configuration.defaultConfiguration.fileURL!)
    return c
  }

  
  func createReal() -> Clube {
    //Cria Estádio
    let e = Estadio()
    e.nome = "Santiago Bernabeu"
    e.assentos = 81044
    e.custoManutencao = 160000
    e.valorIngresso = 15
    //Cria Jogadores
    let j = Jogador()
    j.posicao = "ATA"
    j.nome = "Cristiano Ronaldo"
    j.nacionalidade = "🇨🇷"
    j.defesa = 85
    j.passe = 85
    j.ataque = 70
    j.overall = (j.ataque + j.defesa + j.passe) / 3
    j.valor = 1500000
    j.salario = 75000
    j.especial = Especial.Hero.rawValue
    
    //Cria Clube
    let c = Clube()
    c.name = "Real Madrid"
    c.tecnico = "Zinedine Zidane"
    c.valorCaixa = 30000000
    c.estadio = e
    c.elenco.append(j) //associa jogadores ao clube
    c.corPrincipal =  FlatWhite().hexValue()
    c.corSecundaria = FlatBlue().hexValue()
    
    //Cria movimento inicial
    let m = MovimentoFinanceiro()
    m.dataEvento = Date()
    m.nomeEvento = "Valor Inicio Carreira"
    m.saldo = c.valorCaixa
    m.movimento = c.valorCaixa
    c.historicoFinanceiro.append(m) //associa histórico ao clube
    
    //Adiciona Jogadores na tableview
    jogadores.append(j)
    
    do {
      //let realm = try Realm()
      try! realm.write {
        realm.add(e)
        realm.add(j)
        realm.add(c)
      }
      print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    return c
  }

  
}
