//
//  NoteViewController.swift
//  BasicNote
//
//  Created by Arthur111 Magomedov on 24.03.2022.
//

import UIKit

class NoteViewController: UIViewController {
    // MARK: - Internal properties defaults
    private let defaults = UserDefaults.standard
    // MARK: - Internal properties rightBarButtonItem
    private let rightBarButtonItem = UIBarButtonItem()
    // MARK: - Internal properties isEditingMod
    private var isEditingMod = false
    // MARK: - Internal properties textField
    private let textField: UITextField = {
        let textF = UITextField()
         textF.textColor = UIColor.black
         textF.placeholder = "Заголовок"
         textF.textAlignment = .center
         textF.font = UIFont.systemFont(ofSize: 22.0, weight: UIFont.Weight.bold)
        return textF
    }()
    private let textViewData: UITextView = {
        let textView = UITextView()
         textView.textColor = UIColor.black
         textView.textAlignment = .left
         textView.becomeFirstResponder()
         textView.layer.shadowRadius = 3
         textView.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
        return textView
    }()

    override func viewDidLoad() {
        buttonRightSetting()
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(textViewData)
        textViewData.text = defaults.string(forKey: "textW")
        constraintTextView()
   }
    // MARK: - Method constraintTextView
    func constraintTextView() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: +10).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                        constant: -650).isActive = true

        textViewData.widthAnchor.constraint(equalToConstant: 350).isActive = true
        textViewData.heightAnchor.constraint(equalToConstant: 350).isActive = true
        textViewData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textViewData.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                       constant: -100).isActive = true
        textViewData.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: +60).isActive = true
        textViewData.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                        constant: 0).isActive = true

        textViewData.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Method buttonRightSetting
    func buttonRightSetting() {
        rightBarButtonItem.title = "Готово"
        rightBarButtonItem.target = self
        rightBarButtonItem.action = #selector(rightBarButtonTapAndSaveUserDefault)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    // MARK: - Method rightBarButtonTapAndSaveUserDefault
    @objc func rightBarButtonTapAndSaveUserDefault(_ sender: Any) {
            let textW = textViewData.text
              isEditingMod = !isEditingMod
        textViewData.isUserInteractionEnabled = isEditingMod

                if isEditingMod == false {
                     defaults.set(textW, forKey: "textW")
                     rightBarButtonItem.title = "Готово"
                    textField.isUserInteractionEnabled = true
                    textField.resignFirstResponder()
                    textViewData.resignFirstResponder()
                    textViewData.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
