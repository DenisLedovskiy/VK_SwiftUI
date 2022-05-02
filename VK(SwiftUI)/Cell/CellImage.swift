//
//  CellImage.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct CellImage: View {

    var content: Image

    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View { content
        .resizable()
        .frame(width: 60, height: 60, alignment: .leading)
        .cornerRadius(75)
        .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 3))
        .padding(.vertical, 5)
    }
}