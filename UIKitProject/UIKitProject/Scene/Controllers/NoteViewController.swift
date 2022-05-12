//
//  NoteViewController.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 31.03.2022.
//

import UIKit

class NoteViewController: UIViewController {

    weak var delegateProtocol: ListViewControllerDataSource?

    @objc let barButton = UIBarButtonItem()

    private var identifire: UUID?

    private let label: UILabel = {
        let lab = UILabel()
        lab.isHidden = true
        lab.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        lab.textColor = .black
        return lab
    }()

    private let scrolls: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private  var time: UITextField = {
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

    private var notes: UITextField = {
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

    private var text: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.black
        textView.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textView.textAlignment = .center
        textView.textAlignment = .left
        textView.becomeFirstResponder()
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
        scrolls.addSubview(text)
        text.delegate = self
        notes.delegate = self
        text.adjustableForKeyboard()
        constraintNote()
        constraintText()
        constraintTime()
        constraintScroll()
        dateTextTitle()

        buttonRightSetting()
    }

    // MARK: - Method buttonRightSetting
    func buttonRightSetting() {
        barButton.title = "Готово"
        barButton.isEnabled = false
        barButton.target = self
        barButton.action = #selector(endEdit)
        navigationItem.rightBarButtonItem = barButton
    }

    @objc func endEdit() {
        if text.text != nil, notes.text != nil {
            barButton.isEnabled = false
            view.endEditing(true)
        }
    }

    // MARK: - Method constraintScroll
    func constraintScroll() {
        scrolls.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        scrolls.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor
        ).isActive = true
        scrolls.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor
        ).isActive = true
        scrolls.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
    }

    // MARK: - Method constraintTime
    func constraintTime() {
        time.topAnchor.constraint(
            equalTo: scrolls.topAnchor,
            constant: +15
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: notes.bottomAnchor,
            constant: -60
        ).isActive = true
        time.leftAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        time.rightAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
    }

    // MARK: - Method constraintNote
    func constraintNote() {
        notes.topAnchor.constraint(
            equalTo: time.topAnchor,
            constant: +60
        ).isActive = true
        notes.bottomAnchor.constraint(
            equalTo: text.bottomAnchor,
            constant: -450
        ).isActive = true
        notes.leftAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.leftAnchor,
            constant: +20
        ).isActive = true
        notes.rightAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
    }

    // MARK: - Method constraintText
    func constraintText() {
        text.topAnchor.constraint(
            equalTo: notes.topAnchor,
            constant: +60
        ).isActive = true
        text.bottomAnchor.constraint(
            equalTo: scrolls.bottomAnchor,
            constant: -145
        ).isActive = true
        text.leftAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.leftAnchor,
            constant: +20
        ).isActive = true
        text.rightAnchor.constraint(
            equalTo: scrolls.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
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
        delegateProtocol?.fetchDataView(id: identifire ?? UUID(),
                                        time: time.text ?? "",
                                        message: text.text ?? "",
                                        title: notes.text ?? "")
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Method update
    func update(id: UUID, note: String, message: String, data: String) {
        identifire = id
        notes.text = note
        text.text = message
        time.text = data
    }
}
