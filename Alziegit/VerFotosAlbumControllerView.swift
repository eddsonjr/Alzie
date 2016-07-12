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

class VerFotosAlbumControllerView: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {

    
    @IBOutlet weak var fotoPerfil: UIImageView!
    //nome da segue para esta controladora: verFotosDoAlbum
    
       @IBOutlet weak var qtFotosNoAlbumLabel: UILabel!
    @IBOutlet weak var collectionDasFotos: UICollectionView!
    let reuserIdentifier  = "cell"
    
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    //adicionando um objeto dao e um objeto do tipo fotosAlbum
    var albumDoEnte : AlbumEntes = AlbumEntes()
    var DAO: AlbumDAO = AlbumDAO()
    var listaDeFotosNesteAlbum: [UIImage] = []
    var imagemConvertida: UIImage?
    var qtF: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        print("Testes")
        
        
        self.imagemConvertida = UIImage(data: self.albumDoEnte.fotoAvatar!)
        self.fotoPerfil.image = imagemConvertida
        print("Dentro de visualizar album. Nome do album carregado: \(self.albumDoEnte.NomeEnteLegenda)")
        self.qtFotosNoAlbumLabel.text = String(albumDoEnte.listaFotosDoAlbum.count)
        retornarListaDeFotosDesteAlbum()
        
//        var swipeDireita = UISwipeGestureRecognizer(target: self, action: "responderAoSwipe:")
//        swipeDireita.direction = UISwipeGestureRecognizerDirection.Right
//        self.view.addGestureRecognizer(swipeDireita)
//        
//        
//        var swipeEsquerda = UISwipeGestureRecognizer(target:  self, action:  "responderAoSwipe:")
//        swipeEsquerda.direction = UISwipeGestureRecognizerDirection.Left
//        self.view.addGestureRecognizer(swipeEsquerda)
        
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
       
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumDoEnte.listaFotosDoAlbum.count
    }
    
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserIdentifier, forIndexPath: indexPath) as! cel
        
        
            cell.celulaImg.image = UIImage(data: self.albumDoEnte.listaFotosDoAlbum[indexPath.row].foto!)
            print("Legenda da foto: \(albumDoEnte.listaFotosDoAlbum[indexPath.row].legendaDaFoto)")
            cell.idFoto.text = albumDoEnte.listaFotosDoAlbum[indexPath.row].legendaDaFoto
                    
        
        cell.frame.size.width = screenWidth / 4.3
        cell.frame.size.height = screenWidth / 4.3
        return cell
    }
    
    
    
    
//    func responderAoSwipe(gesture: UISwipeGestureRecognizer){
//        
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
//            switch swipeGesture.direction {
//            case UISwipeGestureRecognizerDirection.Right:
//                print("Carregada: \(self.listaDeFotosNesteAlbum[self.qtF])")
//                self.qtF++
//                
//            case UISwipeGestureRecognizerDirection.Left:
//                print("Carregada: \(self.listaDeFotosNesteAlbum[self.qtF])")
//                self.qtF--
//                
//            default:
//                self.qtF = 0
//                
//            }
//        }
//        
//        
//        
//        
//    }
    
    
    

}


class cel: UICollectionViewCell{
    
    @IBOutlet weak var idFoto: UILabel!
    @IBOutlet weak var celulaImg: UIImageView!
    
}
