//
//  UIApplication+Extension.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

extension UIApplication {

    class func topViewController(controller: UIViewController? = Helper.keyWindow()?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
