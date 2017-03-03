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
  
  func deleteAllDatabase() {
    let realm = try! Realm()
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
      let realm = try Realm()
      try! realm.write {
        realm.add(tabela)
      }
    } catch {
      
    }
    
  }
  
  func escolherClube(jogarCom clube: String) {
    do
    {
      let realm = try Realm()
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
    catch
    {
        
    }
  }
  
  func createBarca() -> Clube {
    
    let e = Estadio()
    e.nome = "Camp Nou"
    e.assentos = 99354
    e.custoManutencao = 200000
    e.valorIngresso = 15
    
    let j = Jogador()
    j.posicao = "GK"
    j.nome = "Ter Stegen"
    j.nacionalidade = "🇩🇪"
    j.defesa = 90
    j.passe = 90
    j.ataque = 70
    j.overall = (j.ataque + j.defesa + j.passe) / 3
    j.valor = 32000000
    j.salario = 100000
    j.especial = Especial.PK_Hero.rawValue
    
    
    let c = Clube()
    c.name = "Barcelona FC"
    c.tecnico = "Luis Henrique"
    c.valorCaixa = 24500000
    c.estadio = e
    c.elenco.append(j)
    c.corPrincipal = FlatBlueDark().hexValue()
    c.corSecundaria = FlatRed().hexValue()
    
    
    let m = MovimentoFinanceiro()
    m.dataEvento = Date()
    m.nomeEvento = "Valor Inicio Carreira"
    m.saldo = c.valorCaixa
    m.movimento = c.valorCaixa
    c.historicoFinanceiro.append(m) //associa histórico ao clube
    
    jogadores.append(j)
    
    do {
      let realm = try Realm()
      try! realm.write {
        realm.add(e)
        realm.add(j)
        realm.add(c)
      }
      print(Realm.Configuration.defaultConfiguration.fileURL!)
    } catch {
      
    }
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
    j.posicao = "GK"
    j.nome = "Keylor Navas"
    j.nacionalidade = "🇨🇷"
    j.defesa = 85
    j.passe = 85
    j.ataque = 70
    j.overall = (j.ataque + j.defesa + j.passe) / 3
    j.valor = 1500000
    j.salario = 75000
    j.especial = Especial.Peladeiro.rawValue
    
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
      let realm = try Realm()
      try! realm.write {
        realm.add(e)
        realm.add(j)
        realm.add(c)
      }
      print(Realm.Configuration.defaultConfiguration.fileURL!)
    } catch {
      
    }
    return c
  }

  
}
