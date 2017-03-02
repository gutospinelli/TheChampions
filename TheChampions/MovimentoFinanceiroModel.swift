//
//  MovimentoFinanceiroModel.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 28/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift

class MovimentoFinanceiro: Object {
  //Atributos
  dynamic var nomeEvento = ""
  dynamic var dataEvento : Date? = nil
  dynamic var movimento = 0
  dynamic var saldo = 0

}
