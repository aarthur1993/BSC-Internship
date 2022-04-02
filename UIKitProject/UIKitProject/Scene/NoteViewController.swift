//
//  NoteViewController.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 31.03.2022.
//

import UIKit

class NoteViewController: UIViewController {
    // MARK: - private properties defaults
    private let defaults = UserDefaults.standard
    // MARK: - lazy properties datePicker
    lazy var datePicker: UIDatePicker = {
        let pickerData = UIDatePicker()
        pickerData.preferredDatePickerStyle = .wheels
        pickerData.sizeToFit()
        pickerData.datePickerMode = .date
        pickerData.addTarget(self, action: #selector(doneAction), for: .valueChanged)
        return pickerData
    }()
    // MARK: - private properties rightBarButtonItem
    private let rightBarButtonItem = UIBarButtonItem()
    // MARK: - private properties isEditingMod
    private var isEditingMod = false
    // MARK: - private properties textField
    private let textField: UITextField = {
        let textF = UITextField()
         textF.textColor = UIColor.black
         textF.placeholder = "Заголовок"
         textF.textAlignment = .center
         textF.font = UIFont.systemFont(ofSize: 22.0, weight: UIFont.Weight.bold)
        return textF
    }()
    // MARK: - private properties textFieldDate
    private var textFieldDate: UITextField = {
         let dateText = UITextField()
         dateText.borderStyle = .roundedRect
         dateText.placeholder = "Data add"
         dateText.textAlignment = .center
         dateText.leftViewMode = UITextField.ViewMode.always
         return dateText
     }()
    // MARK: - private properties textViewData
    private var textViewData: UITextView = {
        let textView = UITextView()
         textView.textColor = UIColor.black
         textView.textAlignment = .left
         textView.becomeFirstResponder()
         textView.layer.cornerRadius = 10
         textView.layer.shadowRadius = 3
         textView.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
        return textView
    }()
    // MARK: - fileprivate properties textViewText
    fileprivate var textViewText: UITextView? {
           get {
               if textViewData.text.isEmpty == true {
                   methodAlert()
               } else if textViewData.text.isEmpty == false {
                   textViewData.resignFirstResponder()
               }
               return textViewData
           }
           set {
               guard let newValue = newValue else {return}
               textViewData = newValue
           }
    }
    // MARK: - LiveCycle
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(textField)
        view.addSubview(textFieldDate)
        view.addSubview(textViewData)
        buttonRightSetting()
        constraint()
        textViewData.text = defaults.string(forKey: "textW")
        textFieldDate.inputView = datePicker
    }
    // MARK: - Method constraint
    func constraint() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                  constant: +10).isActive = true
        textField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                    constant: -760).isActive = true
        textFieldDate.translatesAutoresizingMaskIntoConstraints = false
        textFieldDate.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textFieldDate.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textFieldDate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldDate.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textFieldDate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: +70).isActive = true
        textFieldDate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -700).isActive = true

        textViewData.widthAnchor.constraint(equalToConstant: 350).isActive = true
        textViewData.heightAnchor.constraint(equalToConstant: 350).isActive = true
        textViewData.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textViewData.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                   constant: -100).isActive = true
        textViewData.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                   constant: +130).isActive = true
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
    // MARK: - Method methodAlert
    func methodAlert() {
        let alertController = UIAlertController(title: "Danger Error :)", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Вы не заполнили заметку!", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    // MARK: - Method doneAction
    @objc func doneAction() {
            getDateFromPicker()
    }
    // MARK: - Method getDateFromPicker
    func getDateFromPicker() {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            textFieldDate.text = formatter.string(from: datePicker.date)
  }
}
// MARK: - extension NoteViewController
extension NoteViewController {
    // MARK: - Method @objc rightBarButtonTapAndSaveUserDefault
    @objc func rightBarButtonTapAndSaveUserDefault(_ sender: Any) {
        let textW = textViewData.text
        if textViewData.text.isEmpty == true {
            rightBarButtonItem.title = "Готово"
            textViewText?.text = textViewData.text
            textField.becomeFirstResponder()
            textViewData.becomeFirstResponder()
        } else if textViewData.text.isEmpty == false {
            defaults.set(textW, forKey: "textW")
            textViewText?.text = textViewData.text
            textFieldDate.resignFirstResponder()
            textField.resignFirstResponder()
        }
    }
}
