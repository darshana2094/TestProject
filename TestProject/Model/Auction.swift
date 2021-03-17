//
//  Auction.swift
//  TestProject
//
//  Created by AEIONE on 15/03/21.
//

import Foundation


struct Auction: Codable {
    let id, title, description: String
    let end: Int
    let action: String
}
