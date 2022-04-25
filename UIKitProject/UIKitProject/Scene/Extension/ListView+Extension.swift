//
//  ListView+Extension.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 20.04.2022.
//

import Foundation
import UIKit

extension ListViewController {
    // MARK: - Method fetchDataViewOne
    func fetchDataView(id: UUID, textTime: String, textMesg: String, titleNot: String) {
        let notes = Note(id: id, title: titleNot, text: textMesg, date: textTime)

        if self.note.contains(where: { $0.id == id }) {
            stackView.subviews.forEach {
                guard let subview = $0 as? NoteView, subview.id == id else { return }
                subview.set(with: notes)
            }
        } else {
            self.note.append(notes)
            let myView = NoteView()
            myView.set(with: notes)
            addNoteForStack(noteView: myView, stack: stackView)
        }
    }
}

// MARK: - Method tapButton
extension ListViewController {
    @objc func tapButton(_ sender: UIButton) {
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
// MARK: - Method constraintTitlText
    extension ListViewController {
        func constraintTitlText() {
            titl.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -665).isActive = true
            titl.centerYAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: +10).isActive = true
            titl.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: +0).isActive = true
            titl.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -845).isActive = true
            titl.widthAnchor.constraint(equalToConstant: +100).isActive = true
            titl.heightAnchor.constraint(equalToConstant: +30).isActive = true
            titl.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +130).isActive = true
            titl.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -130).isActive = true
    }
        // MARK: - Method constraintPlusButton
        func constraintPlusButton() {
            plusButton.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: +350).isActive = true
            plusButton.centerYAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: +350).isActive = true
            plusButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
            plusButton.widthAnchor.constraint(
                equalToConstant: 50).isActive = true
            plusButton.heightAnchor.constraint(
                equalToConstant: 50).isActive = true
            plusButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        }
    }
