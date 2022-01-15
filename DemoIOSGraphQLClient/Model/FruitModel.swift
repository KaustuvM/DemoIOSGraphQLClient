//
//  FruitModel.swift
//  Fructus
//
//  Created by Kaustuv Mukherjee on 12/5/21.
//

import SwiftUI
import Apollo

struct Fruit: Identifiable {
    var id: GraphQLID
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var sectionHeaders: [String]
    var sectionContents: [String]
    var nutrition: [String]
}


