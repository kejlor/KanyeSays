//
//  QuoteModel.swift
//  KanyeSays
//
//  Created by Bartosz Wojtkowiak on 29/12/2021.
//

import Foundation

struct QuoteModel: Identifiable, Codable {
    let id = UUID()
    let quote: String
}
