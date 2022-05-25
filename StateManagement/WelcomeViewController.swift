//
//  ViewController.swift
//  StateManagement
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var loginWithFacebookButton: RoundedView!
    @IBOutlet weak var loginWithEmailButton: RoundedView!
    @IBOutlet weak var createAccountButton: RoundedView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.addGradient()
    }


}



