//
//  SpringAnimationsViewController.swift
//  AnimationDev
//
//  Created by David Kababyan on 17/11/2018.
//  Copyright © 2018 David Kababyan. All rights reserved.
//

import UIKit

class SpringAnimationsViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginSegmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButtonOutlet: UIButton!
    
    @IBOutlet weak var textfieldContainerView: UIView!
    //MARK: Class vars
    let repeatPasswordTextField = UITextField()
    
    
    
    //MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRepeatPasswordTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Todo: Animation setup
        self.titleLabel.alpha = 0
        self.continueButtonOutlet.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitleLabel()
        animateContinueButton()
    }
    
    private func animateContinueButton() {
        UIView.transition(with: self.continueButtonOutlet, duration: 2, options: .transitionFlipFromTop, animations: {
            self.continueButtonOutlet.alpha = 1
        }) { (completed) in
            
        }
    }
    
    private func addTextFieldWithAnimation() {
        UIView.transition(with: self.textfieldContainerView, duration: 0.5, options: .transitionFlipFromTop, animations: {
            self.textfieldContainerView.addSubview(self.repeatPasswordTextField)
        }) { (completed) in
            
        }
    }
    
    private func moveContinueButtonDown() {
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.curveEaseOut], animations: {
            self.continueButtonOutlet.frame.origin.y += 50
        }, completion: nil)
    }
    
    private func moveContinueButtonUp() {
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.curveEaseOut], animations: {
            self.continueButtonOutlet.frame.origin.y -= 50
        }, completion: nil)
    }
    
    private func removeTextFieldWithAnimation() {
        UIView.transition(with: self.textfieldContainerView, duration: 0.5, options: .curveEaseIn, animations: {
            self.repeatPasswordTextField.removeFromSuperview()
        }) { (completed) in
            
        }
    }
    
    private func animateTitleLabel() {
        UIView.animate(withDuration: 2, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [.curveEaseOut], animations: {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y += 100
        }, completion: nil)
    }
    
    //MARK: IBActions
    @IBAction func loginSegmentControllerValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            addTextFieldWithAnimation()
            moveContinueButtonDown()
        } else {
            removeTextFieldWithAnimation()
            moveContinueButtonUp()
        }
        
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        sender.frame.origin.y -= 20
        sender.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
            sender.alpha = 1
            sender.frame.origin.y += 20
            sender.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    
    
    
    // MARK: Animations & Transitions
    
    
    
    //MARK: Setup UI
    func createRepeatPasswordTextField() {
        
        repeatPasswordTextField.frame = CGRect(x: 0, y: (passwordTextField.frame.origin.y + passwordTextField.frame.size.height + 8), width: 225, height: 35)
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.backgroundColor = .white
        repeatPasswordTextField.layer.cornerRadius = 5.0
        repeatPasswordTextField.font = UIFont.systemFont(ofSize: 14)
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.contentVerticalAlignment = .center
    }
    
    
}
