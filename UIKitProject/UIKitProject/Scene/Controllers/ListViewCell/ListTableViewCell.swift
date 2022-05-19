//
//  ListTableViewCell.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 25.04.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    private var NSLayoutConstraint: NSLayoutConstraint?

    var checkBoxClosure: ((Bool) -> Void)?

    private var checkBox: UIButton = {
        let checkBox = UIButton()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.setImage(UIImage(named: "backgroundWhite"), for: .normal)
        checkBox.setImage(UIImage(named: "backgroundBlue"), for: .selected)
        return checkBox
    }()

    private var note: UILabel = {
        let note = UILabel()
        note.translatesAutoresizingMaskIntoConstraints = false
        note.textAlignment = .center
        note.textColor = .black
        note.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        return note
    }()

    private var message: UILabel = {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.textColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 1)
        message.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        message.textAlignment = .center
        return message
    }()

    private var time: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.textAlignment = .center
        time.textColor = .black
        time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
        return time
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundConfiguration = UIBackgroundConfiguration.clear()
        contentView.layer.cornerRadius = 16
        contentView.layer.backgroundColor =  UIColor.white.cgColor

        contentView.addSubview(checkBox)
        contentView.addSubview(note)
        contentView.addSubview(message)
        contentView.addSubview(time)

        checkBox.addTarget(self, action: #selector(toggleCheckboxSelection), for: .touchUpInside)

        setupСonstraintCheckBox()
        setupConstraintNote()
        setupConstraintMessage()
        setupConstraintTime()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    private func setupСonstraintCheckBox() {
        checkBox.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: +35
        ).isActive = true
        checkBox.bottomAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
            constant: -35
        ).isActive = true
        NSLayoutConstraint =  checkBox.trailingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        NSLayoutConstraint?.isActive = true
    }

    // MARK: - Private
    private func setupConstraintNote() {
        note.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: +10
        ).isActive = true
        note.bottomAnchor.constraint(
            equalTo: message.safeAreaLayoutGuide.bottomAnchor,
            constant: -20
        ).isActive = true
        note.leadingAnchor.constraint(
            equalTo: checkBox.trailingAnchor,
            constant: 20
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintMessage() {
        message.topAnchor.constraint(
            equalTo: note.topAnchor,
            constant: +25
        ).isActive = true
        message.bottomAnchor.constraint(
            equalTo: time.safeAreaLayoutGuide.bottomAnchor,
            constant: -30
        ).isActive = true
        message.leadingAnchor.constraint(
            equalTo: checkBox.trailingAnchor,
            constant: 20
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintTime() {
        time.topAnchor.constraint(
            equalTo: message.safeAreaLayoutGuide.topAnchor,
            constant: +30
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
            constant: -10
        ).isActive = true
        time.leadingAnchor.constraint(
            equalTo: checkBox.trailingAnchor,
            constant: 20
        ).isActive = true
    }

    // MARK: - Private
    @objc func toggleCheckboxSelection() {
        checkBoxClosure?(!checkBox.isSelected)
        checkBox.isSelected = !checkBox.isSelected
    }

    func showCheckbox(_ show: Bool) {
        checkBox.isSelected = false
        UIView.animate(withDuration: 1) {
            self.NSLayoutConstraint?.constant = show ? 40 : 0
            self.layoutIfNeeded()
        }
    }

    func update(model: Note) {
        note.text = model.title
        message.text = model.text
        time.text = model.date
    }
}
