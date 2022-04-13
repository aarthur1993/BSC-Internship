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
    func fetchDataViewThree(textTimeThre: String, textMesgThre: String, titleNotThre: String)
    func fetchDataViewFour(textTimeFour: String, textMesgFour: String, titleNotFour: String)
    func fetchDataViewFive(textTimeFive: String, textMesgFive: String, titleNotFive: String)
    func fetchDataViewSix(textTimeSix: String, textMesgSix: String, titleNotSix: String)
    func fetchDataViewSeven(textTimeSeven: String, textMesgSeven: String, titleNotSeven: String)
}

class ListViewController: UIViewController {
    var count = Int()
    var label: UILabel = {
        let lab = UILabel()
        lab.isHidden = true
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textColor = .black
        return lab
    }()
    lazy var scroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = true
        scrollView.contentSize.height = 1000
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
    lazy var tapGestureRecognizerFive: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap
    }()
    lazy var tapGestureRecognizerSix: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap
    }()
    lazy var tapGestureRecognizerSeven: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.addTarget(self, action: #selector(tapButton))
        return tap
    }()
     var titl: UILabel = {
        let textTitle = UILabel()
        textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.textAlignment = .center
        textTitle.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        textTitle.text = "Заметки"
        textTitle.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        textTitle.layer.borderWidth = 1
        textTitle.layer.borderColor = CGColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return textTitle
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
         textMessage.text = ""
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

   lazy var plusButton: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.setTitle("-", for: .highlighted)
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        buttonPlus.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = 24
        buttonPlus.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return buttonPlus
    }()
    lazy var stackView: UIStackView = {
        var stackVie = UIStackView()
        stackVie = UIStackView(arrangedSubviews: [viewOne, viewTwo, viewThre, viewFour, viewFive, viewSix, viewSeven])
        stackVie.translatesAutoresizingMaskIntoConstraints = false
        stackVie.spacing = 30
        stackVie.distribution = .equalSpacing
        stackVie.alignment = .fill
        stackVie.axis = .vertical
        stackVie.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return stackVie
      }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        scroll.backgroundColor = .lightGray
        view.addSubview(scroll)
        scroll.addSubview(stackView)
        viewOne.addGestureRecognizer(tapGestureRecognizerOne)
        viewTwo.addGestureRecognizer(tapGestureRecognizerTwo)
        viewThre.addGestureRecognizer(tapGestureRecognizerThre)
        viewFour.addGestureRecognizer(tapGestureRecognizerFour)
        viewFive.addGestureRecognizer(tapGestureRecognizerFive)
        viewSix.addGestureRecognizer(tapGestureRecognizerSix)
        viewSeven.addGestureRecognizer(tapGestureRecognizerSeven)
        view.addSubview(plusButton)
        view.addSubview(titl)
        scroll.addSubview(label)
        scroll.addSubview(viewOne)
        scroll.addSubview(viewTwo)
        scroll.addSubview(viewThre)
        scroll.addSubview(viewFour)
        scroll.addSubview(viewFive)
        scroll.addSubview(viewSix)
        scroll.addSubview(viewSeven)
        saveConstraintVC()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       add()
    }
    @objc func tapButton(_ sender: UIButton) {
        let vcTwo = TwoViewController()
        let noteVC = NoteViewOneGesture()
        vcTwo.delegatePR = self
        noteVC.delegateProtocol = self
        switch sender {
        case plusButton:
             count += 1
             vcTwo.labels.text  = "\(count)"
             navigationController?.pushViewController(vcTwo, animated: true)
        case tapGestureRecognizerOne:
            noteVC.label.text = "\(count)"
            closureLisVC { noted, tim, messag in noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerTwo:
            noteVC.label.text = "\(count)"

            closureLisVCTwo { noted, tim, messag in
                noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerThre:
            noteVC.label.text = "\(count)"

            closureLisVCThre { noted, tim, messag in
                noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerFour:
            noteVC.label.text = "\(count)"

            closureLisVCFour { noted, tim, messag in
                noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerFive:
            noteVC.label.text = "\(count)"

            closureLisVCFive { noted, tim, messag in
                noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerSix:
            noteVC.label.text = "\(count)"

            closureLisVCSix { noted, tim, messag in
                noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerSeven:
            noteVC.label.text = "\(count)"

            closureLisVCSeven { noted, tim, messag in
                noteVC.notes.text = noted
                noteVC.textT.text = messag
                noteVC.time.placeholder = tim
            }
            navigationController?.pushViewController(noteVC, animated: true)
        default:
            break
        }
    }
}
