//
//  BaseViewController.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
        
    var viewModel: V

    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    // MARK: - SetupViews
    func setupViews() {}
    
    // MARK: - SetupLayouts
    func setupLayouts() {}
    
}
