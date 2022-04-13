//
//  ListViewConstraintThree.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 13.04.2022.
//

import Foundation
extension ListViewController {
    func viewConstraintViewSix() {
        viewSix.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: -387
        ).isActive = true
        viewSix.topAnchor.constraint(
            equalTo: scroll.topAnchor,
            constant: +575
        ).isActive = true
        viewSix.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -179
        ).isActive = true
        viewSix.widthAnchor.constraint(
            equalToConstant: +358
        ).isActive = true
        viewSix.heightAnchor.constraint(
            equalToConstant: +90
        ).isActive = true
        viewSix.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 16
        ).isActive = true
        viewSix.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -16
        ).isActive = true
   }
}
extension ListViewController {
     func constraintNoteSix() {
        viewSix.note.centerXAnchor.constraint(
           equalTo: viewSix.centerXAnchor,
           constant: +50
        ).isActive = true
        viewSix.note.topAnchor.constraint(
           equalTo: viewSix.topAnchor,
           constant: +10
        ).isActive = true
        viewSix.note.bottomAnchor.constraint(
           equalTo: viewSix.bottomAnchor,
           constant: -62
        ).isActive = true
        viewSix.note.widthAnchor.constraint(
           equalToConstant: +300
        ).isActive = true
        viewSix.note.heightAnchor.constraint(
           equalToConstant: +18
        ).isActive = true
        viewSix.note.leftAnchor.constraint(
         equalTo: viewSix.leftAnchor,
         constant: 16
        ).isActive = true
        viewSix.note.rightAnchor.constraint(
         equalTo: viewSix.rightAnchor,
         constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintSix() {
        viewSix.text.centerXAnchor.constraint(
         equalTo: viewSix.centerXAnchor, constant: +50
        ).isActive = true
        viewSix.text.topAnchor.constraint(
         equalTo: viewSix.topAnchor,
         constant: +32
        ).isActive = true
        viewSix.text.bottomAnchor.constraint(
         equalTo: viewSix.bottomAnchor,
         constant: -44
        ).isActive = true
        viewSix.text.widthAnchor.constraint(
         equalToConstant: +326
        ).isActive = true
        viewSix.text.heightAnchor.constraint(
         equalToConstant: +14
        ).isActive = true
        viewSix.text.leftAnchor.constraint(
         equalTo: viewSix.leftAnchor, constant: 16
        ).isActive = true
        viewSix.text.rightAnchor.constraint(
         equalTo: viewSix.rightAnchor,
         constant: -16
        ).isActive = true
    }
    func constraintSevenTime() {
        viewSix.time.centerXAnchor.constraint(
           equalTo: viewSix.centerXAnchor,
           constant: +50
        ).isActive = true
        viewSix.time.topAnchor.constraint(
           equalTo: viewSix.topAnchor,
           constant: +70
        ).isActive = true
        viewSix.time.bottomAnchor.constraint(
           equalTo: viewSix.bottomAnchor,
           constant: -10
        ).isActive = true
        viewSix.time.widthAnchor.constraint(
           equalToConstant: +68
        ).isActive = true
        viewSix.time.heightAnchor.constraint(
           equalToConstant: +10
        ).isActive = true
        viewSix.time.leftAnchor.constraint(
         equalTo: viewSix.leftAnchor,
         constant: 16
        ).isActive = true
        viewSix.time.rightAnchor.constraint(
         equalTo: viewSix.rightAnchor,
         constant: -274
        ).isActive = true
    }
}
extension ListViewController {
        func viewConstraintSeven() {
        viewSeven.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: -387
        ).isActive = true
        viewSeven.topAnchor.constraint(
            equalTo: scroll.topAnchor,
            constant: +669
        ).isActive = true
        viewSeven.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -85
        ).isActive = true
        viewSeven.widthAnchor.constraint(
            equalToConstant: +358
        ).isActive = true
        viewSeven.heightAnchor.constraint(
            equalToConstant: +90
        ).isActive = true
        viewSeven.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 16
        ).isActive = true
        viewSeven.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -16
        ).isActive = true
    }
    func constraintSevenNote() {
        viewSeven.note.centerXAnchor.constraint(
           equalTo: viewSeven.centerXAnchor,
           constant: +50
        ).isActive = true
        viewSeven.note.topAnchor.constraint(
           equalTo: viewSeven.topAnchor,
           constant: +10
        ).isActive = true
        viewSeven.note.bottomAnchor.constraint(
           equalTo: viewSeven.bottomAnchor,
           constant: -62
        ).isActive = true
        viewSeven.note.widthAnchor.constraint(
           equalToConstant: +300
        ).isActive = true
        viewSeven.note.heightAnchor.constraint(
           equalToConstant: +18
        ).isActive = true
        viewSeven.note.leftAnchor.constraint(
         equalTo: viewSeven.leftAnchor,
         constant: 16
        ).isActive = true
        viewSeven.note.rightAnchor.constraint(
         equalTo: viewSeven.rightAnchor,
         constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintViewSevenTime() {
        viewSeven.time.centerXAnchor.constraint(
           equalTo: viewSeven.centerXAnchor,
           constant: +50
        ).isActive = true
        viewSeven.time.topAnchor.constraint(
           equalTo: viewSeven.topAnchor,
           constant: +70
        ).isActive = true
        viewSeven.time.bottomAnchor.constraint(
           equalTo: viewSeven.bottomAnchor,
           constant: -10
        ).isActive = true
        viewSeven.time.widthAnchor.constraint(
           equalToConstant: +68
        ).isActive = true
        viewSeven.time.heightAnchor.constraint(
           equalToConstant: +10
        ).isActive = true
        viewSeven.time.leftAnchor.constraint(
         equalTo: viewSeven.leftAnchor,
         constant: 16
        ).isActive = true
        viewSeven.time.rightAnchor.constraint(
         equalTo: viewSeven.rightAnchor,
         constant: -274
        ).isActive = true
    }
    func constraintViewSevenText() {
        viewSeven.text.centerXAnchor.constraint(
         equalTo: viewSeven.centerXAnchor, constant: +50
        ).isActive = true
        viewSeven.text.topAnchor.constraint(
         equalTo: viewSeven.topAnchor,
         constant: +32
        ).isActive = true
        viewSeven.text.bottomAnchor.constraint(
         equalTo: viewSeven.bottomAnchor,
         constant: -44
        ).isActive = true
        viewSeven.text.widthAnchor.constraint(
         equalToConstant: +326
        ).isActive = true
        viewSeven.text.heightAnchor.constraint(
         equalToConstant: +14
        ).isActive = true
        viewSeven.text.leftAnchor.constraint(
         equalTo: viewSeven.leftAnchor, constant: 16
        ).isActive = true
        viewSeven.text.rightAnchor.constraint(
         equalTo: viewSeven.rightAnchor,
         constant: -16
        ).isActive = true
    }
}
extension ListViewController {
    func constraintScroll() {
        scroll.topAnchor.constraint(
           equalTo: view.topAnchor
        ).isActive = true
        scroll.leadingAnchor.constraint(
            equalTo: view.leadingAnchor
        ).isActive = true
        scroll.trailingAnchor.constraint(
            equalTo: view.trailingAnchor
        ).isActive = true
        scroll.bottomAnchor.constraint(
           equalTo: view.bottomAnchor
        ).isActive = true
    }
    func constraintStackView() {
        stackView.topAnchor.constraint(
           equalTo: view.topAnchor
        ).isActive = true
        stackView.leftAnchor.constraint(
           equalTo: view.leftAnchor
        ).isActive = true
        stackView.rightAnchor.constraint(
           equalTo: view.rightAnchor
        ).isActive = true
        stackView.bottomAnchor.constraint(
           equalTo: view.bottomAnchor
        ).isActive = true
        stackView.widthAnchor.constraint(
           equalTo: view.widthAnchor
        ).isActive = true
    }
    func constraintLabel() {
        label.centerXAnchor.constraint(
           equalTo: view.centerXAnchor,
           constant: +5
        ).isActive = true
        label.topAnchor.constraint(
           equalTo: view.topAnchor,
           constant: +57
        ).isActive = true
        label.bottomAnchor.constraint(
           equalTo: view.bottomAnchor,
           constant: -765
        ).isActive = true
        label.widthAnchor.constraint(
           equalToConstant: +100
        ).isActive = true
        label.heightAnchor.constraint(
           equalToConstant: +50
        ).isActive = true
        label.leftAnchor.constraint(
           equalTo: view.leftAnchor,
           constant: 130
        ).isActive = true
        label.rightAnchor.constraint(
           equalTo: view.rightAnchor,
           constant: -130
        ).isActive = true
    }
}
extension ListViewController {
    func constraintTitlText() {
        titl.centerXAnchor.constraint(
           equalTo: view.centerXAnchor,
           constant: +5
        ).isActive = true
        titl.topAnchor.constraint(
           equalTo: view.topAnchor,
           constant: +57
        ).isActive = true
        titl.bottomAnchor.constraint(
           equalTo: view.bottomAnchor,
           constant: -765
        ).isActive = true
        titl.widthAnchor.constraint(
           equalToConstant: +100
        ).isActive = true
        titl.heightAnchor.constraint(
           equalToConstant: +50
        ).isActive = true
        titl.leftAnchor.constraint(
           equalTo: view.leftAnchor,
           constant: 130
        ).isActive = true
        titl.rightAnchor.constraint(
           equalTo: view.rightAnchor,
           constant: -130
        ).isActive = true
    }
    func constraintPlusButton() {
        plusButton.centerXAnchor.constraint(
           equalTo: view.centerXAnchor,
           constant: +120
        ).isActive = true
        plusButton.topAnchor.constraint(
           equalTo: view.topAnchor,
           constant: +734
        ).isActive = true
        plusButton.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -60
        ).isActive = true
        plusButton.widthAnchor.constraint(
          equalToConstant: +50
        ).isActive = true
        plusButton.heightAnchor.constraint(
          equalToConstant: +50
        ).isActive = true
        plusButton.leftAnchor.constraint(
           equalTo: view.leftAnchor,
           constant: 321
        ).isActive = true
        plusButton.rightAnchor.constraint(
           equalTo: view.rightAnchor,
           constant: -19
        ).isActive = true
    }
}
