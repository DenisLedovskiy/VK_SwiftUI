//
//  MainCoordinator.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 26.05.2022.
//

import UIKit
import Combine
import SwiftUI

class MainCoordinator {

    var session = Session.shared
    let navigationController: UINavigationController

//    private let loginViewModel: LoginViewModel = LoginViewModel()
//    private let coreDataService: CoreDataService = CoreDataService(modelName: "City")

    private var cancellables: Set<AnyCancellable> = []

    init(navigationController: UINavigationController) {
        let loginView = VKLoginWebView()
        let loginViewController = UIHostingController(rootView: loginView)
        self.navigationController = UINavigationController(rootViewController: loginViewController)
    }

    public func start() {
        session.$isAuthorized.subscribe(on: RunLoop.main).sink { [weak self] isAuthorized in
            guard let self = self else { return }
            if !isAuthorized {
                self.navigationController.popToRootViewController(animated: true)
            } else {
                let tabBar = self.createTabBar()
                self.navigationController.pushViewController(tabBar, animated: true)
            }
        }.store(in: &cancellables)
    }

    private func createTabBar() -> UIViewController {
        let tabBarView = TabBarView()
        return UIHostingController(rootView: tabBarView)
    }

}
