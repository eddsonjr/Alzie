//
//  AdicionarPessoasViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 07/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  Este é o controlador da tela em que há os containers. Nao confundir este controlador com 
//  o "AdicionarPessoasContainerController",  que é o controlador do container que contem 
//  os campos para adicionar os dados da nova pessoa para criar o album. 
//  Este controlador tambem conta com o suporte as fotos que irao dentro do album. Possivelmente 
//  a parte das fotos do album ira trabalhar neste controlador e nao num container.
//
//
//

import UIKit

class AdicionarPessoasViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    //esta variavel define o container de adicionar pessoas
    var addPessoasContainer: AdicionarPessoaContainerControllerViewController? = nil
    
    
    //variaveis do tipo Album, FotosAlbum e DAO
    var album: AlbumEntes = AlbumEntes()
    var fotosDoAlbum: FotosDoAlbum = FotosDoAlbum()
    var DAO: AlbumDAO = AlbumDAO()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alerta: UIAlertView = UIAlertView(title: "teste", message: "AdicionarPessoasViewController ", delegate: self, cancelButtonTitle: "ok")
        alerta.show()
        
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
    
    
    
    //Adicionando a segue abaixo
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addPessoaSegueToContainer"{
            print("Segue para o container Adicionar Pessoas criada!")
            self.addPessoasContainer = segue.destinationViewController as? AdicionarPessoaContainerControllerViewController
        }
    }
    
    
    //botao de salvar localizado na navigation bar
    
    ///salva os dados do album e tambem da pessoa a quem o album referencia
    @IBAction func salvarAlbumNavBTN(sender: AnyObject) {
        
        //primeiramente populando o objeto Album
        self.album.NomeEnteLegenda = self.addPessoasContainer?.nomePessoaAdicionarTextEdit.text
        self.album.grauParentescoLegenda = self.addPessoasContainer?.grauParetescoPessoaTextEdit.text
        self.album.fotoAvatar = self.addPessoasContainer?.fotoTiradaConvertidaNSDATA
        self.album.notasPessoa = self.addPessoasContainer?.notasPessoaAdicionarTextArea.text
        
        //agora salvando diretamente no banco
        DAO.salvarAlbum(self.album)
        
        print("Dados salvos!")
        
        var alerta: UIAlertView = UIAlertView(title: "Dados Salvos", message: "Album Salvo com sucesso", delegate: self, cancelButtonTitle: "Ok")
        
        
    }
    
    
    
    

}
