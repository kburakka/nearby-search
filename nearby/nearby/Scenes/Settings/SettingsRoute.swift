//
//  SettingsRoute.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

protocol SettingsRoute {
    func pushSettings()
}

extension SettingsRoute where Self: RouterProtocol {
    
    func pushSettings() {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let viewController = SettingsViewController(viewModel: viewModel)
        viewController.title = "Settings"
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
