//
//  TabelaClassificacaoModel.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 28/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import Foundation
import RealmSwift

class TabelaClassificacao: Object {
  //Chave
  dynamic var temporada : Temporada? = nil
  //Atributos
  let classificacao = List<PosicaoTabela>()
  
}

class PosicaoTabela : Object {
  //Chaves
  dynamic var equipe : Clube? = nil
  dynamic var temporada : Temporada? = nil
  //Atributos
  dynamic var posicao = 1
  dynamic var pontos = 0
  dynamic var jogos = 0
  dynamic var vitorias = 0
  dynamic var empates = 0
  dynamic var derrotas = 0
  dynamic var saldo = 0
}
