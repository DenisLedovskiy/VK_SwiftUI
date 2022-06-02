//
//  GalleryView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct GalleryView: View {

    @ObservedObject var viewModel: GalleryViewFactory

    let columns = [
    GridItem(.flexible(minimum: 0, maximum: .infinity)),
    GridItem(.flexible(minimum: 0, maximum: .infinity)), ]

    @State private var photoRowHeight: CGFloat? = nil
    @State private var selection: Int? = nil

    init(viewModel: GalleryViewFactory) {
        self.viewModel = viewModel

    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                    if let photos = viewModel.photos {
                        ForEach(photos) { photo in
                            PhotosViewCell(photo: photo, index: photos.index(of: photo), selection: $selection)
                                .frame(height: photoRowHeight)
                        }
                    }
                }
            }
        }
        .onAppear { viewModel.fetch() }
        .onPreferenceChange(PhotoHeightPreferenceKey.self) { height in
            photoRowHeight = height
        }
        .overlayPreferenceValue(SelectionPreferenceKey.self) {
            SelectionRectangle(anchor: $0)
            
        }
    }

}

//struct GalleryView_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryView(gallery: FriendList.friends.first!)
//    }
//}



