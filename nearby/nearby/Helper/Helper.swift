//
//  Helper.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

class Helper {
    static func keyWindow() -> UIWindow? {
        return (UIApplication
                    .shared
                    .connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow })
    }
}
