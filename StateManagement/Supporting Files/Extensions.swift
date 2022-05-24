//
//  Extensions.swift
//  StateManagement
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

extension UIColor {
    func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        UIColor(displayP3Red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
