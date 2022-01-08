//
//  BaseViewModel.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject { }

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
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
        print("Show Loading")
    }
    
    func hideLoadingView() {
        print("Hide Loading")
    }
}
