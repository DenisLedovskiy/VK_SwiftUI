//
//  Session.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 16.05.2022.
//

import Foundation

// Хранение данных о текущей сессии
class Session: ObservableObject {

    static let shared = Session()

    private init() {}

    @Published var isAuthorized: Bool = false
    @Published var token = ""                  // токен в VK
    @Published var userId = ""                 // ID пользователя
    @Published var version = "5.131"           // версия VK API
    @Published var cliendId = "7822904"        // // "6704883" "7822904" "7938282"

}
