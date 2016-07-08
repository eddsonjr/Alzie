//
//  AlbumViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit
import RealmSwift

class AlbumViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    //Variaveis do tipo Album e DAO
    var album: AlbumEntes = AlbumEntes()
    var DAO: AlbumDAO = AlbumDAO()
    
    
    //Serve para armazenar a quantidade de albums já criados
    var items: Int = Int()
    
    //Serve para pegar uma lista de dados do album
    var listaBanco: [AlbumEntes] {
    
        get {
            var intlList = [AlbumEntes]()
            
            for album in AlbumDAO.listarTodosAlbuns(){
                
                intlList.append(album)
                
            }
            return intlList

        }
    
    }
    override func viewDidLoad() {
        
        //TENTATIVA
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        self.items = DAO.retornarQuantidadeAlbunsNaBase() //retorna a quantidade de itens na base
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let reuserIdentifier  = "cell"
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }

    //configura a quantiade de items salvos na base
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items
    }
    
    
    
    //funcao que recarrega os dados da collection 
    
    
    
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        cell.NomeLabel.text = self.listaBanco[indexPath.item].NomeEnteLegenda
        cell.backgroundColor = UIColor.whiteColor()
        
        let fotoAvatar: UIImage = UIImage(data:  self.listaBanco[indexPath.item].fotoAvatar!)!
        cell.imagePessoa.image = fotoAvatar
        
        
        
        
        //improving the cell
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.frame.size.width = screenWidth / 4.3
        cell.frame.size.height = screenWidth / 4.3
        return cell
        
    }
    
    
    //implemente para quando uma celula for clicada
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.item)!")
        print("Carregando fotos do album")
        
    }
}



/*Classe que representa a celula da collectionView*/
class MyCollectionViewCell: UICollectionViewCell{
    
    
    @IBOutlet var NomeLabel: UILabel!
    @IBOutlet var imagePessoa: UIImageView!
    
    
    
}