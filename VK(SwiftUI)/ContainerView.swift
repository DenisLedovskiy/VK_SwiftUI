//
//  NavigationView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 28.04.2022.
//

import SwiftUI

struct ContainerView: View {

    @State private var shouldShowMainView: Bool = false
    @ObservedObject var session = Session.shared

    var body: some View {
        NavigationView {
//            HStack {
//                LoginView(isUserLoggedIn: $shouldShowMainView)
//
//                NavigationLink(destination: TabBarView(), isActive: $shouldShowMainView) {
//                    EmptyView()

            HStack {
                VKLoginWebView()
                NavigationLink(destination: TabBarView(), isActive: $session.isAuthorized) { EmptyView()
                }
            }
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
