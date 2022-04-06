//
//  NoteViewController.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 31.03.2022.
//

import UIKit

class NoteViewController: UIViewController {
    private let defaults = UserDefaults.standard
    lazy var datePicker: UIDatePicker = {
        let pickerData = UIDatePicker()
        pickerData.translatesAutoresizingMaskIntoConstraints = false
        pickerData.preferredDatePickerStyle = .wheels
        pickerData.sizeToFit()
        pickerData.datePickerMode = .date
        pickerData.addTarget(self, action: #selector(notificationMessage), for: .valueChanged)
        return pickerData
    }()
    private let rightBarButtonItem = UIBarButtonItem()
    private var isEditingMod = false
    private let textField: UITextField = {
        let textF = UITextField()
         textF.textColor = UIColor.black
         textF.placeholder = "Заголовок"
         textF.textAlignment = .center
         textF.font = UIFont.systemFont(ofSize: 22.0, weight: UIFont.Weight.bold)
        return textF
    }()
    private var textFieldDate: UITextField = {
         let dateText = UITextField()
         dateText.borderStyle = .roundedRect
         dateText.placeholder = "Data add"
         dateText.textAlignment = .center
         dateText.leftViewMode = UITextField.ViewMode.always
         return dateText
     }()
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
    private var textViewText: UITextView? {
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
    // MARK: - Inheritance
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(textField)
        view.addSubview(textFieldDate)
        view.addSubview(textViewData)
        buttonRightSetting()
        constraint()
        textViewData.text = defaults.string(forKey: "textW")
        textFieldDate.inputView = datePicker
    }
    // MARK: - Methods constraint
    func constraint() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                           constant: 0).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: +80).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 380).isActive = true

        textFieldDate.translatesAutoresizingMaskIntoConstraints = false
        textFieldDate.centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                           constant: 0).isActive = true
        textFieldDate.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: +135).isActive = true
        textFieldDate.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textFieldDate.widthAnchor.constraint(equalToConstant: 380).isActive = true

        textViewData.translatesAutoresizingMaskIntoConstraints = false
        textViewData.centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                              constant: 0).isActive = true
        textViewData.topAnchor.constraint(equalTo: view.topAnchor,
                                          constant: +190).isActive = true
        textViewData.heightAnchor.constraint(equalToConstant: 560).isActive = true
        textViewData.widthAnchor.constraint(equalToConstant: 380).isActive = true
   }
   // MARK: - Methods buttonRightSetting
   func buttonRightSetting() {
      rightBarButtonItem.title = "Готово"
      rightBarButtonItem.target = self
      rightBarButtonItem.action = #selector(rightBarButtonTapAndSaveUserDefault)
      navigationItem.rightBarButtonItem = rightBarButtonItem
   }
    // MARK: - Methods methodAlert
    func methodAlert() {
        let alertController = UIAlertController(title: "Danger Error :)", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Вы не заполнили заметку!", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    // MARK: - Methods notificationMessage
    @objc func notificationMessage() {
        getDateFromPicker(NotificationManager(title: textField.text ?? "Error",
                                              textview: textViewData.text,
                                              notification: .order))
    }
    // MARK: - Methods getDateFromPicker
    func getDateFromPicker(_ dailyMessage: NotificationManager) {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM-dd-yyyy"
            textFieldDate.text = dateformatter.string(from: (datePicker.date))
        switch dailyMessage.notification {
        case .order:
            print("""
                  Heading: \(dailyMessage.title),
                  From Data: \(dateformatter.string(from: (datePicker.date))),
                  NoteText: \(dailyMessage.textview)
                  """)
        case .cancel(let message):
            print("daily canceled because \(message)")
    }
  }
}
// MARK: - Methods rightBarButtonTapAndSaveUserDefault
extension NoteViewController {
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
