//
//  ViewController.swift
//  StateManagement
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var createAccountButton: RoundedView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
    }


    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = createAccountButton.bounds
        let leftColor = UIColor().rgba(red: 1, green: 186, blue: 201, alpha: 1).cgColor
        let rightColor = UIColor().rgba(red: 50, green: 114, blue: 157, alpha: 1).cgColor
        gradientLayer.colors = [leftColor, rightColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        createAccountButton.layer.insertSublayer(gradientLayer, at: 0)
    }
}

