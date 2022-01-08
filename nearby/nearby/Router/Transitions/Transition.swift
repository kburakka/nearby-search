//
//  Transition.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
