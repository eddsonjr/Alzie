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

class  AlbumDAO {
    
    //instancia do banco de dados
    
    

    /*Operacoes sobre os albuns*/
    
    ///salva os dados de um Album no banco de dados. Depois disso é necessário salvar as fotos no album
    func salvarAlbum(album: AlbumEntes){
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(album)
            try! realm.commitWrite()
        }
    }
    

    ///Retorna todos os albuns criados. Retornar um Results<AlbumEntes>
    class func listarTodosAlbuns() -> Results<AlbumEntes> {
        let realm = try! Realm()
        
        let albuns = realm.objects(AlbumEntes.self)
        return albuns
    }
    
    
    ///retorna a quantidade de albuns criados ate o momento
    func retornarQuantidadeAlbunsNaBase() -> Int{
        
        let realm = try! Realm()
        return realm.objects(AlbumEntes).count
    }
    
    ///apaga um determinado album
    func apagarAlbum(album: AlbumEntes){
        let realm = try! Realm()
        realm.delete(album)
    }
    
    
    

    
    
    
    /*Operacoes de DAO sobre as fotos do album*/
    
    
    ///salva uma foto em um determinado album. Ao salvar a foto, é necessario especificar o dono do album
    class func salvarFotoNoAlbum(foto: FotosDoAlbum){
        let realm = try! Realm()
        try! realm.write{
            realm.add(foto)
            try! realm.commitWrite()
        }
    }

    
    
    ///retorna todas as fotos salvas no banco
    class func listarTodasFotos() -> Results<FotosDoAlbum> {
        let realm = try! Realm()
        let fotos = realm.objects(FotosDoAlbum.self)
        return fotos
    }
    
    
    
    ///retorna todas as fotos de acordo com o album
    class func listarTodasFotos(nomeEnte: String,ente: AlbumEntes) ->Results<FotosDoAlbum>{
        let realm = try! Realm()
        let predicado: NSPredicate = NSPredicate(value: ente.NomeEnteLegenda == nomeEnte)
        let fotos = realm.objects(FotosDoAlbum.self).filter(predicado)
        return fotos
    }
    
    ///apaga uma determinada foto daquele album
    class func apagarFoto(foto: FotosDoAlbum){
        let realm = try! Realm()
        realm.delete(foto)
    }
    
    
    
    
    
}