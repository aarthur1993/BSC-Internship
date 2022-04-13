//
//  NoteViewController.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 31.03.2022.
//

import UIKit

class NoteViewOneGesture: UIViewController {
    var delegateProtocol: SomeProtocol?
    @objc let barButton = UIBarButtonItem()
    let label: UILabel = {
        let lab = UILabel()
        lab.isHidden = true
        lab.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        lab.textColor = .black
        return lab
    }()
    let scrolls: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    var time: UITextField = {
        let textTime = UITextField()
        textTime.translatesAutoresizingMaskIntoConstraints = false
        textTime.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        textTime.textAlignment = .center
        textTime.textColor = .red
        textTime.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        textTime.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        return textTime
    }()
     var notes: UITextField = {
        let textTitle = UITextField()
         textTitle.translatesAutoresizingMaskIntoConstraints = false
         textTitle.placeholder = "Введите название"
         textTitle.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
         textTitle.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 1254/255, alpha: 1)
         textTitle.textAlignment = .left
         textTitle.font = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.medium)
         textTitle.text = ""
        return textTitle
    }()
     var textT: UITextView = {
        let textView = UITextView()
         textView.translatesAutoresizingMaskIntoConstraints = false
         textView.becomeFirstResponder()
         textView.textColor = UIColor.black
         textView.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
         textView.textAlignment = .center
         textView.text = """
        """
         textView.textAlignment = .left
         textView.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)
        return textView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
            style: .done, target: self, action: #selector(backToVC(send:)))
        view.addSubview(scrolls)
        scrolls.addSubview(time)
        scrolls.addSubview(notes)
        scrolls.addSubview(textT)
        textT.adjustableForKeyboard()
        textT.delegate = self
        notes.delegate = self
        time.delegate = self
        dateText()
        buttonRightSetting()
        constraintNote()
        constraintText()
        constraintTime()
        constraintScroll()
    }
    func buttonRightSetting() {
          barButton.title = "Готово"
          barButton.target = self
          barButton.isEnabled = true
          barButton.action = #selector(endEditingView)
          navigationItem.rightBarButtonItem = barButton
    }
      func constraintScroll() {
        scrolls.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        scrolls.leftAnchor.constraint(
           equalTo: view.leftAnchor).isActive = true
        scrolls.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor
        ).isActive = true
        scrolls.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
    }
    func constraintText() {
        textT.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        textT.topAnchor.constraint(
            equalTo: view.topAnchor, constant: +189
        ).isActive = true
        textT.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -145
        ).isActive = true
        textT.heightAnchor.constraint(
            equalTo: scrolls.heightAnchor
        ).isActive = true
        textT.widthAnchor.constraint(
            equalToConstant: -40
        ).isActive = true
        textT.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 20
        ).isActive = true
        textT.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
    }
    func constraintNote() {
        notes.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        notes.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: +137
        ).isActive = true
        notes.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -683
        ).isActive = true
        notes.heightAnchor.constraint(
            equalToConstant: 24
        ).isActive = true
        notes.widthAnchor.constraint(
            equalToConstant: 300
        ).isActive = true
        notes.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
        notes.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -70
        ).isActive = true
    }
    func constraintTime() {
        time.centerXAnchor.constraint(
            equalTo: view.centerXAnchor,
            constant: 0
        ).isActive = true
        time.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: +101
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -727
        ).isActive = true
        time.heightAnchor.constraint(
            equalToConstant: 16
        ).isActive = true
        time.widthAnchor.constraint(
            equalToConstant: 350
        ).isActive = true
        time.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
        time.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
    }

    @objc func endEditingView() {
        view.endEditing(true)
    }
    func dateText() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy EEEE HH:mm"
        time.placeholder = dateFormater.string(from: Date())
    }
    @objc func backToVC(send: UIButton) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        time.placeholder = dateFormater.string(from: Date())
        guard let time = time.text else {return}
        guard let message = textT.text else {return}
        guard let note = notes.text else {return}
        switch label.text {
        case "1": delegateProtocol?.fetchDataViewOne(textTimeOne: time, textMesgOne: message, titleNotOne: note)
        case "2": delegateProtocol?.fetchDataViewTwo(textTimeTwo: time, textMesgTwo: message, titleNotTwo: note)
        case "3": delegateProtocol?.fetchDataViewThree(textTimeThre: time, textMesgThre: message, titleNotThre: note)
        case "4": delegateProtocol?.fetchDataViewFour(textTimeFour: time, textMesgFour: message, titleNotFour: note)
        case "5": delegateProtocol?.fetchDataViewFive(textTimeFive: time, textMesgFive: message, titleNotFive: note)
        case "6": delegateProtocol?.fetchDataViewSix(textTimeSix: time, textMesgSix: message, titleNotSix: note)
        case "7": delegateProtocol?.fetchDataViewSeven(textTimeSeven: time, textMesgSeven: message, titleNotSeven: note)
        default:
            break
        }
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = true
    }
}

extension NoteViewOneGesture: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
         barButton.isEnabled = false
    }
    func textViewDidChangeSelection(_ textView: UITextView) {
         barButton.isEnabled = true
    }
}

extension NoteViewOneGesture: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        barButton.isEnabled = false
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        barButton.isEnabled = true
    }
}
