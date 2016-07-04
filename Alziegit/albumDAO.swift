//
//  albumDAO.swift
//  Alziegit
//
//  Created by Edson  Jr on 04/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//
//  Esta classe e responsavel pelo DAO com as Imagens e Albuns
//
//

import Foundation
import RealmSwift

class  AlubmDAO {
    
    //instancia do banco de dados
    let realm = try! Realm()
    

    func salvarAlbum(album: AlbumEntes){
        try! realm.write{
            realm.add(album)
            try! realm.commitWrite()
        }
    }
    
    
    
    
    
    
    /*Operacoes de DAO sobre as fotos do album*/
    func salvarFotoNoAlbum(foto: FotosDoAlbum){
        try! realm.write{
            realm.add(foto)
            try! realm.commitWrite()
        }
    }

    
    
    
}