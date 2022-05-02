//
//  GalleryView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct GalleryView: View {

    var gallery: ViewDataCell

    var body: some View {

        let photoArray = gallery.gallery.chunked(into: 2)

        return VStack {

            ScrollView {

                VStack(spacing: 16) {

                    ForEach(photoArray.indices, id:\.self) { idx in

                        HStack {

                            ForEach(photoArray[idx].indices, id:\.self) { index in

                                HStack {

                                    Spacer()
                                    Image("\(photoArray[idx][index])")
                                        .resizable()
                                        .frame(maxWidth: 200, maxHeight: 200)
                                        .cornerRadius(8)

                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(gallery: FriendList.friends.first!)
    }
}



