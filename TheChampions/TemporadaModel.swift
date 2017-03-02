//
//  TemporadaModel.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 28/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift

class Temporada: Object {
  //Chave
  dynamic var ano = 2017
  //Atributos
  dynamic var campeao = ""
  dynamic var vice = ""
  dynamic var artilheiro = ""
  dynamic var melhorJogador = "" //calculado em cima de PK pegos, gols e assistencias, com pesos.
}
