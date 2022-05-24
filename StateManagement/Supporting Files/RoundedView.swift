//
//  RoundedView.swift
//  StateManagement
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
            get { return layer.cornerRadius }
            set {
                layer.cornerRadius = newValue
                layer.masksToBounds = (newValue > 0)
            }
        }
        
        @IBInspectable var borderWidth: CGFloat {
            get { return layer.cornerRadius }
            set {
                layer.borderWidth = newValue
            }
        }
        
        @IBInspectable var borderColor: UIColor? {
            get {
                guard let cgColor = layer.borderColor else {
                    return nil
                }
                return UIColor(cgColor: cgColor)
            }
            set { layer.borderColor = newValue?.cgColor }
        }
        
        @IBInspectable var shadowOpacity: CGFloat {
            get { return CGFloat(layer.shadowOpacity) }
            set { layer.shadowOpacity = Float(newValue) }
        }
        
        @IBInspectable var shadowOffset: CGSize {
            get { return layer.shadowOffset }
            set { layer.shadowOffset = newValue }
        }
        
        @IBInspectable var shadowColor: UIColor? {
            get {
                guard let cgColor = layer.shadowColor else {
                    return nil
                }
                return UIColor(cgColor: cgColor)
            }
            set { layer.shadowColor = newValue?.cgColor }
        }
}
