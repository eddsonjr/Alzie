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
    

    /*Operacoes sobre os albuns*/
    
    ///salva os dados de um Album no banco de dados. Depois disso é necessário salvar as fotos no album
    func salvarAlbum(album: AlbumEntes){
        try! realm.write{
            realm.add(album)
            try! realm.commitWrite()
        }
    }
    

    ///Retorna todos os albuns criados. Retornar um Results<AlbumEntes>
    func listarTodosAlbuns() -> Results<AlbumEntes> {
       var albuns = realm.objects(AlbumEntes.self)
       return albuns
    }
    
    
    
    ///apaga um determinado album
    func apagarAlbum(album: AlbumEntes){
        realm.delete(album)
    }
    

    
    
    
    /*Operacoes de DAO sobre as fotos do album*/
    
    
    ///salva uma foto em um determinado album. Ao salvar a foto, é necessario especificar o dono do album
    func salvarFotoNoAlbum(foto: FotosDoAlbum){
        try! realm.write{
            realm.add(foto)
            try! realm.commitWrite()
        }
    }

    
    
    ///retorna todas as fotos que estao naquele album
    func listarTodasFotos() -> Results<FotosDoAlbum> {
        var fotos = realm.objects(FotosDoAlbum.self)
        return fotos
    }
    
    
    ///apaga uma determinada foto daquele album
    func apagarFoto(foto: FotosDoAlbum){
        realm.delete(foto)
    }
    
    
    
    
    
}