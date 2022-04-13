//
//  ListViewConstraintTwo.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 13.04.2022.
//

import Foundation
extension ListViewController {
   func viewConstraintFour() {
        viewFour.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: -200
        ).isActive = true
        viewFour.topAnchor.constraint(
            equalTo: scroll.topAnchor,
            constant: +387
        ).isActive = true
        viewFour.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -367
        ).isActive = true
        viewFour.widthAnchor.constraint(
            equalToConstant: +358
        ).isActive = true
        viewFour.heightAnchor.constraint(
            equalToConstant: +90
        ).isActive = true
        viewFour.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 16
        ).isActive = true
        viewFour.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -16
        ).isActive = true
   }
    func constraintFourNote() {
        viewFour.note.centerXAnchor.constraint(
           equalTo: viewFour.centerXAnchor,
           constant: +50
        ).isActive = true
        viewFour.note.topAnchor.constraint(
           equalTo: viewFour.topAnchor,
           constant: +10
        ).isActive = true
        viewFour.note.bottomAnchor.constraint(
           equalTo: viewFour.bottomAnchor,
           constant: -62
        ).isActive = true
        viewFour.note.widthAnchor.constraint(
           equalToConstant: +300
        ).isActive = true
        viewFour.note.heightAnchor.constraint(
           equalToConstant: +18
        ).isActive = true
        viewFour.note.leftAnchor.constraint(
         equalTo: viewFour.leftAnchor,
         constant: 16
        ).isActive = true
        viewFour.note.rightAnchor.constraint(
         equalTo: viewFour.rightAnchor,
         constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintViewFourText() {
        viewFour.text.centerXAnchor.constraint(
         equalTo: viewFour.centerXAnchor, constant: +50
        ).isActive = true
        viewFour.text.topAnchor.constraint(
         equalTo: viewFour.topAnchor,
         constant: +32
        ).isActive = true
        viewFour.text.bottomAnchor.constraint(
         equalTo: viewFour.bottomAnchor,
         constant: -44
        ).isActive = true
        viewFour.text.widthAnchor.constraint(
         equalToConstant: +326
        ).isActive = true
        viewFour.text.heightAnchor.constraint(
         equalToConstant: +14
        ).isActive = true
        viewFour.text.leftAnchor.constraint(
         equalTo: viewFour.leftAnchor, constant: 16
        ).isActive = true
        viewFour.text.rightAnchor.constraint(
         equalTo: viewFour.rightAnchor,
         constant: -16
        ).isActive = true
    }
    func constraintViewFourTime() {
        viewFour.time.centerXAnchor.constraint(
            equalTo: viewFour.centerXAnchor,
            constant: +50
        ).isActive = true
        viewFour.time.topAnchor.constraint(
           equalTo: viewFour.topAnchor,
           constant: +70
        ).isActive = true
        viewFour.time.bottomAnchor.constraint(
           equalTo: viewFour.bottomAnchor,
           constant: -10
        ).isActive = true
        viewFour.time.widthAnchor.constraint(
           equalToConstant: +68
        ).isActive = true
        viewFour.time.heightAnchor.constraint(
           equalToConstant: +10
        ).isActive = true
        viewFour.time.leftAnchor.constraint(
         equalTo: viewFour.leftAnchor,
         constant: 16
        ).isActive = true
        viewFour.time.rightAnchor.constraint(
         equalTo: viewFour.rightAnchor,
         constant: -274
        ).isActive = true
    }
}
extension ListViewController {
  func viewConstraintFive() {
        viewFive.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor,
            constant: -387
        ).isActive = true
        viewFive.topAnchor.constraint(
            equalTo: scroll.topAnchor,
            constant: +481
        ).isActive = true
        viewFive.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor,
            constant: -273
        ).isActive = true
        viewFive.widthAnchor.constraint(
            equalToConstant: +358
        ).isActive = true
        viewFive.heightAnchor.constraint(
            equalToConstant: +90
        ).isActive = true
        viewFive.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 16
        ).isActive = true
        viewFive.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -16
        ).isActive = true
  }
}
extension ListViewController {
    func constraintFiveNote() {
        viewFive.note.centerXAnchor.constraint(
           equalTo: viewFive.centerXAnchor,
           constant: +50
        ).isActive = true
        viewFive.note.topAnchor.constraint(
           equalTo: viewFive.topAnchor,
           constant: +10
        ).isActive = true
        viewFive.note.bottomAnchor.constraint(
           equalTo: viewFive.bottomAnchor,
           constant: -62
        ).isActive = true
        viewFive.note.widthAnchor.constraint(
           equalToConstant: +300
        ).isActive = true
        viewFive.note.heightAnchor.constraint(
           equalToConstant: +18
        ).isActive = true
        viewFive.note.leftAnchor.constraint(
         equalTo: viewFive.leftAnchor,
         constant: 16
        ).isActive = true
        viewFive.note.rightAnchor.constraint(
         equalTo: viewFive.rightAnchor,
         constant: -42
        ).isActive = true
    }
}
extension ListViewController {
    func constraintFiveText() {
       viewFive.text.centerXAnchor.constraint(
         equalTo: viewFive.centerXAnchor, constant: +50
        ).isActive = true
        viewFive.text.topAnchor.constraint(
         equalTo: viewFive.topAnchor,
         constant: +32
        ).isActive = true
        viewFive.text.bottomAnchor.constraint(
         equalTo: viewFive.bottomAnchor,
         constant: -44
        ).isActive = true
        viewFive.text.widthAnchor.constraint(
         equalToConstant: +326
        ).isActive = true
        viewFive.text.heightAnchor.constraint(
         equalToConstant: +14
        ).isActive = true
        viewFive.text.leftAnchor.constraint(
         equalTo: viewFive.leftAnchor, constant: 16
        ).isActive = true
        viewFive.text.rightAnchor.constraint(
         equalTo: viewFive.rightAnchor,
         constant: -16
        ).isActive = true
    }
    func constraintFiveTime() {
        viewFive.time.centerXAnchor.constraint(
           equalTo: viewFive.centerXAnchor,
           constant: +50
        ).isActive = true
        viewFive.time.topAnchor.constraint(
           equalTo: viewFive.topAnchor,
           constant: +70
        ).isActive = true
        viewFive.time.bottomAnchor.constraint(
           equalTo: viewFive.bottomAnchor,
           constant: -10
        ).isActive = true
        viewFive.time.widthAnchor.constraint(
           equalToConstant: +68
        ).isActive = true
        viewFive.time.heightAnchor.constraint(
           equalToConstant: +10
        ).isActive = true
        viewFive.time.leftAnchor.constraint(
         equalTo: viewFive.leftAnchor,
         constant: 16
        ).isActive = true
        viewFive.time.rightAnchor.constraint(
         equalTo: viewFive.rightAnchor,
         constant: -274
        ).isActive = true
    }
}
