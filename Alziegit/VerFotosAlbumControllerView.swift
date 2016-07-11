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
    var listaDeFotosNesteAlbum: [UIImage] = []
    //var imagemConvertida: UIImage?
    var qtF: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Dentro de visualizar album. Nome do album carregado: \(self.albumDoEnte.NomeEnteLegenda)")
        self.qtFotosNoAlbumLabel.text = String(albumDoEnte.listaFotosDoAlbum.count)
        retornarListaDeFotosDesteAlbum()
        
        var swipeDireita = UISwipeGestureRecognizer(target: self, action: "responderAoSwipe:")
        swipeDireita.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeDireita)
        
        
        var swipeEsquerda = UISwipeGestureRecognizer(target:  self, action:  "responderAoSwipe:")
        swipeEsquerda.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeEsquerda)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    
    
    //funcao que serve para popular a lista de fotos do album
    func retornarListaDeFotosDesteAlbum() {
        var imagemConvertida: UIImage?
        
        while (self.qtF < self.albumDoEnte.listaFotosDoAlbum.count) {
            imagemConvertida = UIImage(data: self.albumDoEnte.listaFotosDoAlbum[qtF].foto!)
            self.listaDeFotosNesteAlbum.append(imagemConvertida!)
            self.qtF++
        }
        
        print("Quantidade de fotos no album convertidas: \(self.listaDeFotosNesteAlbum.count)")
        
        //ja mostrando a primeira imagem na tela
        self.qtF = 0
        self.fotoDoAlbumImageView.image = self.listaDeFotosNesteAlbum[self.qtF]
    }
    
    
    
    func responderAoSwipe(gesture: UISwipeGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Carregada: \(self.listaDeFotosNesteAlbum[self.qtF])")
                self.qtF++
                self.fotoDoAlbumImageView.image = self.listaDeFotosNesteAlbum[self.qtF]
                
            case UISwipeGestureRecognizerDirection.Left:
                print("Carregada: \(self.listaDeFotosNesteAlbum[self.qtF])")
                self.qtF--
                self.fotoDoAlbumImageView.image = self.listaDeFotosNesteAlbum[self.qtF]
            default:
                self.qtF = 0
                
            }
        }
        
        
        
        
    }
    
    
    

}
