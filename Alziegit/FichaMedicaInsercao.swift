//
//  FichaMedicaInsercao.swift
//  Alziegit
//
//  Created by Edson  Jr on 13/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class FichaMedicaInsercao: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //CAMPOS DA TELA
    @IBOutlet weak var nomePacienteTextEdit: UITextField!
    @IBOutlet weak var grupoSanguineoTextEdit: UITextField!
    @IBOutlet weak var medicamenteosTextEdit: UITextField!
    @IBOutlet weak var reacoesAlertgicasPacienteTextEdit: UITextField!
    @IBOutlet weak var problemasSaudePacienteTextEdit: UITextField!
    @IBOutlet weak var telefoneEmeregencia1NomeTextEdit: UITextField!
    @IBOutlet weak var telefoneEmergencia1NumeroTextEdit: UITextField!
    @IBOutlet weak var telefoneEmergencia2NomeTextEdit: UITextField!
    @IBOutlet weak var telefoneEmergencia2NumeroTextEdit: UITextField!
    @IBOutlet weak var tirarFotoPacienteBTN: UIButton!
    
    
    //variaveis de acesso a tela
    var fichaPaciente: FichaDoPaciente = FichaDoPaciente()
    var fichaDAO: FichaPacienteDAO = FichaPacienteDAO()
    
    
    
    
    //variaveis de apoio
    var hasCam: Bool = UIImagePickerController.isSourceTypeAvailable(.Camera)
    var imagePicker = UIImagePickerController()
    var fotoPacientePadrao: UIImage = UIImage(named: "personNoImage2")!
    
    
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FichaMedicaInsercao.keyboardDidShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FichaMedicaInsercao.keyboardDidHide(_:)), name: UIKeyboardWillHideNotification, object: nil)

    
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

    
    
    
    //funcao para manipuar o teclado
    func keyboardDidShow(notifcation: NSNotification){
        self.view.frame.origin.y = -60
    }
    
    func keyboardDidHide(notification: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    
    
    
    @IBAction func TirarFotoPacienteBTN(sender: AnyObject) {
        if hasCam {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }else{
            let alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Seu dispositivo não tem suporte a câmera", delegate: self, cancelButtonTitle: "Ok")
            alerta.show()
            
            //caso nao haja camera, salvando uma imagem qualquer como avatar
            self.tirarFotoPacienteBTN.setImage(self.fotoPacientePadrao, forState: .Normal)
            fichaPaciente.foto = converterImagemParaNSDATA(self.fotoPacientePadrao)
        }
    
    
    }
    
    
    
    @IBAction func salvarFichaMedicaPacienteBTN(sender: AnyObject) {
        
        fichaPaciente.nome = self.nomePacienteTextEdit.text
        fichaPaciente.alergiasConhecidas = self.reacoesAlertgicasPacienteTextEdit.text
        fichaPaciente.medicamentos = self.medicamenteosTextEdit.text
        fichaPaciente.problemasDeSaude = self.problemasSaudePacienteTextEdit.text
        fichaPaciente.telefone1Nome = self.telefoneEmeregencia1NomeTextEdit.text
        fichaPaciente.telefone1 = self.telefoneEmergencia1NumeroTextEdit.text
        fichaPaciente.telefone2Nome = self.telefoneEmergencia2NomeTextEdit.text
        fichaPaciente.telefone2 = self.telefoneEmergencia2NumeroTextEdit.text
        fichaPaciente.tSangue = self.grupoSanguineoTextEdit.text
        
        
        fichaDAO.salvarFichaPaciente(self.fichaPaciente)
        print("Ficha medica salva")
        print("Paciente Nome: \(self.fichaPaciente.nome)")
        
        let alerta: UIAlertView = UIAlertView(title: "Informações do Paciente", message: "Informações do paciente salvas com sucesso", delegate: self, cancelButtonTitle: "Ok")
        alerta.show()
        
        
        //NSNotificationCenter.defaultCenter().postNotificationName("mostrarDadosFichaMedica", object: nil)

    }
    
    
    
    
    
    
    
    
    func converterImagemParaNSDATA(imagem: UIImage) -> NSData {
        return UIImagePNGRepresentation(imagem)!
    }
    
    
    
    
    
}
