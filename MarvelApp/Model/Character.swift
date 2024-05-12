//
//  Character.swift
//  MarvelApp
//
//  Created by Abraham Valderrabano Vega on 10/05/24.
//

import Foundation

struct Character : Codable{
    let id : Int
    let name : String
    let description : String
    let modified : String
    let resourceURI : String
    let thumbnail : Image // Struct
    let urls : [URLWebsite] //Struct
    let comics : ResourceList<ComicItem>
    let stories : ResourceList<StoryItem>
    let events : ResourceList<EventItem>
    let series : ResourceList<SerieItem>
}
