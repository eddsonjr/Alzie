//
//  FichaMedica.swift
//  Alziegit
//
//  Created by Carlos  Machado on 13/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class FichaMedica: UIViewController {

    @IBOutlet var PacienteImage: UIImageView!
    @IBOutlet var NomePaciente: UILabel!
    @IBOutlet var AniversarioPaciente: UILabel!
    
    @IBOutlet var PacienteImagemBTN: UIButton!
    //LABELS DA FICHA MEDICA
    
    @IBOutlet var problemasSaude: UILabel!
    @IBOutlet var alergiasReacoes: UILabel!
    @IBOutlet var medicamentos: UILabel!
    @IBOutlet var grupoSanguineo: UILabel!
    @IBOutlet var nomeContatoEmergencia1: UILabel!
    @IBOutlet var telefoneContatoEmergencia1: UILabel!
    @IBOutlet var nomeContatoEmergencia2: UILabel!
    @IBOutlet var telefoneContatoEmergencia2: UILabel!
    
    
    
    //variaveis para pegar a ficha medica
    //var fichaMedica: FichaDoPaciente?
    var fichaMedicaDAO: FichaPacienteDAO = FichaPacienteDAO()
    var fichaMedica: FichaDoPaciente?
    
//    var listaFichaMedicasSalvas: [FichaDoPaciente] {
//        get{
//            var inList = [FichaDoPaciente]()
//            for  ficha in fichaMedicaDAO.retornarFichaDoPaciente() {
//                inList.append(ficha)
//                
//            }
//            return inList
//        }
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Em ficha medica")
        // Do any additional setup after loading the view.
        PacienteImage.layer.borderWidth = 2
        PacienteImage.layer.borderColor = UIColor.blackColor().CGColor
        PacienteImage.layer.cornerRadius = 30
        PacienteImage.layer.backgroundColor =  UIColor.redColor().CGColor
        
        print("Quantidade de registros medicos: \(fichaMedicaDAO.retornarQuantidadeDeFichas())")
        //qtRegistros = fichaMedicaDAO.retornarQuantidadeDeFichas()
        
//         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FichaMedica.mostrarDadosFichaMedica(_:)), name: "mostrarDadosFichaMedica", object: nil)
        mostrarDadosFichaMedica()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func mostrarDadosFichaMedica(){
        //pegando a ficha medica do paciente e colocando no objeto
        if fichaMedicaDAO.retornarQuantidadeDeFichas() == 0 {
            print("Ficha medica vazia")
            let alerta: UIAlertView = UIAlertView(title: "Atenção", message: "Nenhum registro do paciente encontrado! Por favor, registre os dados do paciente antes de começar a usar o Alzie.", delegate: self, cancelButtonTitle: "Ok")
            alerta.show()
        }else{ // populando os campos da ficha medica
            self.fichaMedica = fichaMedicaDAO.retornarUltimaFichaRegistrada()
            print("\(self.fichaMedica?.nome)")
            
            self.problemasSaude.text = fichaMedica!.problemasDeSaude
            self.alergiasReacoes.text = fichaMedica!.alergiasConhecidas
            self.medicamentos.text = fichaMedica!.medicamentos
            self.NomePaciente.text = fichaMedica!.nome
            self.grupoSanguineo.text = fichaMedica!.tSangue
            self.nomeContatoEmergencia1.text = fichaMedica!.telefone1Nome
            self.nomeContatoEmergencia2.text = fichaMedica!.telefone2Nome
            self.telefoneContatoEmergencia1.text = fichaMedica!.telefone1
            self.telefoneContatoEmergencia2.text = fichaMedica!.telefone2
            self.PacienteImage.image =  UIImage(data: (fichaMedica!.foto)!)
        }

    }
    
    
    
    
    
    
    

}
