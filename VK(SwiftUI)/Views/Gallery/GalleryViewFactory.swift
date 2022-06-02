//
//  GalleryViewFactory.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import SwiftUI

class GalleryViewFactory: ObservableObject {

    let api: PhotosService
    let friend: ViewDataCell

    @Published var photos: [Photos] = []

    init(friend: ViewDataCell, api: PhotosService) {
        self.friend = friend
        self.api = api
    }

    public func fetch() {

        api.getPhotos(userId: friend.galleryId) { [weak self] photos in
            self?.photos = (self?.fillPhotoArray(photos))!

        }
    }

    func fillPhotoArray(_ photoInitialResponse: PhotosInitialResponse) -> [Photos] {

        var photoArray: [Photos] = []
        let photoCount = photoInitialResponse.response.items.count
        let photo = photoInitialResponse.response.items

        if photoCount > 1 {
            for i in 0...photoCount - 1 {
                photoArray.append(Photos(url: "\(photo[i].sizes[6].url)"))
            }
        }
        return(photoArray)
    }
}

