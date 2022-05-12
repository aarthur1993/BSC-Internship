//
//  ListViewController.swift
//  test
//
//  Created by Arthur111 Magomedov on 08.04.2022.
//

import UIKit

protocol ListViewControllerDataSource: AnyObject {
    func fetchDataView(id: UUID, time: String, message: String, title: String)
}

class ListViewController: UIViewController, ListViewControllerDataSource {

    private var note = [Note]()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return tableView
    }()

    let tapGestureRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer()
        return tap
    }()

    let plusButton: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(UIImage(named: "+"), for: .normal)
        buttonPlus.setImage(UIImage(named: "Ellipse 2"), for: .highlighted)
        buttonPlus.clipsToBounds = true
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = 24
        buttonPlus.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return buttonPlus
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Заметки"
        view.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        tableView.addSubview(plusButton)
        view.addSubview(tableView)
        constraintSetups()

        plusButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        tapGestureRecognizer.addTarget(self, action: #selector(tapButton))

        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
    }

    // MARK: - Method configTableView
    func constraintSetups() {
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: +10
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -0
        ).isActive = true
        tableView.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        tableView.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true

        plusButton.topAnchor.constraint(
            equalTo: tableView.topAnchor,
            constant: +610
        ).isActive = true
        plusButton.bottomAnchor.constraint(
            equalTo: tableView.bottomAnchor,
            constant: -100
        ).isActive = true
        plusButton.widthAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButton.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButton.rightAnchor.constraint(
            equalTo: tableView.rightAnchor,
            constant: -10
        ).isActive = true
        plusButton.leftAnchor.constraint(
            equalTo: tableView.leftAnchor,
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
    func fetchDataView(id: UUID, time: String, message: String, title: String) {
        if let firstIndex = note.firstIndex(where: {$0.id == id}) {
            self.note[firstIndex].title = title
            self.note[firstIndex].text = message
            self.note[firstIndex].date = time
        } else {
            self.note.append(Note(id: id, title: title, text: message, date: time))
        }
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return note.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell

        cell!.update(model: note[indexPath.row])

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let noteView = NoteViewController()
        noteView.delegateProtocol = self

        let index = note[indexPath.row]

        noteView.update(id: index.id,
                        note: index.title ?? "",
                        message: index.text ?? "",
                        data: index.date )

        navigationController?.pushViewController(noteView, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
