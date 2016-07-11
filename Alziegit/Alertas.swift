//
//  Alertas.swift
//  Alziegit
//
//  Created by Edson  Jr on 11/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  Esta classe define os alertas
//
//
//


import Foundation
import RealmSwift

class Alertas: Object {
    
    dynamic var mensagemAlerta: String?
    dynamic var horarioAlerta: NSDate?
    dynamic var feito: Bool = false
    
}