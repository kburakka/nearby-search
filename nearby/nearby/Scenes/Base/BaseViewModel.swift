//
//  BaseViewModel.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject { }

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func showAlert(title: String, message: String)
    func showLoadingView()
    func hideLoadingView()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {

    var router: R
    var dataProvider: DataProviderProtocol

    init(router: R, dataProvider: DataProviderProtocol = ApiProvider.shared) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func showLoadingView() {
        if let viewController = UIApplication.topViewController() {
            viewController.showSpinner(onView: viewController.view)
        }
    }
    
    func hideLoadingView() {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
    
    func showAlert(title: String, message: String) {
        if let viewController = UIApplication.topViewController() {
            viewController.showAlert(title: title, message: message)
        }
    }
    
}
