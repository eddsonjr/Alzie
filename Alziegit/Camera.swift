//
//  Camera.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  Esta classe permite o uso da camera, bem como a conversao do tipo imagem em nsdata e vice versa
//
//

import Foundation
import UIKit

class Camera: NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
     var hasCam: Bool = UIImagePickerController.isSourceTypeAvailable(.Camera)
   
    
    ///esta funcao permite acionar a camera e bater foto
    func TirarFoto(view: ViewController) {
        if hasCam {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            //self.presentViewController(imagePicker, animated: true, completion: nil)
            view.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            let noCamAlert: UIAlertView = UIAlertView(title: "Câmera", message: "Seu dispositivo não tem suporte a câmera", delegate: self, cancelButtonTitle: "ok")
            noCamAlert.show()
        }

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!,view: ViewController,  editingInfo: [NSObject : AnyObject]!) -> UIImage{
        view.dismissViewControllerAnimated(true, completion: nil);
        return image
    }
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
}
