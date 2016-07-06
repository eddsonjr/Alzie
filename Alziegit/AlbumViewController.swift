//
//  AlbumViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // navbar()
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
