//
//  Photo.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 01.06.2022.
//

import Foundation

struct Photos: Identifiable, Equatable {

    let id: UUID = UUID()
    var url: String

    static func == (lhs: Photos, rhs: Photos) -> Bool {
           return lhs.id == rhs.id
       }
}
