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


extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    
    func isValidDate() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/M/yyyy"
        let date = dateFormatter.date(from: self)
        return date != nil
    }
}
