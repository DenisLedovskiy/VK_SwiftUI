//
//  LoginWebView.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 02.05.2022.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {

    @ObservedObject var session = Session.shared
//    @ObservedObject var viewModel: LoginViewModel

    fileprivate let navigationDelegate = WebViewNavigationDelegate()

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }

    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: session.cliendId), //"8008842"
            URLQueryItem(name: "scope", value: "401502"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: session.cliendId)
        ]

        return components.url.map { URLRequest(url: $0) }
    }
}


//struct VKLoginWebView_Previews: PreviewProvider {
//    static var previews: some View {
//        VKLoginWebView(viewModel: LoginViewModel)
//    }
//}
