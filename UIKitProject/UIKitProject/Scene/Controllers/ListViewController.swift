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

    private var indexPathSelect: [IndexPath] = []

    private let barButton = UIBarButtonItem()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tintColor = .blue
        tableView.sectionIndexBackgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Constants.tableViewColor
        return tableView
    }()

    private let plusButton: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(UIImage(named: Constants.plusButtonImage), for: .normal)
        buttonPlus.clipsToBounds = true
        buttonPlus.titleLabel?.font = Constants.plusButtonFont
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = Constants.plusButtonCornerRadius
        buttonPlus.backgroundColor = Constants.plusButtonBackgroundColor
        return buttonPlus
    }()

    private let plusButtonClean: UIButton = {
        let buttonPlus = UIButton()
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        buttonPlus.setImage(UIImage(named: Constants.plusButtonCleanImage), for: .normal)
        buttonPlus.clipsToBounds = true
        buttonPlus.titleLabel?.font = Constants.plusButtonCleanFont
        buttonPlus.layer.masksToBounds = false
        buttonPlus.layer.cornerRadius = Constants.plusButtonCleanCornerRadius
        buttonPlus.backgroundColor = Constants.plusButtonCleanBackgroundcolor
        return buttonPlus
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.navigationTitleText
        view.backgroundColor = Constants.navigationBackgroundColor

        view.addSubview(tableView)
        tableView.addSubview(plusButtonClean)
        tableView.addSubview(plusButton)

        plusButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        plusButtonClean.addTarget(self, action: #selector(deleteRow(_:)), for: .touchUpInside)

        setupConstraintTableView()
        setupConstraintPlusButton()
        setupConstraintPlusButtonClean()

        settingBarButtonItem()
        setupPlusButtonAnimatedUP()

        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
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

        cell.checkBoxClosure = { select in
            if select {
                self.indexPathSelect.append(indexPath)
                print("print: select \(self.indexPathSelect)")
            } else {
                self.indexPathSelect = self.indexPathSelect.filter { $0 != indexPath }
                print("print: deselect \(self.indexPathSelect)")
            }
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if !indexPathSelect.isEmpty {

            let noteView = NoteViewController()
            noteView.delegateProtocol = self

            let index = note[indexPath.row]

            noteView.update(id: index.id,
                            note: index.title ?? "",
                            message: index.text ?? "",
                            data: index.date )

            self.indexPathSelect.removeAll()
            print("indexPathsSelect.isEmpty")
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

        deleteAction.image = UIImage(named: Constants.deleteActionImage)?.preparingForDisplay()
        deleteAction.backgroundColor = Constants.deleteActionBackgroundColor

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false

        return configuration
    }
}

// MARK: - Private Methods
extension ListViewController {

    private func settingBarButtonItem() {
        barButton.title = Constants.barButtonTitleSelect
        barButton.target  = self
        barButton.action = #selector(setupAnimationBarButtonTap)
        navigationItem.rightBarButtonItem = barButton
    }

    private func cellForEach(show: Bool) {
        (0..<note.count).forEach {
            if let cell = tableView.cellForRow(at: IndexPath(item: $0, section: 0)) as? ListTableViewCell {
                print("print: \(show) \($0)")
                cell.showCheckbox(show)
            }
        }
    }

    @objc private func setupAnimationBarButtonTap() {
        if  barButton.title == Constants.barButtonTitleSelect {
            barButton.title = Constants.barButtonTitleDone

            setupPlusButtonTransitionLeft()
            setupPlusButtonCleanTransitionLeft()
            cellForEach(show: true)

        } else if barButton.title == Constants.barButtonTitleDone {
            barButton.title = Constants.barButtonTitleSelect

            if indexPathSelect.isEmpty {
                alert()
                print("indexPathsSelect.isEmpty")

            } else if !indexPathSelect.isEmpty {
                indexPathSelect.removeAll()
                print("!indexPathsSelect.isEmpty")
            }
            setupPlusButtonTransitionRight()
            setupPlusButtonCleanTransitionRight()

            cellForEach(show: false)
        }
    }

    private func alert() {
        let alertController = UIAlertController(title: Constants.alertControllerTitle,
                                                message: "",
                                                preferredStyle: .actionSheet)
        let action = UIAlertAction(title: Constants.alertActionTitle, style: .default) { (_) in

            self.barButton.title = Constants.barButtonTitleDone
            self.cellForEach(show: true)
            self.setupPlusButtonTransitionLeft()
            self.setupPlusButtonCleanTransitionLeft()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    @objc private func deleteRow(_ cells: UIButton) {
        indexPathSelect.forEach {
            if indexPathSelect.contains($0) {
                let getIndex = indexPathSelect.firstIndex(of: $0)

                indexPathSelect.remove(at: getIndex ?? .zero)
            } else {
                indexPathSelect.append($0)
            }
            tableView.reloadRows(at: [$0], with: UITableView.RowAnimation.automatic)

            if !note.isEmpty {
                note.remove(at: $0.row)
                self.barButton.title = Constants.barButtonTitleSelect
                self.tableView.isEditing = false
                self.setupPlusButtonTransitionRight()
                self.setupPlusButtonCleanTransitionRight()
                tableView.deleteRows(at: [IndexPath.init(row: $0.row, section: 0)], with: .fade)
                tableView.reloadData()
                cellForEach(show: false)
            }
        }
    }

    private func setupPlusButtonTransitionLeft() {
        UIView.transition(
            with: plusButton,
            duration: 1,
            options: [.transitionFlipFromLeft],
            animations: {

            },
            completion: nil)
    }

    private func setupPlusButtonCleanTransitionLeft() {
        UIView.transition(
            with: plusButtonClean,
            duration: 1,
            options: [.transitionFlipFromLeft],
            animations: { [weak self] in
                guard let self = self else { return }
                self.plusButtonClean.setImage(UIImage(named: Constants.plusButtonCleanImage), for: .normal)
                self.tableView.addSubview(self.plusButtonClean)
            },
            completion: nil)
    }

    private func setupPlusButtonTransitionRight() {
        UIView.transition(
            with: plusButton,
            duration: 1,
            options: [.transitionFlipFromRight],
            animations: { [weak self] in
                guard let self = self else { return }
                self.plusButton.setImage(UIImage(named: Constants.plusButtonImage), for: .normal)
                self.tableView.addSubview(self.plusButton)

            },
            completion: nil)
    }

    private func setupPlusButtonCleanTransitionRight() {
        UIView.transition(
            with: plusButtonClean,
            duration: 1,
            options: [.transitionFlipFromRight],
            animations: {
            },
            completion: nil)
    }

    @objc private func setupPlusButtonAnimatedUP() {
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

    @objc private func setupPlusButtonAnimatedAddKeyFrame() {
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
                    self.setupPlusButtonAnimatedAddKeyFrame()
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

    private func setupConstraintTableView() {
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: Constants.tableViewAnchor
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: Constants.tableViewAnchor
        ).isActive = true
        tableView.leftAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leftAnchor,
            constant: Constants.tableViewAnchor
        ).isActive = true
        tableView.rightAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.rightAnchor,
            constant: Constants.tableViewRightAnchor
        ).isActive = true
    }

    private func setupConstraintPlusButton() {
        plusButton.bottomAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.bottomAnchor,
            constant: Constants.buttonBottomAnchor
        ).isActive = true
        plusButton.widthAnchor.constraint(
            equalToConstant: Constants.buttonWightHeightAnchor
        ).isActive = true
        plusButton.heightAnchor.constraint(
            equalToConstant: Constants.buttonWightHeightAnchor
        ).isActive = true
        plusButton.rightAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.rightAnchor,
            constant: Constants.rightAnchor
        ).isActive = true
    }

    private func setupConstraintPlusButtonClean() {
        plusButtonClean.bottomAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.bottomAnchor,
            constant: Constants.buttonBottomAnchor
        ).isActive = true
        plusButtonClean.widthAnchor.constraint(
            equalToConstant: Constants.buttonWightHeightAnchor
        ).isActive = true
        plusButtonClean.heightAnchor.constraint(
            equalToConstant: Constants.buttonWightHeightAnchor
        ).isActive = true
        plusButtonClean.rightAnchor.constraint(
            equalTo: tableView.safeAreaLayoutGuide.rightAnchor,
            constant: Constants.rightAnchor
        ).isActive = true
    }
}

// MARK: - Constants
extension ListViewController {

    private enum Constants {
        static let navigationTitleText = "Заметки"
        static let navigationBackgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)

        static let tableViewColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)

        static let plusButtonCleanFont = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        static let plusButtonCleanBackgroundcolor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        static let plusButtonCornerRadius: CGFloat = 24
        static let plusButtonCleanImage = "Vector"

        static let plusButtonFont = UIFont.systemFont(ofSize: 37, weight: UIFont.Weight.regular)
        static let plusButtonBackgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        static let plusButtonCleanCornerRadius: CGFloat = 24
        static let plusButtonImage = "+"

        static let barButtonTitleSelect = "Выбрать"
        static let barButtonTitleDone = "Готово"

        static let alertActionTitle = "Oк"
        static let alertControllerTitle = "Вы не выбрали ни одной заметки"

        static let deleteActionImage = "korzina"
        static let deleteActionBackgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100)

        // MARK: - Constraint constants
        static let tableViewAnchor: CGFloat = +20
        static let tableViewRightAnchor: CGFloat = -20

        static let rightAnchor: CGFloat = -5

        static let buttonWightHeightAnchor: CGFloat = +50
        static let buttonBottomAnchor: CGFloat = -65
    }
}
