//
//  PushTransition.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

class PushTransition: NSObject, Transition {
        
    weak var viewController: UIViewController?
    
    func open(_ viewController: UIViewController) {
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func close(_ viewController: UIViewController) {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}
