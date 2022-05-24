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

extension RoundedView {
    
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        let leftColor = UIColor().rgba(red: 1, green: 186, blue: 201, alpha: 1).cgColor
        let rightColor = UIColor().rgba(red: 50, green: 114, blue: 157, alpha: 1).cgColor
        
        gradientLayer.colors = [leftColor, rightColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
