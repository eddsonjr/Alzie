//
//  InfoPessoasViewController.swift
//  Alziegit
//
//  Created by Carlos  Machado on 10/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class InfoPessoasViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let reuserCell = "pessoaCell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserCell, forIndexPath: indexPath) as! InfoPessoasViewControllerCell
        cell.NumerosDaCell.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.borderColor = UIColor.redColor().CGColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 20
        
        
        return cell
        
    }
    
}




class InfoPessoasViewControllerCell: UICollectionViewCell{
    
    
    @IBOutlet weak var ImagemPessoaCell: UIImageView!

    @IBOutlet var NumerosDaCell: UILabel!
    
    
    
}
