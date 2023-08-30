//
//  Model.swift
//  Thrones
//
//  Created by Teboho Mohale on 2023/02/13.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String = UUID().uuidString
    let firstName, lastName, fullName, title: String
    let family, image: String
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
    case id, firstName, lastName, fullName, title, family, image
    case imageURL = "imageUrl"
    }
}

