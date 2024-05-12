//
//  ResourceList.swift
//  MarvelApp
//
//  Created by Abraham Valderrabano Vega on 10/05/24
//

import Foundation

struct ResourceList<T : Codable> : Codable {
    let available : Int
    let collectionURI : String
    let items : [T]
    let returned : Int
}
