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
        lab.textColor = .black
        return lab
    }()

    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private var notes: UITextField = {
        let textTitle = UITextField()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.placeholder = Constants.notePlacholder
        textTitle.backgroundColor = Constants.noteLabelBackgroundColor
        textTitle.textAlignment = .left
        textTitle.font = Constants.noteLabelFont
        return textTitle
    }()

    private var text: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = Constants.textLabelColor
        textView.textAlignment = .left
        textView.becomeFirstResponder()
        textView.font = Constants.textLabelFont
        return textView
    }()

    private var time: UITextField = {
        let textTime = UITextField()
        textTime.translatesAutoresizingMaskIntoConstraints = false
        textTime.textAlignment = .center
        textTime.isUserInteractionEnabled = false
        textTime.font = Constants.timeLabelFont
        textTime.textColor = Constants.timeLabelColor
        return textTime
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = Constants.viewBackgroundColor
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.navigationButtonImage),
                                                           style: .done, target: self,
                                                           action: #selector(backToVC))
        view.addSubview(scrollView)
        scrollView.addSubview(time)
        scrollView.addSubview(notes)
        scrollView.addSubview(text)
        text.delegate = self
        notes.delegate = self
        text.adjustableForKeyboard()
        setupConstraintNote()
        setupConstraintText()
        setupConstraintTime()
        setupConstraintScroll()
        dateTextTitle()

        buttonRightSetting()
    }

    // MARK: - Private
    private func buttonRightSetting() {
        barButton.title = Constants.barbuttonText
        barButton.isEnabled = false
        barButton.target = self
        barButton.action = #selector(endEdit)
        navigationItem.rightBarButtonItem = barButton
    }

    // MARK: - Private
    @objc private func endEdit() {
        if text.text != nil, notes.text != nil {
            barButton.title = ""
            view.endEditing(true)
        }
    }

    // MARK: - Private
    private func setupConstraintScroll() {
        scrollView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        scrollView.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor
        ).isActive = true
        scrollView.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor
        ).isActive = true
        scrollView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintTime() {
        time.topAnchor.constraint(
            equalTo: scrollView.topAnchor,
            constant: Constants.timeTopAnchor
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: notes.bottomAnchor,
            constant: Constants.timeBottomAnchor
        ).isActive = true
        time.leftAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.leftAnchor,
            constant: Constants.constantLeft
        ).isActive = true
        time.rightAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.rightAnchor,
            constant: Constants.constantRight
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintNote() {
        notes.topAnchor.constraint(
            equalTo: time.topAnchor,
            constant: Constants.noteTopAnchor
        ).isActive = true
        notes.bottomAnchor.constraint(
            equalTo: text.bottomAnchor,
            constant: Constants.noteBottomAnchor
        ).isActive = true
        notes.leftAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.leftAnchor,
            constant: Constants.constantLeft
        ).isActive = true
        notes.rightAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.rightAnchor,
            constant: Constants.constantRight
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintText() {
        text.topAnchor.constraint(
            equalTo: notes.topAnchor,
            constant: Constants.textTopAnchor
        ).isActive = true
        text.bottomAnchor.constraint(
            equalTo: scrollView.bottomAnchor,
            constant: Constants.textBottomAnchor
        ).isActive = true
        text.leftAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.leftAnchor,
            constant: Constants.constantLeft
        ).isActive = true
        text.rightAnchor.constraint(
            equalTo: scrollView.safeAreaLayoutGuide.rightAnchor,
            constant: Constants.constantRight
        ).isActive = true
    }

    // MARK: - Private
    private func dateTextTitle() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = Constants.dateFormat
        time.text = dateFormater.string(from: Date())
    }

    // MARK: - Private
    @objc private func backToVC(send: UIButton) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = Constants.dateForm
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

// MARK: - Constants
extension NoteViewController {
    private enum Constants {

        static let viewBackgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        static let navigationButtonImage = "chevron.left"

        static let barbuttonText = "Готово"

        static let dateFormat = "dd.MM.yyyy EEEE HH:mm"
        static let dateForm = "dd.MM.yyyy"

        static let notePlacholder = "Введите название"
        static let noteLabelBackgroundColor = UIColor(red: 249/255, green: 250/255, blue: 1254/255, alpha: 1)
        static let noteLabelFont = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.medium)

        static let textLabelColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        static let textLabelFont = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)

        static let timeLabelFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        static let timeLabelColor =  UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)

        // MARK: - Constraint constants
        static let timeTopAnchor: CGFloat = +15
        static let timeBottomAnchor: CGFloat = -60

        static let textBottomAnchor: CGFloat = -20
        static let textTopAnchor: CGFloat = +60

        static let noteTopAnchor: CGFloat = +60
        static let noteBottomAnchor: CGFloat = -450

        static let constantLeft: CGFloat = +20
        static let constantRight: CGFloat = -20
    }
}
