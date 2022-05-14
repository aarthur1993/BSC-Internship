//
//  NoteView+Extension.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 20.04.2022.
//

import Foundation
import UIKit

// MARK: - Method UITextViewDelegate
extension NoteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        barButton.isEnabled = true
        barButton.title = "Готово"
    }
}

// MARK: - Method UITextFieldDelegate
extension NoteViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        barButton.isEnabled = true
        barButton.title = "Готово"
    }
}

// MARK: - Method adjustableForKeyboard
extension UITextView {
    func adjustableForKeyboard() {
        let notoficationCenter = NotificationCenter.default
        notoficationCenter.addObserver(
            self,
            selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        notoficationCenter.addObserver(
            self,
            selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
    }
    @objc private func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue =
                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                NSValue else { return }
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = convert(keyboardScreenEndFrame, from: window)
        if notification.name == UIResponder.keyboardWillHideNotification {
            contentInset = .zero
        } else {
            contentInset = UIEdgeInsets(top: 0,
                                        left: 0,
                                        bottom: keyboardViewEndFrame.height - safeAreaInsets.bottom,
                                        right: 0)
        }
        scrollIndicatorInsets = contentInset
        scrollRangeToVisible(selectedRange)
    }
}
