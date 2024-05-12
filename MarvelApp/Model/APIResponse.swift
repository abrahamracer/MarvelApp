//
//  APIResponse.swift
//  MarvelApp
//
//  Created by Abraham Valderrabano Vega on 10/05/24
//

import Foundation

struct APIResponse<T : Codable>:Codable {
    let code : Int
    let status : String
    let copyright : String
    let attributionText : String
    let attributionHTML : String
    let etag : String
    let data : DataResponse<T>
}
