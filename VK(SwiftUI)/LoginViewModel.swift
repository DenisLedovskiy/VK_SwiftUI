//
//  LoginViewModel.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 26.05.2022.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var isAuthorized: Bool = false
    @Published var token = ""
    @Published var userId = ""
    @Published var version = "5.131"   
    @Published var cliendId = "7822904"
}
