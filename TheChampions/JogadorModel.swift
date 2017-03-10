//
//  JogadorModel.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 27/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift

class Jogador : Object {
  dynamic var posicao = ""
  dynamic var nome = ""
  dynamic var nacionalidade = ""
  dynamic var passe = 0
  dynamic var ataque = 0
  dynamic var defesa = 0
  dynamic var overall = 0
  dynamic var salario = 0
  dynamic var valor = 0
  dynamic var gols = 0
  dynamic var assistencias = 0
  
  
  dynamic var especial = Especial.Peladeiro.rawValue
  var especialEnum: Especial {
    get {
      return Especial(rawValue: especial)!
    }
    set {
      especial = newValue.rawValue
    }
  }
}

enum Especial : String {
  case PK_Hero = "+20% PK"
  case Sweeper = "+20% PASSE"
  case TackleMaster = "No Red Cards"
  case HeadStriker = "+20% ATAQUE"
  case TikTaker = "+30% PASSE"
  case Longshot = "+10% ATAQUE"
  case Playmaker = "+20% PASSE e +10% ATAQUE"
  case TheBeast = "+30% DEFESA"
  case Striker = "+30% ATAQUE"
  case Wing = "+15% PASSE"
  case Hero = "+25% ALL"
  case Alien = "+50% ATAQUE e 15% DEFESA E PASSE"
  case Peladeiro = "No Bonus"
}


