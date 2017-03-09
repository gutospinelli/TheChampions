//
//  JogadorVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 25/02/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework
import SCLAlertView
import Charts

class JogadorVC: UIViewController, IAxisValueFormatter {

    
  @IBOutlet weak var lblJogador: UILabel!
  @IBOutlet weak var lblPosicao: UILabel!
  @IBOutlet weak var lblValorChute: UILabel!
  @IBOutlet weak var lblValorPasse: UILabel!
  @IBOutlet weak var lblValorDefesa: UILabel!
  @IBOutlet weak var lblSpecial: UILabel!
  @IBOutlet weak var lblSalario: UILabel!
  @IBOutlet weak var lblValorMercado: UILabel!
  @IBOutlet weak var lblNacionalidadeImg: UILabel!
  @IBOutlet weak var lblGols: UILabel!
  @IBOutlet weak var lblAssistencias: UILabel!
  @IBOutlet weak var lblValorOverall: UILabel!
  @IBOutlet weak var imgJogador: UIImageView!
  @IBOutlet weak var radarChart: RadarChartView!
  
  var jogadorAtual : Jogador? = nil
  var xVals = ["PAS", "ATA", "DEF"]
    
  @IBAction func vendeJogador(_ sender: UIButton) {
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
//    let colors:[UIColor] = [
//        FlatLime(),
//        FlatMint()
//    ]
//    self.view.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)
    
    lblJogador.text = jogadorAtual!.nome
    lblPosicao.text = jogadorAtual!.posicao
    lblValorChute.text = "\(jogadorAtual!.ataque)"
    lblValorPasse.text = "\(jogadorAtual!.passe)"
    lblValorDefesa.text = "\(jogadorAtual!.defesa)"
    lblSpecial.text = jogadorAtual!.especial
    lblSalario.text = "\(jogadorAtual!.salario)"
    lblValorMercado.text = "\(jogadorAtual!.valor)"
    lblNacionalidadeImg.text = jogadorAtual!.nacionalidade
    lblGols.text = "\(jogadorAtual!.gols)"
    lblAssistencias.text = "\(jogadorAtual!.assistencias)"
    lblValorOverall.text = "\(jogadorAtual!.overall)"
    
    switch jogadorAtual!.especialEnum {
    case .Hero:
      imgJogador.image = #imageLiteral(resourceName: "Hero")
    case .TikTaker:
      imgJogador.image = #imageLiteral(resourceName: "TikTaker")
    case .TheBeast:
      imgJogador.image = #imageLiteral(resourceName: "TheBeast")
    case .Sweeper:
      imgJogador.image = #imageLiteral(resourceName: "Sweeper")
    case .Wing:
      imgJogador.image = #imageLiteral(resourceName: "Wing")
    case .Alien:
      imgJogador.image = #imageLiteral(resourceName: "Alien")
    default:
      imgJogador.image = #imageLiteral(resourceName: "jogador")
    }
    
    updateChartWithData()
    
  }
  
  func stringForValue(_ value: Double, axis: AxisBase?) -> String {
    return xVals[Int(value) % xVals.count]
  }
  
  func updateChartWithData() {

    let dataEntryPasse = RadarChartDataEntry(value: Double(jogadorAtual!.passe))
    let dataEntryAtaque = RadarChartDataEntry(value: Double(jogadorAtual!.ataque) )
    let dataEntryDefesa = RadarChartDataEntry(value: Double(jogadorAtual!.defesa))
    let dataEntries: [RadarChartDataEntry] = [ dataEntryPasse, dataEntryAtaque, dataEntryDefesa ]
    
    let chartDataSet = RadarChartDataSet(values: dataEntries, label: "Atributos")
    chartDataSet.drawFilledEnabled = true
  

    //Options of radarChart
    radarChart.sizeToFit()
    radarChart.chartDescription?.text = ""
    radarChart.rotationEnabled = false
    
    //Options for the axis
    
    radarChart.yAxis.enabled = false
    radarChart.yAxis.axisMinimum = 0
    radarChart.yAxis.axisMaximum = 100
    
    radarChart.xAxis.enabled = true
    radarChart.xAxis.drawLabelsEnabled = true
    radarChart.xAxis.valueFormatter = self
    
    //Other options
    radarChart.legend.enabled = false
    radarChart.yAxis.gridAntialiasEnabled = true
    radarChart.animate(yAxisDuration: 2.0)
    
    let chartData = RadarChartData(dataSet: chartDataSet)
    radarChart.data = chartData
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let identifier = segue.identifier {
          switch identifier {
          case "showSellPopover":
              if let vc = segue.destination as? VendaVC {
                  vc.jogador = lblJogador.text!
                  vc.valor = lblValorMercado.text!
              }
          default:
              break
          }
      }
  }


}
