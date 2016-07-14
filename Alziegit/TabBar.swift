//
//  TabBar.swift
//  Alziegit
//
//  Created by Carlos  Machado on 12/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit



extension UIColor{
    
    convenience init(red : Int, green: Int, blue: Int) { // IMPLEMENTA O HEXADECIMAL POR PARTES
        
        assert(red >= 0 && red <= 255 , "Invalid red component")
        assert(green >= 0 && green <= 255 , "Invalid green component")
        assert(blue >= 0 && blue <= 255 , "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        print("sdssd")
        
    }
    
    convenience init(netHex: Int) {//IMPLEMENTA O HEXADECIMAL POR INTEIRO.
        
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
        
    }
    
}


class MyTabbarController: UITabBarController,UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets the default color of the icon of the selected UITabBarItem and Title
        
        //let color = UIColor(red: 0x38, green: 0x25, blue: 0x63)
        let color2 = UIColor(netHex:0x362256)
        let color = UIColor(netHex:0xEDB52A)
        // Sets the default color of the text
        UITabBar.appearance().tintColor = color
        // Sets the default color of the background of the UITabBar
        UITabBar.appearance().barTintColor = color2
        UITabBarItemPositioning.Fill
        
        
        
    }
    
}