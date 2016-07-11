//
//  FichaPaciente.swift
//  Alziegit
//
//  Created by Edson  Jr on 11/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//
//  Esta classe discreve os dados do paciente e suas ficha medica
//
import Foundation
import RealmSwift


class FichaDoPaciente: Object{
    
    dynamic var foto: NSData?
    dynamic var nome: String?
    dynamic var tSangue: String?
    dynamic var telefone1: String?
    dynamic var telefone2: String?
    dynamic var problemasDeSaude: String?
    dynamic var medicamentos: String?
    dynamic var alergiasConhecidas: String?
    
}
