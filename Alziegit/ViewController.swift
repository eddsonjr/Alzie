//
//  ViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 04/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    //PROPRIEDADES DE TESTES
    @IBOutlet weak var imageViewTest: UIImageView!
    @IBOutlet weak var qtAlbunsSalvosTestLabel: UILabel!
    @IBOutlet weak var imageViewTest2: UIImageView!
    @IBOutlet weak var imageViewTest3: UIImageView!
    
    @IBOutlet weak var legendaFoto1: UILabel!
    
    @IBOutlet weak var legendaFoto2: UILabel!
    
    //verificar se o dispositivo possui ou nao camera
     var hasCam: Bool = UIImagePickerController.isSourceTypeAvailable(.Camera)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        qtAlbunsCadastrados()
        retornarDados()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //botao de testes para bater foto
    @IBAction func BaterFotoTestBTN(sender: AnyObject) {
    
        TirarFoto()
    }
    
    
    
    /*Abaixo funcoes para manipular a camera*/
    ///funcao para acionar a camera e bater foto
    func TirarFoto(){
        if hasCam {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            let noCamAlert: UIAlertView = UIAlertView(title: "Câmera", message: "Seu dispositivo não tem suporte a câmera", delegate: self, cancelButtonTitle: "ok")
            noCamAlert.show()
        }
    }
    
    
    
    
    /*As funcoes abaixo podem ser usadas para trabalho no projeto principal em si e  tambem de testes*/
    
    ///funcao para trabalhar com o controlador e o delegate da cambera
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.imageViewTest.image = image
        self.imageViewTest2.image = image
        self.imageViewTest3.image = image
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    
    
    ///Esta funcao serve para salvar os dados de um album no banco
    func salvarAlbum(){
        
        var album : AlbumEntes = AlbumEntes()
        var fotoDoAlbum: FotosDoAlbum = FotosDoAlbum()
        
        var UIImageToNSData = UIImagePNGRepresentation(imageViewTest.image!)
        album.fotoAvatar = UIImageToNSData
        
        
        //setando a foto para ser salva no banco
        fotoDoAlbum.legendaDaFoto = "LegendaTest"
        fotoDoAlbum.foto = album.fotoAvatar
        
        
        //setando os dados no banco
        album.fotoAvatar = UIImageToNSData
        album.NomeEnteLegenda = "Edson Jr"
        album.grauParentescoLegenda = "Filho"
        album.listaFotosDoAlbum.append(fotoDoAlbum)
      
        
        var dao: AlbumDAO = AlbumDAO()
        dao.salvarAlbum(album)
        
        qtAlbunsCadastrados()
        
    }
   
    func qtAlbunsCadastrados() {
        var dao: AlbumDAO = AlbumDAO()
        self.qtAlbunsSalvosTestLabel.text = String(dao.retornarQuantidadeAlbunsNaBase())
    }

    
    
    func retornarDados(){
        var dao: AlbumDAO = AlbumDAO()
        var album : AlbumEntes = dao.listarTodosAlbuns().first!
        
        
        if(dao.retornarQuantidadeAlbunsNaBase() > 0) {
            self.imageViewTest.image = UIImage(data: album.fotoAvatar!)
          //  self.imageViewTest2.image = UIImage(data: (album.listaFotosDoAlbum.first?.foto)!)
          //  self.imageViewTest3.image = UIImage(data: (album.listaFotosDoAlbum.first?.foto)!)
            self.legendaFoto1.text = album.listaFotosDoAlbum.last?.legendaDaFoto
            self.legendaFoto2.text = album.listaFotosDoAlbum.last?.legendaDaFoto
        
        }
       
    }
    
    
    
    
    

    
    @IBAction func SalvarAlbumTestBTN(sender: AnyObject) {
        salvarAlbum()
    }
    
    
    
    @IBAction func SalvarFotosNoAlbumTest(sender: AnyObject) {
       
    }
  
    
    
    
  

}

