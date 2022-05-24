//
//  FormViewController.swift
//  StateManagement
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit
import IHKeyboardAvoiding

class FormViewController: UIViewController {

    
    @IBOutlet weak var createAccountButton: RoundedView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createAccountButton.addGradient()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
