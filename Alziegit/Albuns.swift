//
//  Albuns.swift
//  Alziegit
//
//  Created by Edson  Jr on 04/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  Esta classe represnta o album de cada um dos entes que sera adicionado no aplicativo.
//  Cada album referencia uma pessoa da familia ou amigo. Cada album contem o nome da pessoa
//  o grau de parentesco, uma lista de fotos e a lista de fotos tem uma lista de legendas, para respectivas
//  fotos
//
//  Esta classe herda caracteristicas da RealmSwift
//


import Foundation
import RealmSwift

class AlbumEntes: Object {
    
    dynamic var NomeEnteLegenda: String?
    dynamic var grauParentescoLegenda: String?
    dynamic var fotoAvatar: NSData?
    
    //lista de fotos
    var listaFotosDoAlbum =  List<FotosDoAlbum>()
        
}
