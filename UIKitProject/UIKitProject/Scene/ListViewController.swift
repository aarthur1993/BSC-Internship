//
//  ListViewController.swift
//  test
//
//  Created by Arthur111 Magomedov on 08.04.2022.
//

import UIKit

protocol SomeProtocol: AnyObject {
    func count(count: String)
    func fetchDataViewOne(textTimeOne: String, textMesgOne: String, titleNotOne: String)
    func fetchDataViewTwo(textTimeTwo: String, textMesgTwo: String, titleNotTwo: String)
    func fetchDataViewThre(textTimeThre: String, textMesgThre: String, titleNotThre: String)
    func fetchDataViewFour(textTimeFour: String, textMesgFour: String, titleNotFour: String)
}

class ListViewController: UIViewController, SomeProtocol {

    var array: [ViewOne] = []
    var count = Int()

    var label: UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        lab.textColor = .black
        return lab
    }()
    lazy var scroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.layer.backgroundColor = UIColor.yellow.cgColor
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return scrollView
    }()

    lazy var tapGestureRecognizerOne: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap
    }()

    lazy var tapGestureRecognizerTwo: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap
    }()

    lazy var tapGestureRecognizerThre: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap

    }()

    lazy var tapGestureRecognizerFour: UITapGestureRecognizer = {
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
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.setTitle("-", for: .highlighted)
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        buttonPlus.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = 24
        buttonPlus.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return buttonPlus
    }()

    var titleNote: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
        return textTitle
    }()

    var textMessage: UILabel = {
        let textMessage = UILabel()
        textMessage.translatesAutoresizingMaskIntoConstraints = false
        textMessage.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        textMessage.textAlignment = .left
        textMessage.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
        return textMessage
    }()

    var titlTime: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        return textTitle
    }()
    var titleNoteTwo: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
        return textTitle
    }()

    var textMessageTwo: UILabel = {
        let textMessage = UILabel()
        textMessage.translatesAutoresizingMaskIntoConstraints = false
        textMessage.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        textMessage.textAlignment = .left
        textMessage.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
        return textMessage
    }()

    var titlTimeTwo: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        return textTitle
    }()
    var titleNoteThre: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
        return textTitle
    }()

    var textMessageThre: UILabel = {
        let textMessage = UILabel()
        textMessage.translatesAutoresizingMaskIntoConstraints = false
        textMessage.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        textMessage.textAlignment = .left
        textMessage.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
        return textMessage
    }()

    var titlTimeThre: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        return textTitle
    }()

    var titleNoteFour: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
        return textTitle
    }()

    var textMessageFour: UILabel = {
        let textMessage = UILabel()
        textMessage.translatesAutoresizingMaskIntoConstraints = false
        textMessage.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        textMessage.textAlignment = .left
        textMessage.font = UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
        return textMessage
    }()

    var titlTimeFour: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .left
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        return textTitle
    }()

    var stackView: UIStackView = {
        var stackVie = UIStackView()
        stackVie.translatesAutoresizingMaskIntoConstraints = false
        stackVie.spacing = 4.0
        stackVie.distribution = .fillEqually
        stackVie.alignment = .fill
        stackVie.axis = .vertical
        stackVie.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return stackVie
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        view.addSubview(scroll)
        scroll.addSubview(stackView)
        view.addSubview(plusButton)
        view.addSubview(titl)
        scroll.addSubview(titlTime)
        scroll.addSubview(titleNote)
        scroll.addSubview(textMessage)
        scroll.addSubview(titleNoteTwo)
        scroll.addSubview(titlTimeTwo)
        scroll.addSubview(textMessageTwo)
        scroll.addSubview(textMessageThre)
        scroll.addSubview(titlTimeThre)
        scroll.addSubview(titleNoteThre)
        scroll.addSubview(titlTimeFour)
        scroll.addSubview(textMessageFour)
        scroll.addSubview(titleNoteFour)
        view.addSubview(label)
        constraintScroll()
        constraintStackView()
        constraintText()
        constraintTitlText()
        constraintPlusButton()
        constraintTextTime()
        constraintNote()
        constraintTextTwo()
        constraintNoteTwo()
        constraintTextTimeTwo()
        constraintNoteThre()
        constraintTextThre()
        constraintTextTimeThre()
        constraintNoteFour()
        constraintTextFour()
        constraintTextTimeFour()
        addRow()
    }
    // MARK: - Method count
    func count(count: String) {
        label.text = count
    }
}

// MARK: - Method addRow
extension ListViewController {
    func addRow() {
        let row = itemss()
        array.append(contentsOf: row)
        for views in array[1...1] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
            views.addGestureRecognizer(tapGestureRecognizerOne)
        }
        for views in array[2...2] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            views.note.textColor = UIColor.white
            stackView.addArrangedSubview(views)
            views.addGestureRecognizer(tapGestureRecognizerTwo)
        }
        for views in array[3...3] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
            views.addGestureRecognizer(tapGestureRecognizerThre)
        }
        for views in array[4...4] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
            views.addGestureRecognizer(tapGestureRecognizerFour)
        }
        for views in array[5...5] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
        }
        for views in array[6...6] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
        }
        for views in array[7...7] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
        }
        for views in array[8...8] {
            views.backgroundColor = UIColor.white
            views.layer.cornerRadius = 15
            stackView.addArrangedSubview(views)
        }
    }
}

extension ListViewController {
    // MARK: - Method fetchDataViewOne
    func fetchDataViewOne(textTimeOne: String, textMesgOne: String, titleNotOne: String) {
        self.titlTime.text = textTimeOne
        self.textMessage.text = textMesgOne
        self.titleNote.text = titleNotOne
    }
    // MARK: - Method fetchDataViewOne
    func fetchDataViewTwo(textTimeTwo: String, textMesgTwo: String, titleNotTwo: String) {
        self.titlTimeTwo.text = textTimeTwo
        self.textMessageTwo.text = textMesgTwo
        self.titleNoteTwo.text = titleNotTwo
    }
    // MARK: - Method fetchDataViewThre
    func fetchDataViewThre(textTimeThre: String, textMesgThre: String, titleNotThre: String) {
        self.titlTimeThre.text = textTimeThre
        self.textMessageThre.text = textMesgThre
        self.titleNoteThre.text = titleNotThre
    }
    // MARK: - Method fetchDataViewFour
    func fetchDataViewFour(textTimeFour: String, textMesgFour: String, titleNotFour: String) {
        self.titlTimeFour.text = textTimeFour
        self.textMessageFour.text = textMesgFour
        self.titleNoteFour.text = titleNotFour
    }
}
