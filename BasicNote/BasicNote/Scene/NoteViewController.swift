//
//  NoteViewController.swift
//  BasicNote
//
//  Created by Arthur111 Magomedov on 24.03.2022.
//

import UIKit

class NoteViewController: UIViewController  {
   
    //MARK: -Internal properties defaults
    private let defaults = UserDefaults.standard
    
    //MARK: -Internal properties rightBarButtonItem
    private let rightBarButtonItem = UIBarButtonItem()

    //MARK: -Internal properties isEditingMod
    private var isEditingMod = false
    
    //MARK: -Internal properties textTetView
    private let textTetView: UITextView = {
        let text = UITextView()
         text.textColor = UIColor.black
         text.layer.shadowRadius = 3
         text.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
         text.layer.borderWidth = 1
         text.textAlignment = .center
         text.layer.cornerRadius = 30
         text.layer.shadowColor = UIColor.black.cgColor
         text.layer.shadowOpacity = 2
         text.layer.backgroundColor = UIColor.opaqueSeparator.cgColor
         text.layer.borderColor = UIColor.black.cgColor
        return text
    }()
    
    //MARK: -Live cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
       
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22.0, weight: UIFont.Weight.bold)]
        
        view.addSubview(textTetView)
        textTetView.text = defaults.string(forKey: "textW")
        
        constraintTextView()
        buttonRightSetting()
        navigationTitleRedact()
    }
    
    //MARK: -Method constraintTextView
    func constraintTextView() {
        textTetView.translatesAutoresizingMaskIntoConstraints = false
        
        textTetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        textTetView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        textTetView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: +1).isActive = true
        textTetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
       textTetView.isUserInteractionEnabled = false
    }
   
    //MARK: - Method buttonRightSetting
    func buttonRightSetting() {
        rightBarButtonItem.title = "Добавить"
        rightBarButtonItem.tintColor = .black
        rightBarButtonItem.target = self
        rightBarButtonItem.action = #selector(rightBarButtonTapAndSaveUserDefault(_ :))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    //MARK: - Method navigationTitleRedact
    func navigationTitleRedact() {
        let alertControl = UIAlertController(title: "BasicNote", message: "Хотите поменять title?", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Пропустить", style: .default) { [weak self]
            (actionCancel) in
            guard let self = self else {return}
            
            self.textTetView.becomeFirstResponder()
            self.dismiss(animated: true)
        }
        
        let actionAdd = UIAlertAction(title: "Изменить", style: .default) { [weak self] (actionAdd) in
            let textFilds = alertControl.textFields?.first?.text
           
            guard let self = self else {return}
            
            self.navigationItem.title = textFilds
            self.textTetView.becomeFirstResponder()
        }
        alertControl.addTextField { textField in
            textField.placeholder = "Введите название title"
            textField.font = UIFont.preferredFont(forTextStyle: .subheadline)
        }
        alertControl.addAction(actionAdd)
        alertControl.addAction(actionCancel)
        present(alertControl, animated: true, completion: nil)
    }
    
    //MARK: - Method rightBarButtonTapAndSaveUserDefault
    @objc func rightBarButtonTapAndSaveUserDefault(_ sender: Any) {
            let textW = textTetView.text
              isEditingMod = !isEditingMod
              textTetView.isUserInteractionEnabled = isEditingMod
            
                if isEditingMod == true {
                     defaults.set(textW, forKey: "textW")
                     rightBarButtonItem.title = "Добавить"
                     textTetView.becomeFirstResponder()
                } else if isEditingMod == false {
                   // defaults.removeObject(forKey: "textW")
                     rightBarButtonItem.title = "Изменить"
                     textTetView.resignFirstResponder()
        }
    }
}

