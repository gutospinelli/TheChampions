//
//  ClubeModel.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 27/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift

class Clube : Object {
  //Chave
  dynamic var name = ""
  //Atributos
  dynamic var tecnico = ""
  dynamic var valorCaixa = 0
  dynamic var estadio : Estadio? = nil
  let elenco = List<Jogador>()
  let historicoFinanceiro = List<MovimentoFinanceiro>()
  
}
