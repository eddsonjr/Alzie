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

class AdicionarPessoasViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //variavies de views
    //esta variavel define o container de adicionar pessoas
    var addPessoasContainer: AdicionarPessoaContainerControllerViewController? = nil
    
    
    
    //variaveis para manipular a collectionView
    @IBOutlet weak var collectionView: UICollectionView!
    let reuserIdentifier  = "cell"
    var qtCells = 0 //quantidade de celulas na collectionview
    var listaImagensCelula : [UIImage] = [] //ira armazenar as fotos tiradas ou pegas da galeria que irao para a collectionview
    
    //var listaDeImagensParaSalvar: [NSData] = []  //TESTE
    

    //variaveis de deimensoes - servem para manipular o tamanho das celulas
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

    
    //variaveis do tipo Album, FotosAlbum e DAO
    var album: AlbumEntes = AlbumEntes()
    //var fotosDoAlbum: FotosDoAlbum = FotosDoAlbum()
    var DAO: AlbumDAO = AlbumDAO()
    var fotosDoAlbumLista: [FotosDoAlbum] = []
    
    //variavel para alertas
    var alerta: UIAlertView?
    var alertaAddFotoNoAlbum: UIAlertController?
    
    //variavel de suporte para saber se algum campo foi deixado em branco
    var nomeParenteNulo : Bool = false
    var grauParentescoNulo: Bool = false
    var fotoPerfilAlbumNulo: Bool = false
    var fotosNulo: Bool = false
    
    //variavel para trabalhar caso nao haja foto de perfil
    let fotoAvatarPadrao : UIImage = UIImage(named: "personNoImage2")!
    var fotoAvatarPadraoConvetidaNSDATA : NSData?
    var fotoTirada: UIImage = UIImage(named: "personNoImage2")!
    var fotoParaAlbumConvertidaNSDATA: NSData?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.alerta = UIAlertView(title: "teste", message: "AdicionarPessoasViewController ", delegate: self, cancelButtonTitle: "ok")
        self.alerta!.show()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AdicionarPessoasViewController.keyboardDidShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AdicionarPessoasViewController.keyboardDidHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        print("Em viewDidAppear")
     
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
        
        //caso o usuario nao coloque o nome do ente
        if(self.addPessoasContainer?.nomePessoaAdicionarTextEdit == nil || (self.addPessoasContainer?.nomePessoaAdicionarTextEdit.text?.isEmpty)!){
            print("Nome da pessoa que sera salva no album vazio... ")
            self.nomeParenteNulo = true
            
        }
        
        //caso o usuario nao coloque o grau de parentesco
        if(self.addPessoasContainer?.grauParetescoPessoaTextEdit == nil || (self.addPessoasContainer?.grauParetescoPessoaTextEdit.text?.isEmpty)!){
            print("Grau de parentesco que sera salvo no banco vazio...")
            self.grauParentescoNulo = true
        }
        
        //caso nao haja foto de avatar no album, usar uma padrao
        if((self.addPessoasContainer?.fotoTiradaConvertidaNSDATA) == nil){
            print("Imagem Vazia ou camera indisponivel. Salvando foto padrao")
            //convertendo a imagem padrao para NSData
            self.fotoAvatarPadraoConvetidaNSDATA = converterImagemParaNSDATA(self.fotoAvatarPadrao)
            self.album.fotoAvatar = self.fotoAvatarPadraoConvetidaNSDATA
        }else{
            self.album.fotoAvatar = self.addPessoasContainer?.fotoTiradaConvertidaNSDATA
        }
        
        self.album.notasPessoa = self.addPessoasContainer?.notasPessoaAdicionarTextArea.text
        
        //verificando se ha possibilidade de salvar
        if(self.grauParentescoNulo || self.nomeParenteNulo || self.fotosNulo){ //nao pode deixar salvar
            print("Ha dados nulos. Nao e possivel deixar salvar")
            self.alerta = UIAlertView(title: "Atenção", message: "Faltou você registrar ou o nome ou grau de parentesco ou então adicionar alguma foto ao álbum. Por favor, insira os dados para poder salvar o álbum", delegate: self, cancelButtonTitle: "Ok")
            alerta?.show()
            
            self.nomeParenteNulo = false
            self.grauParentescoNulo = false
            
        }else{
            self.album.NomeEnteLegenda = self.addPessoasContainer?.nomePessoaAdicionarTextEdit.text
            self.album.grauParentescoLegenda = self.addPessoasContainer?.grauParetescoPessoaTextEdit.text
            
            
            //self.album.listaFotosDoAlbum.append(self.fotosDoAlbum)
            //testPopularAlbum()
            
            
            //salvarListaDeFotosNoAlbum()
            self.alerta = UIAlertView(title: "Dados Salvos", message: "Album Salvo com sucesso", delegate: self, cancelButtonTitle: "Ok")
            self.alerta?.show()
            //agora salvando diretamente no banco
            DAO.salvarAlbum(self.album)
            print("Dados salvos!")
            
            
        }
        
        
    }
    
    
    
    //esta funcao permite adicionar fotos no album do ente que se quer salvar
    @IBAction func addFotosNoAlbumBTN(sender: AnyObject) {
        //preparando o alerta
        self.alertaAddFotoNoAlbum = UIAlertController(title: "Adicionar Fotos no Álbum", message: "Você desesja adicionar fotos usando a câmera ou a galeria?", preferredStyle: .Alert)
        
        
        //perapando os botoes para o alerta
        //botao para acionar a camera
        let cameraAlertaAddButton = UIAlertAction(title: "Câmera", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            print("camera escolhida")
            self.tirarFoto()
        
            
        }
        let galeriaAlertaAddButton = UIAlertAction(title: "Galeria", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            print("galeria escolhida")
            self.pegarFotoGaleria()
            
           
        }
        
        //adicionando os botoes ao controlador
        self.alertaAddFotoNoAlbum?.addAction(cameraAlertaAddButton)
        self.alertaAddFotoNoAlbum?.addAction(galeriaAlertaAddButton)
        
        //mostrando o alerta na tela
         self.presentViewController(alertaAddFotoNoAlbum!, animated: true, completion: nil)
        
        
        
    }
    
    //funcao para manipuar o teclado
    func keyboardDidShow(notifcation: NSNotification){
        self.view.frame.origin.y = -210
    }
    
    func keyboardDidHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    
    //converte uma UIImage em um NSDATA
    func converterImagemParaNSDATA(imagem: UIImage) -> NSData {
        //self.fotoAvatarPadraoConvetidaNSDATA = UIImagePNGRepresentation(self.fotoAvatarPadrao)
        return UIImagePNGRepresentation(imagem)!
    }
    
    
    
    //Abaixo estao duas funcoes para bater foto
    func tirarFoto() {
         var hasCam: Bool = UIImagePickerController.isSourceTypeAvailable(.Camera)
        if hasCam {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            let alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Seu dispositivo não tem suporte a câmera", delegate: self, cancelButtonTitle: "Ok")
            alerta.show()
        }
    }
    
    //controladora de imagens
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.fotoTirada = image
        self.listaImagensCelula.append(image)
        //self.fotosDoAlbum.foto = self.converterImagemParaNSDATA(self.listaImagensCelula.last!)
        //self.atualizarListaFotos()
            self.dismissViewControllerAnimated(true, completion:{
            self.fotoAvatarPadraoConvetidaNSDATA =  self.converterImagemParaNSDATA(image)
            var fotosDoAlbum: FotosDoAlbum = FotosDoAlbum()
            fotosDoAlbum.foto = self.converterImagemParaNSDATA(image)
            fotosDoAlbum.legendaDaFoto =  self.colocarLegendaNaFoto()
            self.album.listaFotosDoAlbum.append(fotosDoAlbum)
            //self.fotosDoAlbumLista.append(fotosDoAlbum)
            self.atualizarCollectionView("add")
            //self.listaDeImagensParaSalvar.append(self.converterImagemParaNSDATA(image)) //TESTES
            
           
          
        });
       
    }
    
    
    //pegar uma foto da galeria
    func pegarFotoGaleria(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    
    }
    
    
    
    //funcao para permitir colocar uma legenda na foto assim que ela for registrada
    func colocarLegendaNaFoto() -> String{
        print("Inserindo legenda...")
        var legendaInserida: String = String()
        
        let alertaLegenda: UIAlertController = UIAlertController(title: "Adicionar Legenda a foto", message: "Você pode adicionar uma legenda a sua foto caso queira.", preferredStyle: .Alert)
        
        var textField: UITextField = UITextField()
        //let textField = alertaLegenda.textFields?.first
       
        let salvarLegenda = UIAlertAction(title: "Armazenar Legenda", style: .Default, handler: {(action:UIAlertAction) -> Void in
            textField = (alertaLegenda.textFields?.first)!
            legendaInserida = (textField.text)!
            print("Legenda: \(legendaInserida)")
        })
        
        let cancelarLegenda = UIAlertAction(title: "Não salvar legenda", style: .Default, handler: {
            (action: UIAlertAction) -> Void in
            legendaInserida = ""
        })
        
        
        alertaLegenda.addTextFieldWithConfigurationHandler{
            (textField: UITextField) -> Void in
        }
        
        
        
        alertaLegenda.addAction(salvarLegenda)
        alertaLegenda.addAction(cancelarLegenda)
        
        self.presentViewController(alertaLegenda, animated: true, completion: nil)
        
        return legendaInserida
        
    }
    
    
    //atualiza a lista de fotos a ser salva no banco
//    func atualizarListaFotos(){
//        print("atualizando lista de fotos para o banco...")
//        if  qtCells >= 0 {
//            //self.album.listaFotosDoAlbum.append(self.fotosDoAlbum)
//        }
//    }
    
//    func removerDaListaDeFotos(index: Int){
//        print("Removendo lista de fotos para o banco...")
//        if qtCells >= 0 {
//            //self.album.listaFotosDoAlbum.removeAtIndex(index)
//        }
//    }
    
    
    
    
    
    /*Os metodos abaixo servem para manipular a collectionView*/
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.qtCells
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuserIdentifier, forIndexPath: indexPath) as! celula
        cell.celulaImageView.image = self.listaImagensCelula[indexPath.row]
        
       
        return cell
    }
    
    //metodo para realizar alguma funcao quando umas das celulas é clicada
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Celula clicada: \(indexPath.row)")
        self.listaImagensCelula.removeAtIndex(indexPath.row)
        //removerDaListaDeFotos(indexPath.row)
        atualizarCollectionView("delete")
    }

    
    //este metodo serve para atualizar os dados dentro da collectionView
    func atualizarCollectionView(operacao: String){
        switch operacao {
        case "add":
            self.collectionView.performBatchUpdates({
                self.collectionView.insertItemsAtIndexPaths([NSIndexPath(forItem: self.collectionView.visibleCells().count, inSection: 0)])
                self.qtCells++
                self.collectionView.reloadData()
                }, completion: nil)
        case "delete":
            self.collectionView.performBatchUpdates({
                self.collectionView.deleteItemsAtIndexPaths([NSIndexPath(forItem: self.collectionView.visibleCells().count, inSection: 0)])
                self.qtCells--
                self.collectionView.reloadData()
                }, completion: nil)
        default: break
            print("Selecione uma das seguintes opcoes: delete ou add")
        }
        
    }
    
    
    
    
    
    //FUNCAO DE TESTES PARA TENTAR SALVAR OS DADOS DENTRO DO ALBUM
//    func testPopularAlbum(){
//        let s = 0
//        while  s < self.listaDeImagensParaSalvar.count {
//            self.album.listaFotosDoAlbum[s].foto = self.listaDeImagensParaSalvar[s]
//        }
//    }
    
    
//    func TestPopularAlbum(){
//        for l in fotosDoAlbumLista{
//            album.listaFotosDoAlbum.append(l)
//        }
//    }
    
    
    func salvarListaDeFotosNoAlbum(){
        var s = 0
        while s <= fotosDoAlbumLista.count{
            self.album.listaFotosDoAlbum[s] = self.fotosDoAlbumLista[s]
        }
    }

    
}







/*Abaixo esta a classe que represnta as celulas da collectionView*/
/*Implementando uma classe que herda as caracteristicas da celula*/
class celula: UICollectionViewCell {
    
    @IBOutlet weak var celulaLegendaLabel: UILabel!
    @IBOutlet weak var celulaImageView: UIImageView!
    
}








