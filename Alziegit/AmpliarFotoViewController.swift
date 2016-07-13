//
//  AmpliarFotoViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 13/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AmpliarFotoViewController: UIViewController {

    @IBOutlet weak var foto: UIImageView!
    
    var imgFoto: UIImage = UIImage(named: "personNoImage2")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.foto.image = imgFoto
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
