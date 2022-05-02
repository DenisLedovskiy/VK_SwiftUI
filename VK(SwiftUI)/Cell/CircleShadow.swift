//
//  CircleShadow.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct CircleShadow: ViewModifier {

    let shadowColor: Color
    let shadowRadius: CGFloat

    func body(content: Content) -> some View {

        content
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}
