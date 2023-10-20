//
//  UIViewController + Extensions.swift
//  Rock-Paper-Scissors
//
//  Created by Anton Morenko on 07.10.2023.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okButton)
        
        present(alertController, animated: true)
    }
    
    public func goToGameView() {
        let mainGameScreen = SetupViewController()
        mainGameScreen.modalPresentationStyle = .fullScreen
        present(mainGameScreen, animated: true)
    }
    
    //MARK: - Setting Keyboard
        public func setupDismissKeyboardGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
        }
        
        @objc private func dismissKeyboard() {
            view.endEditing(true)
        }
        
        public func setupKeyboardHiding() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc private func keyboardWillShow(_ notification: Notification) {
            guard let userInfo = notification.userInfo,
                  let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
                  let currentTextField = UIResponder.currentFirst() as? UITextField else {
                return
            }
            
            let keyboardTopY = keyboardFrame.cgRectValue.origin.y
            let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
            let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
            
            if textFieldBottomY > keyboardTopY {
                let textBoxY = convertedTextFieldFrame.origin.y
                let newFrameY = (textBoxY - keyboardTopY / 2) * -1
                view.frame.origin.y = newFrameY
            }
        }
        
        @objc private func keyboardWillHide(_ notification: Notification) {
            view.frame.origin.y = 0
        }
    }

    //MARK: - UIResponder
    extension UIResponder {
        
        private struct Static {
            static weak var responder: UIResponder?
        }
        
        static func currentFirst() -> UIResponder? {
            Static.responder = nil
            UIApplication.shared.sendAction(#selector(UIResponder.trap), to: nil, from: nil, for: nil)
            return Static.responder
        }
        
        @objc private func trap() {
            Static.responder = self
        }
    }

