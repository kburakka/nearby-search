//
//  PlaceOnWindowTransition.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

class PlaceOnWindowTransition: Transition {
    
    var viewController: UIViewController?
    
    func open(_ viewController: UIViewController) {
        guard let window = (UIApplication
                                .shared
                                .connectedScenes
                                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                .first { $0.isKeyWindow }) else {
            return
        }
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            UIView.performWithoutAnimation {
                window.rootViewController = viewController
            }
        }, completion: nil)
    }
    
    func close(_ viewController: UIViewController) {}
    
}
