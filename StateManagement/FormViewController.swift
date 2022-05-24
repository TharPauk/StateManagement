//
//  FormViewController.swift
//  StateManagement
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit
import RxSwift
import RxCocoa

class FormViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var residenceTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var createAccountButton: RoundedView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.addGradient()
        setupTextFieldObservers()
        
    }
    
    private func setupTextFieldObservers() {
        Observable.combineLatest(
            firstNameTextField.rx.text.orEmpty,
            lastNameTextField.rx.text.orEmpty,
            emailTextField.rx.text.orEmpty,
            dobTextField.rx.text.orEmpty,
            nationalityTextField.rx.text.orEmpty,
            residenceTextField.rx.text.orEmpty)
            .subscribe { [unowned self] firstName, lastName, email, dob, nationality, residence in
                let emptyFields = [firstName, lastName, email, dob, nationality, residence].filter { $0.isEmpty }
                emptyFields.isEmpty ? self.enableCreateAccountButton(): self.disableCreateAccountButton()
            }
            .disposed(by: disposeBag)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func enableCreateAccountButton() {
        createAccountButton.layer.sublayers?.first?.isHidden = false
        createAccountButton.isUserInteractionEnabled = true
    }
    
    private func disableCreateAccountButton() {
        createAccountButton.layer.sublayers?.first?.isHidden = true
        createAccountButton.isUserInteractionEnabled = false
    }
}
