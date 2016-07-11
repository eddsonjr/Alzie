//
//  VerFotosAlbumControllerView.swift
//  Alziegit
//
//  Created by Edson  Jr on 07/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  Esta classe permite que você visualize fotos dos albums criados. 
// 
//

import UIKit

class VerFotosAlbumControllerView: UIViewController {

    
    //nome da segue para esta controladora: verFotosDoAlbum
    
    @IBOutlet weak var fotoDoAlbumImageView: UIImageView!
    @IBOutlet weak var legendaFotoLabel: UILabel!
    @IBOutlet weak var qtFotosNoAlbumLabel: UILabel!
    
    //adicionando um objeto dao e um objeto do tipo fotosAlbum
    var albumDoEnte : AlbumEntes = AlbumEntes()
    var DAO: AlbumDAO = AlbumDAO()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Dentro de visualizar album. Nome do album carregado: \(self.albumDoEnte.NomeEnteLegenda)")
        self.qtFotosNoAlbumLabel.text = String(albumDoEnte.listaFotosDoAlbum.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

}
