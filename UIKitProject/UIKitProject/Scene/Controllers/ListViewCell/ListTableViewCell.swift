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
        checkBox.setImage(UIImage(named: Constant.checkBoxImageNormal), for: .normal)
        checkBox.setImage(UIImage(named: Constant.checkBoxImageSelected), for: .selected)
        return checkBox
    }()

    private var note: UILabel = {
        let note = UILabel()
        note.translatesAutoresizingMaskIntoConstraints = false
        note.textAlignment = .center
        note.textColor = .black
        note.font = Constant.noteFont
        return note
    }()

    private var message: UILabel = {
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.textColor = Constant.messageTextColor
        message.font = Constant.messageFont
        message.textAlignment = .center
        return message
    }()

    private var time: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.textAlignment = .center
        time.textColor = .black
        time.font = Constant.timeFont
        return time
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.cornerRadius = Constant.contentViewCornerRadius
        contentView.layer.backgroundColor =  Constant.contentViewBackgroundColor

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

// MARK: - Private Methods
extension ListTableViewCell {
    // MARK: - Private
    private func setupСonstraintCheckBox() {
        checkBox.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: Constant.checkBoxTopAnchor
        ).isActive = true
        checkBox.bottomAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
            constant: Constant.checkBoxBottomAnchor
        ).isActive = true
        NSLayoutConstraint =  checkBox.trailingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
            constant: Constant.checkBoxTrailingAnchor)
        NSLayoutConstraint?.isActive = true
    }

    // MARK: - Private
    private func setupConstraintNote() {
        note.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: Constant.noteLabelTopAnchor
        ).isActive = true
        note.bottomAnchor.constraint(
            equalTo: message.safeAreaLayoutGuide.bottomAnchor,
            constant: Constant.noteLabelBottomAnchor
        ).isActive = true
        note.leadingAnchor.constraint(
            equalTo: checkBox.trailingAnchor,
            constant: Constant.leadingAnchorConstants
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintMessage() {
        message.topAnchor.constraint(
            equalTo: note.topAnchor,
            constant: Constant.messageLabelTopAnchor
        ).isActive = true
        message.bottomAnchor.constraint(
            equalTo: time.safeAreaLayoutGuide.bottomAnchor,
            constant: Constant.messageLabelBottomAnchor
        ).isActive = true
        message.leadingAnchor.constraint(
            equalTo: checkBox.trailingAnchor,
            constant: Constant.leadingAnchorConstants
        ).isActive = true
    }

    // MARK: - Private
    private func setupConstraintTime() {
        time.topAnchor.constraint(
            equalTo: message.safeAreaLayoutGuide.topAnchor,
            constant: Constant.timeLabelTopAnchor
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
            constant: Constant.timeLabelBottomAnchor
        ).isActive = true
        time.leadingAnchor.constraint(
            equalTo: checkBox.trailingAnchor,
            constant: Constant.leadingAnchorConstants
        ).isActive = true
    }

    // MARK: - Private
    @objc private func toggleCheckboxSelection() {
        checkBoxClosure?(!checkBox.isSelected)
        checkBox.isSelected = !checkBox.isSelected
    }
}

// MARK: - Constants
extension ListTableViewCell {

    private enum Constant {

        static let contentViewBackgroundColor = UIColor.white.cgColor
        static let contentViewCornerRadius: CGFloat = 16

        static let checkBoxImageNormal = "backgroundWhite"
        static let checkBoxImageSelected = "backgroundBlue"

        static let noteFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)

        static let messageTextColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 1)
        static let messageFont = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)

        static let timeFont = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)

        // MARK: - Constraint constants
        static let checkBoxTopAnchor: CGFloat = +35
        static let checkBoxBottomAnchor: CGFloat = -35
        static let checkBoxTrailingAnchor: CGFloat = 0

        static let noteLabelTopAnchor: CGFloat = +10
        static let noteLabelBottomAnchor: CGFloat = -20

        static let messageLabelTopAnchor: CGFloat = +25
        static let messageLabelBottomAnchor: CGFloat = -30

        static let timeLabelTopAnchor: CGFloat = +30
        static let timeLabelBottomAnchor: CGFloat = -10

        static let leadingAnchorConstants: CGFloat = 20
    }
}
