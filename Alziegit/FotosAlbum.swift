//
//  FotosAlbum.swift
//  Alziegit
//
//  Created by Edson  Jr on 04/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import Foundation
import RealmSwift


class FotosDoAlbum:Object {
    
    dynamic var foto: NSData?
    dynamic var legendaDaFoto: String?
    
    
    // associando o album a quem a foto pertence
    dynamic var Album: AlbumEntes?

    
    
    
    
    
    
    
    
    
}
