//
//  Friends.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import Foundation
import UIKit

class ViewDataCell: Identifiable {

    internal init(name: String, imageName: String, status: String, gallery: [String]) {
        self.name = name
        self.imageName = imageName
        self.status = status
        self.gallery = gallery

    }

    let id: UUID = UUID()
    let name: String
    let imageName: String
    let status: String
    let gallery: [String]
}

struct FriendList {

    static let friends: [ViewDataCell] = [
        ViewDataCell(name: "Меган Фокс",
                     imageName: "ava",
                     status: "Онлайн",
                     gallery: ["meg1", "meg2", "meg3", "meg4", "meg5", "meg6"]),
        ViewDataCell(name: "Арнольд Шварцнеггер",
                     imageName: "ava1",
                     status: "Онлайн",
                     gallery: ["arni1", "arni2", "arni3", "arni4", "arni5", "arni6"]),
        ViewDataCell(name: "Диана Принс",
                     imageName: "ava2",
                     status: "Офлайн",
                     gallery: ["di1", "di2", "di3", "di4", "di5", "di6"])
    ]
}

struct GroupList {

    static let groups: [ViewDataCell] = [
        ViewDataCell(name: "Музыка", imageName: "gr1", status: "500 подписчиков", gallery: [""]),
        ViewDataCell(name: "Скидки", imageName: "gr2", status: "1000 подписчиков", gallery: [""]),
        ViewDataCell(name: "Реал", imageName: "gr3", status: "453 342 подписчиков", gallery: [""]),
        ViewDataCell(name: "Качалка", imageName: "gr4", status: "2 подписчика", gallery: [""])
    ]
}
