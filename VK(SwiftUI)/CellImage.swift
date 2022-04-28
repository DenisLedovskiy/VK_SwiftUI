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
        .frame(width: 80, height: 80, alignment: .leading)
        .cornerRadius(75)
        .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 3))
    }
}
