//
//  AddFotosAlbumCollectionViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 07/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AddFotosAlbumCollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    //variavel da celula da collectionView
    let reuserIdentifier  = "addFotoColecoVCell"

    
    //variaveis de deimensoes
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //pegando as proporcoes da tela para configurar o tamanho da tela
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height

        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        //configurando as dimensoes da celula
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.frame.size.width = screenWidth / 4.3
        cell.frame.size.height = screenWidth / 4.3
        
        return cell
    }
    
    
}





/*Implementando uma classe que herda as caracteristicas da celula*/
class addFotoCVCell: UICollectionViewCell{
    
}

