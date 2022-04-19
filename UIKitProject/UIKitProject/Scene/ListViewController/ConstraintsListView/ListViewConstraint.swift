//
//  ListViewConstraintOne.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 13.04.2022.
//

import Foundation

extension ListViewController {

    // MARK: - Method constraintScroll
    func constraintScroll() {
        scroll.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: +0).isActive = true
        scroll.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: +52).isActive = true
        scroll.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        scroll.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +0).isActive = true
        scroll.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0).isActive = true
    }
    // MARK: - Method constraintStackView
    func constraintStackView() {
        stackView.centerXAnchor.constraint(
            equalTo: scroll.safeAreaLayoutGuide.centerXAnchor, constant: +0).isActive = true
        stackView.topAnchor.constraint(
            equalTo: scroll.topAnchor, constant: +0).isActive = true
        stackView.bottomAnchor.constraint(
            equalTo: scroll.bottomAnchor, constant: -649).isActive = true
        stackView.widthAnchor.constraint(
            equalToConstant: +358).isActive = true
        stackView.heightAnchor.constraint(
            equalToConstant: +750).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: scroll.leadingAnchor, constant: +16).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: scroll.trailingAnchor, constant: -16).isActive = true
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
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -815).isActive = true
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

extension ListViewController {
    // MARK: - Method constraintNote
    func constraintNote() {
        titleNote.centerXAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
                                           constant: +50).isActive = true
        titleNote.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: +10).isActive = true
        titleNote.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -780).isActive = true
        titleNote.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        titleNote.heightAnchor.constraint(
            equalToConstant: 18).isActive = true
        titleNote.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titleNote.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    }
    // MARK: - Method constraintText
    func constraintText() {
        textMessage.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +20).isActive = true
        textMessage.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +32).isActive = true
        textMessage.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -760).isActive = true
        textMessage.widthAnchor.constraint(
            equalToConstant: 326).isActive = true
        textMessage.heightAnchor.constraint(
            equalToConstant: 14).isActive = true
        textMessage.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        textMessage.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    // MARK: - Method constraintTextTime
    func constraintTextTime() {
        titlTime.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +50).isActive = true
        titlTime.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +70).isActive = true
        titlTime.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -722).isActive = true
        titlTime.widthAnchor.constraint(
            equalToConstant: 80).isActive = true
        titlTime.heightAnchor.constraint(
            equalToConstant: 50).isActive = true
        titlTime.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titlTime.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -280).isActive = true
    }
}

extension ListViewController {
    // MARK: - Method constraintNoteTwo
    func constraintNoteTwo() {
        titleNoteTwo.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +60).isActive = true
        titleNoteTwo.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +105).isActive = true
        titleNoteTwo.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -685).isActive = true
        titleNoteTwo.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        titleNoteTwo.heightAnchor.constraint(
            equalToConstant: 18).isActive = true
        titleNoteTwo.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titleNoteTwo.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    }
    // MARK: - Method constraintTextTwo
    func constraintTextTwo() {
        textMessageTwo.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +20).isActive = true
        textMessageTwo.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +127).isActive = true
        textMessageTwo.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -665).isActive = true
        textMessageTwo.widthAnchor.constraint(
            equalToConstant: 326).isActive = true
        textMessageTwo.heightAnchor.constraint(
            equalToConstant: 14).isActive = true
        textMessageTwo.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        textMessageTwo.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    // MARK: - Method constraintTextTimeTwo
    func constraintTextTimeTwo() {
        titlTimeTwo.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +50).isActive = true
        titlTimeTwo.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +162).isActive = true
        titlTimeTwo.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -630).isActive = true
        titlTimeTwo.widthAnchor.constraint(
            equalToConstant: 80).isActive = true
        titlTimeTwo.heightAnchor.constraint(
            equalToConstant: 50).isActive = true
        titlTimeTwo.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titlTimeTwo.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -280).isActive = true
    }
}

extension ListViewController {
    // MARK: - Method constraintNoteThre
    func constraintNoteThre() {
        titleNoteThre.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +60).isActive = true
        titleNoteThre.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +200).isActive = true
        titleNoteThre.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -592).isActive = true
        titleNoteThre.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        titleNoteThre.heightAnchor.constraint(
            equalToConstant: 18).isActive = true
        titleNoteThre.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titleNoteThre.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    }
    // MARK: - Method constraintTextThre
    func constraintTextThre() {
        textMessageThre.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +20).isActive = true
        textMessageThre.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +220).isActive = true
        textMessageThre.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -570).isActive = true
        textMessageThre.widthAnchor.constraint(
            equalToConstant: 326).isActive = true
        textMessageThre.heightAnchor.constraint(
            equalToConstant: 14).isActive = true
        textMessageThre.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        textMessageThre.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    // MARK: - Method constraintTextTimeThre
    func constraintTextTimeThre() {
        titlTimeThre.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +50).isActive = true
        titlTimeThre.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +254).isActive = true
        titlTimeThre.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -538).isActive = true
        titlTimeThre.widthAnchor.constraint(
            equalToConstant: 80).isActive = true
        titlTimeThre.heightAnchor.constraint(
            equalToConstant: 50).isActive = true
        titlTimeThre.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titlTimeThre.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -280).isActive = true
    }
}
extension ListViewController {

    // MARK: - Method constraintNoteFour
    func constraintNoteFour() {
        titleNoteFour.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +60).isActive = true
        titleNoteFour.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +293).isActive = true
        titleNoteFour.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -497).isActive = true
        titleNoteFour.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        titleNoteFour.heightAnchor.constraint(
            equalToConstant: 18).isActive = true
        titleNoteFour.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titleNoteFour.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    }
    // MARK: - Method constraintTextFour
    func constraintTextFour() {
        textMessageFour.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +20).isActive = true
        textMessageFour.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +315).isActive = true
        textMessageFour.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -477).isActive = true
        textMessageFour.widthAnchor.constraint(
            equalToConstant: 326).isActive = true
        textMessageFour.heightAnchor.constraint(
            equalToConstant: 14).isActive = true
        textMessageFour.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        textMessageFour.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    // MARK: - Method constraintTextTimeFour
    func constraintTextTimeFour() {
        titlTimeFour.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +50).isActive = true
        titlTimeFour.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +348).isActive = true
        titlTimeFour.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -444).isActive = true
        titlTimeFour.widthAnchor.constraint(
            equalToConstant: 80).isActive = true
        titlTimeFour.heightAnchor.constraint(
            equalToConstant: 50).isActive = true
        titlTimeFour.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titlTimeFour.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -280).isActive = true
    }
}
extension ListViewController {

    // MARK: - Method constraintNoteFour
    func constraintNoteFive() {
        titleNoteFive.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +60).isActive = true
        titleNoteFive.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +383).isActive = true
        titleNoteFive.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -407).isActive = true
        titleNoteFive.widthAnchor.constraint(
            equalToConstant: 300).isActive = true
        titleNoteFive.heightAnchor.constraint(
            equalToConstant: 18).isActive = true
        titleNoteFive.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titleNoteFive.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
    }
    // MARK: - Method constraintTextFour
    func constraintTextFive() {
        textMessageFive.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +20).isActive = true
        textMessageFive.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +406).isActive = true
        textMessageFive.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -377).isActive = true
        textMessageFive.widthAnchor.constraint(
            equalToConstant: 326).isActive = true
        textMessageFive.heightAnchor.constraint(
            equalToConstant: 14).isActive = true
        textMessageFive.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        textMessageFive.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    // MARK: - Method constraintTextTimeFour
    func constraintTextTimeFive() {
        titlTimeFive.centerXAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.centerXAnchor,
            constant: +50).isActive = true
        titlTimeFive.topAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.topAnchor,
            constant: +441).isActive = true
        titlTimeFive.bottomAnchor.constraint(
            equalTo: stackView.safeAreaLayoutGuide.bottomAnchor,
            constant: -352).isActive = true
        titlTimeFive.widthAnchor.constraint(
            equalToConstant: 80).isActive = true
        titlTimeFive.heightAnchor.constraint(
            equalToConstant: 50).isActive = true
        titlTimeFive.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +30).isActive = true
        titlTimeFive.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -280).isActive = true
    }
}
