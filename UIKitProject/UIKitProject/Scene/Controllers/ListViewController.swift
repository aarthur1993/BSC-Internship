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

class ListViewController: UIViewController {

    private var note = [Note]()

    private var indexPathsSelect: [IndexPath] = []

    private let barButton = UIBarButtonItem()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tintColor = .blue
        tableView.sectionIndexBackgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)
        return tableView
    }()

    private let plusButton: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(UIImage(named: "+"), for: .normal)
        buttonPlus.clipsToBounds = true
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = 24
        buttonPlus.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return buttonPlus
    }()

    private let plusButtonClean: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(UIImage(named: "Vector"), for: .normal)
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

        view.addSubview(tableView)
        tableView.addSubview(plusButtonClean)
        tableView.addSubview(plusButton)

        plusButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        plusButtonClean.addTarget(self, action: #selector(deleteRow(_:)), for: .touchUpInside)

        setupConstraintTableView()
        setupConstraintPlusButton()
        setupConstraintPlusButtonClean()

        settingBarButtonItem()
        plusButtonAnimatedUP()

        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelectionDuringEditing = true

    }

    // MARK: - Private
    private func settingBarButtonItem() {
        barButton.title = "Выбрать"
        barButton.target  = self
        barButton.action = #selector(settingAnimationBarButtonTap)
        navigationItem.rightBarButtonItem = barButton
    }

    // MARK: - Private
    @objc private func settingAnimationBarButtonTap() {
        if  barButton.title == "Выбрать" {
            barButton.title = "Готово"

            barButton.style =  UIBarButtonItem.Style.plain
            tableView.setEditing(true, animated: true)

            plusButtonTransitionLeft()
            plusButtonTransitionLefts()

        } else if barButton.title == "Готово" {
            barButton.title = "Выбрать"

            if indexPathsSelect.isEmpty {
                indexPathsSelect.removeAll()
            }
            allertSetting()

            tableView.setEditing(false, animated: true)

            barButton.style = UIBarButtonItem.Style.plain

            plusButtonTransitionRight()
            plusButtonTransitionRights()
        }
    }

    // MARK: - Private
    private func allertSetting() {
        if tableView.isEditing == true {
            if indexPathsSelect.isEmpty {
                alertMessage()
            }
        }
    }

    // MARK: - Private
    private func alertMessage() {
        let alertController = UIAlertController(title: "Вы не выбрали ни одной заметки",
                                                message: "",
                                                preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Ок", style: .default) { (_) in
            if !self.note.isEmpty {
                if self.tableView.isEditing == false {
                    self.tableView.setEditing(true, animated: true)
                    self.barButton.title = "Готово"
                    self.tableView.isEditing = true
                    self.plusButtonTransitionLeft()
                    self.plusButtonTransitionLefts()
                }
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    // MARK: - Private
    @objc private func deleteRow(_ cells: UIButton) {
        indexPathsSelect.forEach {
            if indexPathsSelect.contains($0) {
                let getIndex = indexPathsSelect.firstIndex(of: $0)

                indexPathsSelect.remove(at: getIndex ?? .zero)
            } else {
                indexPathsSelect.append($0)
            }
            tableView.reloadRows(at: [$0], with: UITableView.RowAnimation.automatic)

            if !note.isEmpty {
                note.remove(at: $0.row)
                tableView.deleteRows(at: [IndexPath.init(row: $0.row, section: 0)], with: .fade)
                tableView.reloadData()
            }
        }
    }

    // MARK: - Private
    private func plusButtonTransitionLeft() {
        UIView.transition(
            with: plusButton,
            duration: 1,
            options: [.transitionFlipFromLeft],
            animations: {

            },
            completion: nil)
    }

    // MARK: - Private
    private func plusButtonTransitionLefts() {
        UIView.transition(
            with: plusButtonClean,
            duration: 1,
            options: [.transitionFlipFromLeft],
            animations: { [weak self] in
                guard let self = self else { return }
                self.plusButtonClean.setImage(UIImage(named: "Vector"), for: .normal)
                self.tableView.addSubview(self.plusButtonClean)
            },
            completion: nil)
    }

    // MARK: - Private
    private func plusButtonTransitionRight() {
        UIView.transition(
            with: plusButton,
            duration: 1,
            options: [.transitionFlipFromRight],
            animations: { [weak self] in
                guard let self = self else { return }
                self.plusButton.setImage(UIImage(named: "+"), for: .normal)
                self.tableView.addSubview(self.plusButton)

            },
            completion: nil)
    }

    // MARK: - Private
    private func plusButtonTransitionRights() {
        UIView.transition(
            with: plusButtonClean,
            duration: 1,
            options: [.transitionFlipFromRight],
            animations: {
            },
            completion: nil)
    }

    // MARK: - Private
    @objc private func plusButtonAnimatedUP() {
        UIView.animate(
            withDuration: 2.5,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 0.1,
            options: [],
            animations: { [weak self] in
                guard let self = self else { return }
                self.plusButton.frame.origin.y -= 80
                self.plusButtonClean.frame.origin.y -= 80
            },
            completion: nil)
    }

    // MARK: - Private
    @objc private func plusButtonAnimatedAddKeyFrame() {
        UIView.addKeyframe(
            withRelativeStartTime: 0,
            relativeDuration: 0.25) { [weak self] in
                guard let self = self else { return }
                self.plusButton.frame.origin.y -= 30
                self.plusButtonClean.frame.origin.y -= 30
            }
        UIView.addKeyframe(
            withRelativeStartTime: 0.50,
            relativeDuration: 0.25) { [weak self] in
                guard let self = self else { return }
                self.plusButton.frame.origin.y += 60
                self.plusButtonClean.frame.origin.y += 60
            }
        UIView.addKeyframe(
            withRelativeStartTime: 0.8,
            relativeDuration: 0.25) { [weak self] in
                guard let self = self else { return }
                self.plusButton.frame.origin.y += 200
                self.plusButtonClean.frame.origin.y += 200
            }
    }

    // MARK: - Private
    @objc private func tapButton(_ sender: UIButton) {
        let noteVC = NoteViewController()
        noteVC.delegateProtocol = self

        switch sender {
        case plusButton:
            UIView.animateKeyframes(
                withDuration: 1.2,
                delay: 0.1,
                options: [],
                animations: { [weak self] in
                    guard let self = self else { return }
                    self.plusButtonAnimatedAddKeyFrame()
                },
                completion: nil)

            DispatchQueue.global(qos: .userInteractive).async {
                sleep(UInt32(1.7))
                DispatchQueue.main.sync { [weak self] in
                    guard let self = self else { return }
                    self.navigationController?.pushViewController(noteVC, animated: true)
                }
            }
        default:
            break
        }
    }

    // MARK: - Private
    private func setupConstraintTableView() {
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: +20
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -5
        ).isActive = true
        tableView.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: 20
        ).isActive = true
        tableView.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: -20
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintPlusButton() {
        plusButton.bottomAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.bottomAnchor,
            constant: -65
        ).isActive = true
        plusButton.widthAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButton.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButton.rightAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.rightAnchor,
            constant: -5
        ).isActive = true
        plusButton.leftAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.leftAnchor,
            constant: +295
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintPlusButtonClean() {
        plusButtonClean.bottomAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.bottomAnchor,
            constant: -65
        ).isActive = true
        plusButtonClean.widthAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButtonClean.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        plusButtonClean.rightAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.rightAnchor,
            constant: -5
        ).isActive = true
        plusButtonClean.leftAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.leftAnchor,
            constant: +295
        ).isActive = true
    }
}

extension ListViewController: ListViewControllerDataSource {
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath) as? ListTableViewCell

        guard let cell = cell else {return cell!}

        cell.backgroundConfiguration?.backgroundColor = UIColor.white
        cell.backgroundConfiguration?.cornerRadius = 15
        cell.backgroundView?.layer.cornerRadius = 20

        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect:
                                        CGRect(x: 2,
                                               y: 2,
                                               width: bounds.width+365,
                                               height: bounds.height-4), cornerRadius: 15).cgPath
        cell.layer.mask = maskLayer

        cell.update(model: note[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPathsSelect.append(indexPath)

        if tableView.isEditing == false {
            let noteView = NoteViewController()
            noteView.delegateProtocol = self

            let index = note[indexPath.row]

            noteView.update(id: index.id,
                            note: index.title ?? "",
                            message: index.text ?? "",
                            data: index.date )

            self.indexPathsSelect.removeAll()

            navigationController?.pushViewController(noteView, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "") { _, _, _ in
            self.note.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
        }

        deleteAction.image = UIImage(named: "korzina")?.preparingForDisplay()
        deleteAction.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false

        return configuration
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

        return UITableViewCell.EditingStyle.none
    }
}
