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
    
    //LABELS DA FICHA MEDICA
    
    @IBOutlet var problemasSaude: UILabel!
    @IBOutlet var alergiasReacoes: UILabel!
    @IBOutlet var medicamentos: UILabel!
    @IBOutlet var grupoSanguineo: UILabel!
    @IBOutlet var nomeContatoEmergencia1: UILabel!
    @IBOutlet var telefoneContatoEmergencia1: UILabel!
    @IBOutlet var nomeContatoEmergencia2: UILabel!
    @IBOutlet var telefoneContatoEmergencia2: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    

}
