//
//  EstadioModel.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 27/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift

class Estadio : Object {
  //Chave
  dynamic var nome = ""
  //Atributos
  dynamic var assentos = 0
  dynamic var ocupacaoMedia = 0
  dynamic var valorIngresso = 0
  dynamic var custoManutencao = 0 
		
}
