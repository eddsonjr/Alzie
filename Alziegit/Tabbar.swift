//
//  Tabbar.swift
//  Alziegit
//
//  Created by Carlos  Machado on 12/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import Foundation
import UIKit
//#551A8B
//(85,26,139)
extension UIColor{

    
    convenience init(red : Int, green: Int, blue: Int) { // IMPLEMENTA O HEXADECIMAL POR PARTES
        
        assert(red >= 0 && red <= 255 , "Invalid red component")
        assert(green >= 0 && green <= 255 , "Invalid green component")
        assert(blue >= 0 && blue <= 255 , "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        
    }
    
    convenience init(netHex: Int) {//IMPLEMENTA O HEXADECIMAL POR INTEIRO.
        
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    
    }

}


class MyTabbarController: UITabBarController,UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        
            // Sets the default color of the icon of the selected UITabBarItem and Title
        
        var color = UIColor(red: 0x54, green: 0x34, blue: 0x86)
        var color2 = UIColor(netHex:0x190E2D)
        
        // Sets the default color of the text
        UITabBar.appearance().tintColor = UIColor.blackColor()
        // Sets the default color of the background of the UITabBar
        UITabBar.appearance().barTintColor = color
        
        
        
        
        tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeAtivo"), selectedImage: UIImage(named: "HomeAtivo"))

    
    }

}
    
    
    
    
    
    
    
    
    
    
    
    
    
