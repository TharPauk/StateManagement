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
    
    
    
    // MARK: - IBOutlets
    
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
    
    
    
    // MARK: - Properties
    
    private var isValidMail = BehaviorRelay<Bool>(value: false)
    private var isValidMailObservable: Observable<Bool> {
        return isValidMail.asObservable()
    }
    
    private var isValidDate = BehaviorRelay<Bool>(value: false)
    private var isValidDateObservable: Observable<Bool> {
        return isValidDate.asObservable()
    }
    
    private var areValidInputs = BehaviorRelay<Bool>(value: false)
    private var areValidInputsObservable: Observable<Bool> {
        return areValidInputs.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    
    
    
    // MARK: - LifeCycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.addGradient()
        setupButtonObserver()
        setupTextFieldObservers()
        setupEmailObserver()
        setupDOBObserver()
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




// MARK: - Observer Functions

extension FormViewController {
    
    private func setupButtonObserver() {
        Observable.combineLatest(
            areValidInputsObservable,
            isValidMailObservable,
            isValidDateObservable)
            .subscribe { [unowned self] inputsValid, mailValid, dateValid in
                let shouldEnableButton = inputsValid && mailValid && dateValid
                shouldEnableButton ? self.enableCreateAccountButton(): self.disableCreateAccountButton()
            }
            .disposed(by: disposeBag)
    }
    
    private func setupTextFieldObservers() {
        Observable.combineLatest(
            firstNameTextField.rx.text.orEmpty,
            lastNameTextField.rx.text.orEmpty,
            nationalityTextField.rx.text.orEmpty,
            residenceTextField.rx.text.orEmpty)
            .subscribe { [unowned self] firstName, lastName, nationality, residence in
                let emptyFields = [firstName, lastName, nationality, residence].filter { $0.isEmpty }
                self.areValidInputs.accept(emptyFields.isEmpty)
            }
            .disposed(by: disposeBag)
        
    }
    
    private func setupEmailObserver() {
        emailTextField.rx.controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
                let isValid = self.emailTextField.text?.isValidEmail() ?? false
                
                if !isValid {
                    self.alertMessage(title: "Invalid Email", message: "Email is invalid.")
                }
                isValidMail.accept(isValid)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupDOBObserver() {
        dobTextField.rx.controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
                let isValid = self.dobTextField.text?.isValidDate() ?? false
                
                if !isValid {
                    self.alertMessage(title: "Invalid Date", message: "Date of birth is invalid.")
                }
                isValidDate.accept(isValid)
            })
            .disposed(by: disposeBag)
    }
}





// MARK: - Alert Message

extension FormViewController {
    
    private func alertMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
}
