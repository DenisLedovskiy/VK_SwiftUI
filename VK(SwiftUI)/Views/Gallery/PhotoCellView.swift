//
//  PhotoCellView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 31.05.2022.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct PhotosViewCell: View {

    var photo: Photos
    let index: Int?
    @Binding var selection: Int?

    var body: some View {

        return GeometryReader { proxy in
            VStack {
                    WebImage(url: URL(string: photo.url))
                        .resizable()
                        .frame(width: proxy.size.width, height: proxy.size.width/2)
                        .scaledToFill()
                Spacer().frame(height: 5)

                    LikeButton()
                        .frame(width: proxy.size.width)

            }
            .aspectRatio(1, contentMode: .fill)
            .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width/1.5)
            .anchorPreference(key: SelectionPreferenceKey.self, value: .bounds) {
                index == self.selection ? $0 : nil
            }
            .onTapGesture {
                withAnimation(.default) {
                    self.selection = index
                }
            }
        }
    }
}
