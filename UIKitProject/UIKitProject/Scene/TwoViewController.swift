//
//  TwoViewController.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 10.04.2022.
//

import UIKit

class TwoViewController: UIViewController {
  weak  var delegatePR: SomeProtocol?
    var count = Int()

    lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(hidenKeyBoard))
        return tap
    }()
    let userdefault = UserDefaults()
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    let labels: UILabel = {
        let lab = UILabel()
        lab.textColor = .black
        return lab
    }()
    var titleTimeTwo: UILabel = {
        let textTime = UILabel()
        textTime.translatesAutoresizingMaskIntoConstraints = false
        textTime.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        textTime.textAlignment = .center
        textTime.textColor = .red
        textTime.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        textTime.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
        return textTime
    }()
     var textNoteTwo: UITextField = {
        let textTitle = UITextField()
         textTitle.translatesAutoresizingMaskIntoConstraints = false
        textTitle.resignFirstResponder()
        textTitle.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        textTitle.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 1254/255, alpha: 1)
        textTitle.textAlignment = .left
        textTitle.text = ""
        return textTitle
    }()
    lazy var titleTextView: UITextView = {
        let textView = UITextView()
         textView.becomeFirstResponder()
         textView.translatesAutoresizingMaskIntoConstraints = false
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
        view.backgroundColor = .white
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 1254/255, alpha: 1)
        navigationController?.isNavigationBarHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done, target: self,
            action: #selector(backVC))
        view.addSubview(labels)
        view.addSubview(titleTimeTwo)
        view.addSubview(titleTextView)
        view.addSubview(scroll)
        view.addGestureRecognizer(tapGesture)
        view.addSubview(textNoteTwo)
        scroll.addSubview(titleTextView)
        titleTextView.adjustableForKeyboard()
        constraintScrollAndLabel()
        constraintTime()
        constraintTextNote()
        constraintTextView()
        dateTextTitle()
        let textCount = labels.text
        userdefault.set(textCount, forKey: "textCount")
        labels.text = userdefault.string(forKey: "textCount")
        print(labels)
    }
    // MARK: - Method dateTextTitle
    @objc func hidenKeyBoard() {
        textNoteTwo.resignFirstResponder()
        titleTextView.resignFirstResponder()
    }
    // MARK: - Method tapButton
    @objc func tapButton(_ sender: UIButton) {
         let vcGesture = NoteViewOneGesture()
            navigationController?.pushViewController(vcGesture, animated: true)
        }
    // MARK: - Method dateTextTitle
    func dateTextTitle() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy EEEE HH:mm"
        titleTimeTwo.text = dateFormater.string(from: Date())
    }
}
// MARK: - Method backVC
extension TwoViewController {
    @objc func backVC() {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        titleTimeTwo.text = dateFormater.string(from: Date())
        guard let time = titleTimeTwo.text else {return}
        guard let text = titleTextView.text else {return}
        guard let note = textNoteTwo.text else {return}
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = true
        switch labels.text {
        case "1": delegatePR?.fetchDataViewOne(
                    textTimeOne: time,
                    textMesgOne: text,
                    titleNotOne: note)
        case "2": delegatePR?.fetchDataViewTwo(
                    textTimeTwo: time,
                    textMesgTwo: text,
                    titleNotTwo: note)
        case "3": delegatePR?.fetchDataViewThre(
                    textTimeThre: time,
                    textMesgThre: text,
                    titleNotThre: note)
        case "4": delegatePR?.fetchDataViewFour(
                    textTimeFour: time,
                    textMesgFour: text,
                    titleNotFour: note)
        default:
            break
    }
  }
}
// MARK: - Method adjustableForKeyboard
 extension UITextView {
     func adjustableForKeyboard() {
        let notoficationCenter = NotificationCenter.default
        notoficationCenter.addObserver(
            self,
            selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        notoficationCenter.addObserver(
            self,
            selector: #selector(adjustForKeyboard),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
     }
    @objc private func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue =
                  notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
                               NSValue else { return }
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = convert(keyboardScreenEndFrame, from: window)
        if notification.name == UIResponder.keyboardWillHideNotification {
            contentInset = .zero
        } else {
            contentInset = UIEdgeInsets(top: 0,
                                        left: 0,
                                        bottom: keyboardViewEndFrame.height - safeAreaInsets.bottom,
                                        right: 0)
        }
        scrollIndicatorInsets = contentInset
        scrollRangeToVisible(selectedRange)
    }
}
// MARK: - Method constraintScrollAndLabel
extension TwoViewController {
    func constraintScrollAndLabel() {
        scroll.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        scroll.leftAnchor.constraint(
           equalTo: view.leftAnchor
        ).isActive = true
        scroll.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor
        ).isActive = true
        scroll.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
        labels.centerXAnchor.constraint(
            equalTo: view.centerXAnchor,
            constant: 0
        ).isActive = true
        labels.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: +101
        ).isActive = true
        labels.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -727).isActive = true
        labels.heightAnchor.constraint(
            equalToConstant: 16
        ).isActive = true
        labels.widthAnchor.constraint(
            equalToConstant: 350
        ).isActive = true
        labels.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
        labels.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
    }
    // MARK: - Method constraintTime
    func constraintTime() {
        titleTimeTwo.centerXAnchor.constraint(
            equalTo: view.centerXAnchor,
            constant: 0
        ).isActive = true
        titleTimeTwo.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: +121
        ).isActive = true
        titleTimeTwo.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -747).isActive = true
        titleTimeTwo.heightAnchor.constraint(
            equalToConstant: 16
        ).isActive = true
        titleTimeTwo.widthAnchor.constraint(
            equalToConstant: 350
        ).isActive = true
        titleTimeTwo.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
        titleTimeTwo.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -20
        ).isActive = true
    }
    // MARK: - Method constraintTextNote
    func constraintTextNote() {
        textNoteTwo.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
        textNoteTwo.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: +107
        ).isActive = true
        textNoteTwo.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -700
        ).isActive = true
        textNoteTwo.heightAnchor.constraint(
            equalToConstant: 24
        ).isActive = true
        textNoteTwo.widthAnchor.constraint(
            equalToConstant: 300
        ).isActive = true
        textNoteTwo.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
        textNoteTwo.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -70
        ).isActive = true
    }
    // MARK: - Method constraintTextView
    func constraintTextView() {
        titleTextView.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
           constant: +5
        ).isActive = true
        titleTextView.centerYAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerYAnchor,
            constant: +100
        ).isActive = true
        titleTextView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
           constant: +149
        ).isActive = true
        titleTextView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
           constant: -145
        ).isActive = true
        titleTextView.widthAnchor.constraint(
           equalToConstant: +350
        ).isActive = true
        titleTextView.heightAnchor.constraint(
            equalTo: scroll.safeAreaLayoutGuide.heightAnchor, constant: +510
        ).isActive = true
        titleTextView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
           constant: +20
        ).isActive = true
        titleTextView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
           constant: -20
        ).isActive = true
    }
}
