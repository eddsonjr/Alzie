//
//  AlbumViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // let alerta: UIAlertView = UIAlertView(title: "teste", message: "AlubmViewController ", delegate: self, cancelButtonTitle: "ok")
        //alerta.show()
        
        
        //TENTATIVA
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    let reuserIdentifier  = "cell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.NomeLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.whiteColor()//make cell more visible in our examle project
        
        //improving the cell
        
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 10
        cell.frame.size.width = screenWidth / 4.3
        cell.frame.size.height = screenWidth / 4.3
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap avents
        
        print("You selected cell #\(indexPath.item)!")
        
        
    }
    

    

}



class MyCollectionViewCell: UICollectionViewCell{
    
    
    @IBOutlet var NomeLabel: UILabel!
    
    @IBOutlet var imagePessoa: UIImageView!
    
    
    
}