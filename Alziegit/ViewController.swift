//
//  ViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 04/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func jogosBTN(sender: AnyObject) {
        print("Nada implementado aqui!")
        
        var alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Alzie ainda está em desenvolvimento. Espere as próximas versões para que esta funcionalidade esteja implementada!", delegate: self, cancelButtonTitle: "Ok")
        alerta.show()

        
    }
    
    
    
    
    @IBAction func anotacoesBTN(sender: AnyObject) {
        
        print("Nada implementado aqui!")
        
        var alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Alzie ainda está em desenvolvimento. Espere as próximas versões para que esta funcionalidade esteja implementada!", delegate: self, cancelButtonTitle: "Ok")
        alerta.show()

        
        
        
    }
    
}

