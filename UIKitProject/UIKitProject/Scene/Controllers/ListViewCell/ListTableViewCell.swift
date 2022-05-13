//
//  ListTableViewCell.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 25.04.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    private var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.layer.backgroundColor = UIColor(red: 249/255, green: 250/255, blue: 254/255, alpha: 100).cgColor
        contentView.layer.cornerRadius = 15
        contentView.tintColor = .green
        view.addSubview(note)
        view.addSubview(message)
        view.addSubview(time)
        contentView.addSubview(view)
        backgroundConfiguration = UIBackgroundConfiguration.clear()
        setupСonstraint()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private
    private func setupСonstraint() {
        view.topAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.topAnchor,
            constant: +2
        ).isActive = true
        view.bottomAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
            constant: -3
        ).isActive = true
        view.leadingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
            constant: 0
        ).isActive = true
        view.trailingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,
            constant: 0
        ).isActive = true
    }

        note.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: +10
        ).isActive = true
        note.bottomAnchor.constraint(
            equalTo: message.safeAreaLayoutGuide.bottomAnchor,
            constant: -20
        ).isActive = true
        note.leadingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
    }

        message.topAnchor.constraint(
            equalTo: note.topAnchor,
            constant: +25
        ).isActive = true
        message.bottomAnchor.constraint(
            equalTo: time.safeAreaLayoutGuide.bottomAnchor,
            constant: -30
        ).isActive = true
        message.leadingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
    }

        time.topAnchor.constraint(
            equalTo: message.safeAreaLayoutGuide.topAnchor,
            constant: +30
        ).isActive = true
        time.bottomAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
            constant: -10
        ).isActive = true
        time.leadingAnchor.constraint(
            equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
            constant: 20
        ).isActive = true
    }
    
    func update(model: Note) {
        note.text = model.title
        message.text = model.text
        time.text = model.date
    }
}
