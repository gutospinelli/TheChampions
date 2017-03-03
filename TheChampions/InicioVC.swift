//
//  InicioVC.swift
//  TheChampions
//
//  Created by Augusto Spinelli on 03/03/17.
//  Copyright © 2017 Augusto Spinelli. All rights reserved.
//

import UIKit
import ChameleonFramework
import RealmSwift

class InicioVC: UIViewController {

  @IBOutlet weak var lblThe: UILabel!
  @IBOutlet weak var lblChampionS: UILabel!
  
  var realm = try! Realm()
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    let colors:[UIColor] = [
      FlatBlack(),
      FlatNavyBlueDark(),
      FlatSkyBlue()
      
    ]
    self.view.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)

    //Seta o SmallCaps (versalete) da fonte
    let desc = UIFontDescriptor(name:"Didot", size:50)
    let d = [
      UIFontFeatureTypeIdentifierKey:kLetterCaseType,
      UIFontFeatureSelectorIdentifierKey:kSmallCapsSelector
    ]
    let desc2 = desc.addingAttributes(
      [UIFontDescriptorFeatureSettingsAttribute:[d]]
    )
    let f = UIFont(descriptor: desc2, size: 0)
    lblThe.font = f
    lblChampionS.font = f
    
    
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func continuaJogo(_ sender: UIButton) {
  }
    
  @IBAction func novoJogo(_ sender: UIButton) {
    BaseDados.instance.deleteAllDatabase()
    BaseDados.instance.clubes.append(BaseDados.instance.createBarca())
    BaseDados.instance.clubes.append(BaseDados.instance.createReal())
    BaseDados.instance.startTemporada(inicioEm: 2017, participantes: BaseDados.instance.clubes)
    BaseDados.instance.escolherClube(jogarCom: "Real Madrid")
  }


  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
