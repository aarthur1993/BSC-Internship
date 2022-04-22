//
//  NoteViewController.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 31.03.2022.
//

import UIKit

class NoteViewController: UIViewController {

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
        textTime.isUserInteractionEnabled = false
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
                                                           style: .done, target: self,
                                                           action: #selector(backToVC))
        view.addSubview(scrolls)
        scrolls.addSubview(time)
        scrolls.addSubview(notes)
        scrolls.addSubview(textT)
        textT.adjustableForKeyboard()
        textT.delegate = self
        notes.delegate = self
        time.delegate = self
        buttonRightSetting()
        constraintNote()
        constraintText()
        constraintTime()
        constraintScroll()
        dateTextTitle()
    }

    // MARK: - Method buttonRightSetting
    func buttonRightSetting() {
        barButton.title = "Готово"
        barButton.target = self
        barButton.isEnabled = true
        barButton.action = #selector(endEditingView)
        navigationItem.rightBarButtonItem = barButton
    }

    // MARK: - Method constraintScroll
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

    // MARK: - Method constraintText
    func constraintText() {
        textT.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: +5
        ).isActive = true
        textT.centerYAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerYAnchor,
            constant: +100
        ).isActive = true
        textT.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: +149
        ).isActive = true
        textT.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -145
        ).isActive = true
        textT.widthAnchor.constraint(
            equalToConstant: +350
        ).isActive = true
        textT.heightAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.heightAnchor, constant: +510
        ).isActive = true
        textT.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: +20
        ).isActive = true
        textT.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
    }

    // MARK: - Method constraintNote
    func constraintNote() {
        notes.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
        notes.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: +107
        ).isActive = true
        notes.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -700
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

    // MARK: - Method constraintTime
    func constraintTime() {
        time.centerXAnchor.constraint(
            equalTo: view.centerXAnchor,
            constant: 0
        ).isActive = true
        time.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: +121
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -747).isActive = true
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

    // MARK: - Method endEditingView
    @objc func endEditingView() {
        view.endEditing(true)
    }
    // MARK: - Method dateTextTitle
    func dateTextTitle() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy EEEE HH:mm"
        time.text = dateFormater.string(from: Date())
    }

    // MARK: - Method backToVC
    @objc func backToVC(send: UIButton) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        time.text = dateFormater.string(from: Date())
        delegateProtocol?.fetchDataView(textTime: time.text ?? "",
                                        textMesg: textT.text ?? "",
                                        titleNot: notes.text ?? "")
        navigationController?.popViewController(animated: true)
    }
}
