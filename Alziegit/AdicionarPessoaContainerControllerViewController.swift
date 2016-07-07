//
//  AdicionarPessoaContainerControllerViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AdicionarPessoaContainerControllerViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    //Elementos Visuais do Container de Adicionar Pessoas
    @IBOutlet weak var nomePessoaAdicionarTextEdit: UITextField!
    @IBOutlet weak var notasPessoaAdicionarTextArea: UITextView!
    @IBOutlet weak var fotoPerfilAdicionarAlbumBTN: UIButton!
    @IBOutlet weak var dataAniversarioPessoaTextArea: UITextField!
    @IBOutlet weak var grauParetescoPessoaTextEdit: UITextField!
    //variaveis de suporte
    var hasCam: Bool = UIImagePickerController.isSourceTypeAvailable(.Camera) //verifica se suporte a camera pelo dispositivo
    var fotoTirada: UIImage = UIImage(named: "personNoImage2")!
    var fotoTiradaConvertidaNSDATA: NSData?
    

    
    //variaveis para manipular o teclado
    
    
    
    //esta variavel define o controlador da tela onde o container esta alocado
    var addPessoasViewController : AdicionarPessoasViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
    
    //preparando a segue para se comunicar com a tela mae
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addPessoaSegueToContainer"{
            print("Segue do container addPessoas para tela mae criado!")
            self.addPessoasViewController = segue.destinationViewController as? AdicionarPessoasViewController
        }
    }

    
    @IBAction func adicionarFotoPerfilPessoaAlbumBTN(sender: AnyObject) {
        if hasCam {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            let alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Seu dispositivo não tem suporte a câmera", delegate: self, cancelButtonTitle: "Ok")
            alerta.show()
            
            //SOMENTE PARA TESTES - VERIFICAR A RETIRADA DESTA LINHA APOS
            self.fotoPerfilAdicionarAlbumBTN.setImage(self.fotoTirada, forState: .Normal)
            converterImagemParaNSDATA()
            
        }

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.fotoTirada = image
        self.fotoPerfilAdicionarAlbumBTN.setImage(self.fotoTirada, forState: .Normal)
        self.dismissViewControllerAnimated(true, completion: nil);
        converterImagemParaNSDATA()
    }

    
    ///converte a imagem do tipo UIImage para NSDATA
    func converterImagemParaNSDATA() {
        self.fotoTiradaConvertidaNSDATA = UIImagePNGRepresentation(self.fotoTirada)
    }
    
    
 
   
    
    
    
    
}
