//
//  CellImage.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CellImage: View {

    var content: WebImage

    init(@ViewBuilder content: () -> WebImage) {
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
