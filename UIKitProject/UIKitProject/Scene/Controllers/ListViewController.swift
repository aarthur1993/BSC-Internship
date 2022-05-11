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

    var tableViews: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return tableView
    }()

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(tapButton))
        return tap
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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Заметки"
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        tableViews.addSubview(plusButton)
        view.addSubview(tableViews)
        constraintSetups()

        tableViews.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableViews.dataSource = self
        tableViews.delegate = self
        tableViews.separatorColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
    }

    // MARK: - Method configTableView
    func constraintSetups() {

        tableViews.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: +10
        ).isActive = true
        tableViews.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -0
        ).isActive = true
        tableViews.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        tableViews.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true

        plusButton.topAnchor.constraint(
            equalTo: tableViews.topAnchor,
            constant: +610
        ).isActive = true
        plusButton.bottomAnchor.constraint(
            equalTo: tableViews.bottomAnchor,
            constant: -100
        ).isActive = true
        plusButton.widthAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButton.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButton.rightAnchor.constraint(
            equalTo: tableViews.rightAnchor,
            constant: -10
        ).isActive = true
        plusButton.leftAnchor.constraint(
            equalTo: tableViews.leftAnchor,
            constant: +290
        ).isActive = true
    }
    // MARK: - Method tapButton
    @objc private func tapButton(_ sender: UIButton) {
        let noteVC = NoteViewController()
        noteVC.delegateProtocol = self
        switch sender {
        case plusButton:
            navigationController?.pushViewController(noteVC, animated: true)
        default:
            break
        }
    }
}

extension ListViewController {
    // MARK: - Method fetchDataView
    func fetchDataView(id: UUID, textTime: String, textMesg: String, titleNot: String) {
        if let firstIndex = note.firstIndex(where: {$0.id == id}) {
            self.note[firstIndex].title = titleNot
            self.note[firstIndex].text = textMesg
            self.note[firstIndex].date = textTime
        } else {
            self.note.append(Note(id: id, title: titleNot, text: textMesg, date: textTime))
        }
        tableViews.reloadData()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return note.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell

        cell!.fetchData(notes: note[indexPath.row])

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let noteView = NoteViewController()
        noteView.delegateProtocol = self

        let index = note[indexPath.row]

        noteView.addData(id: index.id,
                         note: index.title ?? "",
                         message: index.text ?? "",
                         data: index.date )

        navigationController?.pushViewController(noteView, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
