//
//  FichaPacienteDAO.swift
//  Alziegit
//
//  Created by Edson  Jr on 11/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  DAO da ficha do paciente
//
//


import Foundation
import RealmSwift


class FichaPacienteDAO {
    
    
    
    //salvando os dados
    func salvarFichaPaciente(paciente: FichaDoPaciente){
        let realm = try! Realm()
        try! realm.write{
            realm.add(paciente)
            try! realm.commitWrite()
        }
    }
    
    
    //retornando a ficha do paciente
    func retornarFichaDoPaciente() -> Results<FichaDoPaciente>{
        let realm = try! Realm()
        
        let paciente = realm.objects(FichaDoPaciente.self)
        return paciente
    }
    
}