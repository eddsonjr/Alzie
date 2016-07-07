//
//  AlbumViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    
    
    @IBOutlet weak var qtAlbunsJaCriadosLabel: UILabel!
    
    
    
    //variaveis do tipo Album e DAO
    var album: AlbumEntes = AlbumEntes()
    var DAO: AlbumDAO = AlbumDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alerta: UIAlertView = UIAlertView(title: "teste", message: "AlubmViewController ", delegate: self, cancelButtonTitle: "ok")
        alerta.show()
        
        
        //mostrando a quantidade de albuns ja criadas no aplicativo
        self.qtAlbunsJaCriadosLabel.text = String(DAO.retornarQuantidadeAlbunsNaBase())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func navbar(){
        
        
        let rightAddBarButtonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add,target: self,action: #selector(AlbumViewController.addTapped))
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 30))
        label.text = "Memórias"
        label.font = UIFont.boldSystemFontOfSize(18)
        label.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = label
        
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        
        
    }

    
    func addTapped(){
        
        
        
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
