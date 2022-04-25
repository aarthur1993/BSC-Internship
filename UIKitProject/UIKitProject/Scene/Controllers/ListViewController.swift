//
//  ListViewController.swift
//  test
//
//  Created by Arthur111 Magomedov on 08.04.2022.
//

import UIKit

protocol SomeProtocol: AnyObject {
    func fetchDataView(id: UUID, textTime: String, textMesg: String, titleNot: String)
}

class ListViewController: UIViewController, SomeProtocol {

    var note = [Note]()

    lazy var scroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.layer.backgroundColor = UIColor.yellow.cgColor
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.indicatorStyle = .white
        scrollView.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return scrollView
    }()

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap
    }()

    lazy var titl: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .center
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.text = "Заметки"
        textTitle.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        return textTitle
    }()

    lazy var plusButton: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(UIImage(named: "+"), for: .normal)
        buttonPlus.setImage(UIImage(named: "Ellipse 2"), for: .highlighted)
        buttonPlus.clipsToBounds = true
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        buttonPlus.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = 24
        buttonPlus.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return buttonPlus
    }()

    var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4.0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill

        stackView.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        navigationController?.hidesBarsOnSwipe = true
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        view.addSubview(scroll)
        scroll.addSubview(stackView)
        view.addSubview(plusButton)
        view.addSubview(titl)
        constraintTitlText()
        constraintPlusButton()
        constraint()
    }

    // MARK: - Method addNoteForStack
    func constraint() {
        scroll.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: +0).isActive = true
        scroll.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: +0).isActive = true
        scroll.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        scroll.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +0).isActive = true
        scroll.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0).isActive = true

        stackView.centerXAnchor.constraint(
            equalTo: scroll.safeAreaLayoutGuide.centerXAnchor, constant: +10).isActive = true
        stackView.topAnchor.constraint(
            equalTo: scroll.topAnchor, constant: +40).isActive = true
        stackView.bottomAnchor.constraint(
           equalTo: scroll.bottomAnchor, constant: -749).isActive = true
        stackView.widthAnchor.constraint(
            equalToConstant: +358).isActive = true
        stackView.heightAnchor.constraint(
            equalToConstant: -1).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +16).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true

    }

    // MARK: - Method addNoteForStack
    func addNoteForStack(noteView: NoteView, stack: UIStackView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(gestureTap(_:)))
        noteView.addGestureRecognizer(tap)

        noteView.backgroundColor = UIColor.white
        noteView.layer.cornerRadius = 15
        noteView.note.textAlignment = .left
        noteView.note.textColor = .black
        noteView.time.textColor = .black
        noteView.message.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        noteView.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
        noteView.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        noteView.message.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)

        stack.addArrangedSubview(noteView.note)
        stack.addArrangedSubview(noteView.message)
        stack.addArrangedSubview(noteView.time)
        stack.addArrangedSubview(noteView)
        noteView.addSubview(noteView.note)
        noteView.addSubview(noteView.message)
        noteView.addSubview(noteView.time)

        noteView.heightAnchor.constraint(equalToConstant: +90).isActive = true
        noteView.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: +0).isActive = true
        noteView.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -0).isActive = true

        noteView.note.topAnchor.constraint(equalTo: noteView.topAnchor, constant: +10).isActive = true
        noteView.note.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: +15).isActive = true
        noteView.message.topAnchor.constraint(equalTo: noteView.topAnchor, constant: +30).isActive = true
        noteView.message.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: +15).isActive = true
        noteView.time.topAnchor.constraint(equalTo: noteView.topAnchor, constant: +70).isActive = true
        noteView.time.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: +15).isActive = true
}
    // MARK: - Method gestureTap
    @objc func gestureTap(_ sender: UITapGestureRecognizer? = nil) {

        guard let currentNoteView = sender?.view as? NoteView else { return }

        let noteViewController = NoteViewController()

        noteViewController.delegateProtocol = self

        if let selectNote = note.first(
            where: {
                print("CurrentNote ID\(currentNoteView.id)")
                return $0.id == currentNoteView.id
            }) {
            noteViewController.fetchData(id: selectNote.id,
                                         textTime: selectNote.date,
                                         textMesg: selectNote.text ?? "",
                                         titleNot: selectNote.title ?? "")
        }

        navigationController?.pushViewController(noteViewController, animated: true)
   }
}
