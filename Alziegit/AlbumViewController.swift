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

    @IBOutlet weak var collectionTela: UICollectionView!
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    //Variaveis do tipo Album e DAO
    var album: AlbumEntes = AlbumEntes()
    var albumClicado: AlbumEntes = AlbumEntes()
    var DAO: AlbumDAO = AlbumDAO()
    
    
    //Serve para armazenar a quantidade de albums já criados
    var items: Int = Int()
    var indiceClicado: Int = 0
    
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
        print("\(self.items)")
        print("Vetor com objetos: \(self.listaBanco.count)")
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
                        print("\(self.items)")
            print("Vetor com objetos: \(self.listaBanco.count)")
        
            self.collectionView?.collectionViewLayout.invalidateLayout()
            self.collectionView?.collectionViewLayout.prepareLayout()

            self.collectionView?.reloadData()
            
            
      

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
//        let alertaTest: UIAlertView = UIAlertView(title: "Teste", message: "Testando o viewWillAppears", delegate: self, cancelButtonTitle: "ok")
//        
//        alertaTest.show()
        
        dispatch_async(dispatch_get_main_queue(), {
            
            self.items = self.DAO.retornarQuantidadeAlbunsNaBase()
            print("\(self.items)")
            print("Vetor com objetos: \(self.listaBanco.count)")
            
            //self.collectionView?.collectionViewLayout.invalidateLayout()
            self.collectionView?.reloadData()
            //self.collectionView?.collectionViewLayout.prepareLayout()
            
           
        })
       
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
        return self.listaBanco .count
    }
    
    
    
    //funcao que recarrega os dados da collection 
    
    
    
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        

        
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        
        cell.NomeLabel.text = listaBanco[indexPath.item].NomeEnteLegenda
        //cell.backgroundColor = UIColor.whiteColor()
        let fotoAvatar: UIImage = UIImage(data:  listaBanco[indexPath.item].fotoAvatar!)!
        cell.imagePessoa.image = fotoAvatar
        
        //improving the cell
        //cell.layer.borderColor = UIColor.grayColor().CGColor
        //cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
//        cell.frame.size.width = screenWidth / 4.3
//        cell.frame.size.height = screenWidth / 4.3
        return cell
        
    }
    
    

    
    //implemente para quando uma celula for clicada
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
      
            
            
            self.indiceClicado = indexPath.item
            print("You selected cell #\(indexPath.item)!")
            print("Carregando fotos do album")
            self.albumClicado = self.listaBanco[indexPath.item]
            print("Qt. lista de fotos do album clicado nesta celula: \(self.listaBanco[indexPath.row].listaFotosDoAlbum.count)")
            
            print("Nome do ente clicado: \(self.albumClicado.NomeEnteLegenda)")
     
        
        
    }
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Dentro de prepareForSegue. IndiceClicado: \(self.indiceClicado)")
        if segue.identifier == "verFotosDoAlbum"{
            var svc = segue.destinationViewController as? VerFotosAlbumControllerView
            
            let indePath = self.collectionTela.indexPathsForSelectedItems() as [NSIndexPath]!
            let index = indePath[0]
            
            
            let e = listaBanco[index.row]
            
            svc?.albumDoEnte = e
        }
    }
    
}








/*Classe que representa a celula da collectionView*/
class MyCollectionViewCell: UICollectionViewCell{
    
    
    @IBOutlet var NomeLabel: UILabel!
    @IBOutlet var imagePessoa: UIImageView!
    
    
    
}