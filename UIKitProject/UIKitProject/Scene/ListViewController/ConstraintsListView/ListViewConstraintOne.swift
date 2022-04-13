//
//  ListViewConstraintOne.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 13.04.2022.
//

import Foundation

extension ListViewController {
    func viewConstraintOne() {
        viewOne.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: -200
        ).isActive = true
        viewOne.topAnchor.constraint(
            equalTo: scroll.topAnchor,
            constant: +105
        ).isActive = true
        viewOne.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -649
        ).isActive = true
        viewOne.widthAnchor.constraint(
            equalToConstant: +358
        ).isActive = true
        viewOne.heightAnchor.constraint(
            equalToConstant: +90
        ).isActive = true
        viewOne.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 16
        ).isActive = true
        viewOne.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -16
        ).isActive = true
    }
    func constraintViewOneNote() {
        viewOne.note.centerXAnchor.constraint(
           equalTo: viewOne.centerXAnchor,
           constant: +50
        ).isActive = true
        viewOne.note.topAnchor.constraint(
           equalTo: viewOne.topAnchor,
           constant: +10
        ).isActive = true
        viewOne.note.bottomAnchor.constraint(
           equalTo: viewOne.bottomAnchor,
           constant: -62
        ).isActive = true
        viewOne.note.widthAnchor.constraint(
           equalToConstant: +300
        ).isActive = true
        viewOne.note.heightAnchor.constraint(
           equalToConstant: +18
        ).isActive = true
        viewOne.note.leftAnchor.constraint(
         equalTo: viewOne.leftAnchor,
         constant: 16
        ).isActive = true
        viewOne.note.rightAnchor.constraint(
         equalTo: viewOne.rightAnchor,
         constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintOneViewTime() {
        viewOne.time.centerXAnchor.constraint(
           equalTo: viewOne.centerXAnchor,
           constant: +50
        ).isActive = true
        viewOne.time.topAnchor.constraint(
           equalTo: viewOne.topAnchor,
           constant: +70
        ).isActive = true
        viewOne.time.bottomAnchor.constraint(
           equalTo: viewOne.bottomAnchor,
           constant: -10
        ).isActive = true
        viewOne.time.widthAnchor.constraint(
           equalToConstant: +68
        ).isActive = true
        viewOne.time.heightAnchor.constraint(
           equalToConstant: +10
        ).isActive = true
        viewOne.time.leftAnchor.constraint(
         equalTo: viewOne.leftAnchor,
         constant: 16
        ).isActive = true
        viewOne.time.rightAnchor.constraint(
         equalTo: viewOne.rightAnchor,
         constant: -274
        ).isActive = true
    }
    func constraintViewText() {
        viewOne.text.centerXAnchor.constraint(
         equalTo: viewOne.centerXAnchor, constant: +50
        ).isActive = true
        viewOne.text.topAnchor.constraint(
         equalTo: viewOne.topAnchor,
         constant: +32
        ).isActive = true
        viewOne.text.bottomAnchor.constraint(
         equalTo: viewOne.bottomAnchor,
         constant: -44
        ).isActive = true
        viewOne.text.widthAnchor.constraint(
         equalToConstant: +326
        ).isActive = true
        viewOne.text.heightAnchor.constraint(
         equalToConstant: +14
        ).isActive = true
        viewOne.text.leftAnchor.constraint(
         equalTo: viewOne.leftAnchor, constant: 16
        ).isActive = true
        viewOne.text.rightAnchor.constraint(
         equalTo: viewOne.rightAnchor,
         constant: -16
        ).isActive = true
    }
}
extension ListViewController {
    func constraintViewTwo() {
        viewTwo.centerXAnchor.constraint(
           equalTo: view.centerXAnchor,
           constant: 0
        ).isActive = true
        viewTwo.topAnchor.constraint(
           equalTo: scroll.topAnchor,
           constant: +199
        ).isActive = true
        viewTwo.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -555
        ).isActive = true
        viewTwo.widthAnchor.constraint(
          equalToConstant: +358
        ).isActive = true
        viewTwo.heightAnchor.constraint(
          equalToConstant: +90
        ).isActive = true
        viewTwo.leftAnchor.constraint(
           equalTo: view.leftAnchor,
           constant: 16
        ).isActive = true
        viewTwo.rightAnchor.constraint(
           equalTo: view.rightAnchor,
           constant: -16
        ).isActive = true
    }
    func constraintViewTwoNote() {
        viewTwo.note.centerXAnchor.constraint(
           equalTo: viewTwo.centerXAnchor,
           constant: +50
        ).isActive = true
        viewTwo.note.topAnchor.constraint(
           equalTo: viewTwo.topAnchor,
           constant: +10
        ).isActive = true
        viewTwo.note.bottomAnchor.constraint(
           equalTo: viewTwo.bottomAnchor,
           constant: -62
        ).isActive = true
        viewTwo.note.widthAnchor.constraint(
           equalToConstant: +300
        ).isActive = true
        viewTwo.note.heightAnchor.constraint(
           equalToConstant: +18
        ).isActive = true
        viewTwo.note.leftAnchor.constraint(
         equalTo: viewTwo.leftAnchor,
         constant: 16
        ).isActive = true
        viewTwo.note.rightAnchor.constraint(
         equalTo: viewTwo.rightAnchor,
         constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintViewTwoText() {
        viewTwo.text.centerXAnchor.constraint(
            equalTo: viewTwo.centerXAnchor,
            constant: +50
        ).isActive = true
        viewTwo.text.topAnchor.constraint(
            equalTo: viewTwo.topAnchor,
            constant: +32
        ).isActive = true
        viewTwo.text.bottomAnchor.constraint(
            equalTo: viewTwo.bottomAnchor,
            constant: -44
        ).isActive = true
        viewTwo.text.widthAnchor.constraint(
            equalToConstant: +326
        ).isActive = true
        viewTwo.text.heightAnchor.constraint(
            equalToConstant: +14
        ).isActive = true
        viewTwo.text.leftAnchor.constraint(
            equalTo: viewTwo.leftAnchor,
            constant: 16
        ).isActive = true
        viewTwo.text.rightAnchor.constraint(
            equalTo: viewTwo.rightAnchor,
            constant: -16
        ).isActive = true
    }
    func viewTwoTime() {
        viewTwo.time.centerXAnchor.constraint(
            equalTo: viewTwo.centerXAnchor,
            constant: +50
        ).isActive = true
        viewTwo.time.topAnchor.constraint(
            equalTo: viewTwo.topAnchor,
            constant: +70
        ).isActive = true
        viewTwo.time.bottomAnchor.constraint(
            equalTo: viewTwo.bottomAnchor,
            constant: -10
        ).isActive = true
        viewTwo.time.widthAnchor.constraint(
            equalToConstant: +68
        ).isActive = true
        viewTwo.time.heightAnchor.constraint(
            equalToConstant: +10
        ).isActive = true
        viewTwo.time.leftAnchor.constraint(
            equalTo: viewTwo.leftAnchor,
            constant: 16
        ).isActive = true
        viewTwo.time.rightAnchor.constraint(
            equalTo: viewTwo.rightAnchor,
            constant: -274
        ).isActive = true
    }
}

extension ListViewController {
    func constraintViewThretext() {
        viewThre.text.centerXAnchor.constraint(
            equalTo: viewThre.centerXAnchor, constant: +50
        ).isActive = true
        viewThre.text.topAnchor.constraint(
            equalTo: viewThre.topAnchor,
            constant: +32
        ).isActive = true
        viewThre.text.bottomAnchor.constraint(
            equalTo: viewThre.bottomAnchor,
            constant: -44
        ).isActive = true
        viewThre.text.widthAnchor.constraint(
            equalToConstant: +326
        ).isActive = true
        viewThre.text.heightAnchor.constraint(
            equalToConstant: +14
        ).isActive = true
        viewThre.text.leftAnchor.constraint(
            equalTo: viewThre.leftAnchor, constant: 16
        ).isActive = true
        viewThre.text.rightAnchor.constraint(
            equalTo: viewThre.rightAnchor,
            constant: -16
        ).isActive = true
        }
    func viewConstraintThre() {
        viewThre.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: -200
        ).isActive = true
        viewThre.topAnchor.constraint(
            equalTo: scroll.topAnchor,
            constant: +293
        ).isActive = true
        viewThre.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -461
        ).isActive = true
        viewThre.widthAnchor.constraint(
            equalToConstant: +358
        ).isActive = true
        viewThre.heightAnchor.constraint(
            equalToConstant: +90
        ).isActive = true
        viewThre.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 16
        ).isActive = true
        viewThre.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -16
        ).isActive = true
    }

}

extension ListViewController {
        func constraintViewThreNote() {
        viewThre.note.centerXAnchor.constraint(
            equalTo: viewThre.centerXAnchor,
            constant: +50
        ).isActive = true
        viewThre.note.topAnchor.constraint(
            equalTo: viewThre.topAnchor,
            constant: +10
        ).isActive = true
        viewThre.note.bottomAnchor.constraint(
            equalTo: viewThre.bottomAnchor,
            constant: -62
        ).isActive = true
        viewThre.note.widthAnchor.constraint(
            equalToConstant: +300
        ).isActive = true
        viewThre.note.heightAnchor.constraint(
            equalToConstant: +18
        ).isActive = true
        viewThre.note.leftAnchor.constraint(
            equalTo: viewThre.leftAnchor,
            constant: 16
        ).isActive = true
        viewThre.note.rightAnchor.constraint(
            equalTo: viewThre.rightAnchor,
            constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintThreTime() {
        viewThre.time.centerXAnchor.constraint(
            equalTo: viewThre.centerXAnchor,
            constant: +50
        ).isActive = true
        viewThre.time.topAnchor.constraint(
            equalTo: viewThre.topAnchor,
            constant: +70
        ).isActive = true
        viewThre.time.bottomAnchor.constraint(
            equalTo: viewThre.bottomAnchor,
            constant: -10
        ).isActive = true
        viewThre.time.widthAnchor.constraint(
            equalToConstant: +68
        ).isActive = true
        viewThre.time.heightAnchor.constraint(
            equalToConstant: +10
        ).isActive = true
        viewThre.time.leftAnchor.constraint(
            equalTo: viewThre.leftAnchor,
            constant: 16
        ).isActive = true
        viewThre.time.rightAnchor.constraint(
            equalTo: viewThre.rightAnchor,
            constant: -274
        ).isActive = true
    }
}
