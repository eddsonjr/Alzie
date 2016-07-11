//
//  AlertasDAO.swift
//  Alziegit
//
//  Created by Edson  Jr on 11/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
// DAO dos alertas
//
//

import Foundation
import RealmSwift


class AlertasDAO {
    
    
    func salvarAlerta(alerta: Alertas){
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(alerta)
            try! realm.commitWrite()
        }
    }
    
    
    func listarTodosAlertas() -> Results<Alertas>{
        let realm = try! Realm()
        
        let alertas = realm.objects(Alertas.self)
        return alertas
    }
    
    
    
    func retornarQuantidadeDeAlertasSalvos() -> Int{
        let realm = try! Realm()

        return realm.objects(Alertas).count
    }
    
    
    
    func apagarAlerta(alerta: Alertas){
         let realm = try! Realm()
         realm.delete(alerta)
    }
    
    
    
    
    
    
}
