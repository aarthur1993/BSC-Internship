//
//  ListViewFetchData.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 13.04.2022.
//

import Foundation
import UIKit

extension ListViewController {
@objc func add() {
    switch label.text {
    case "1":
        viewOne.backgroundColor  = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewOne.isHidden = false
    case "2":
        viewTwo.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewTwo.isHidden = false
    case "3":
        viewThre.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewThre.isHidden = false
    case "4":
        viewFour.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewFour.isHidden = false
    case "5":
        viewFive.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewFive.isHidden = false
    case "6":
        viewSix.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewSix.isHidden = false
    case "7":
        viewSeven.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        viewSeven.isHidden = false
    default:
        break
    }
  }
}
extension ListViewController {
    func closureLisVC(complition: (String, String, String) -> Void) {
        complition(viewOne.note.text ?? "", viewOne.time.text ?? "", viewOne.text.text ?? "")
    }
    func closureLisVCTwo(complition: (String, String, String) -> Void) {
        complition(viewTwo.note.text ?? "", viewTwo.time.text ?? "", viewTwo.text.text ?? "")
    }
    func closureLisVCThre(complition: (String, String, String) -> Void) {
        complition(viewThre.note.text ?? "", viewThre.time.text ?? "", viewThre.text.text ?? "")
    }
    func closureLisVCFour(complition: (String, String, String) -> Void) {
        complition(viewFour.note.text ?? "", viewFour.time.text ?? "", viewFour.text.text ?? "")
    }
    func closureLisVCFive(complition: (String, String, String) -> Void) {
        complition(viewFive.note.text ?? "", viewFive.time.text ?? "", viewFive.text.text ?? "")
    }
    func closureLisVCSix(complition: (String, String, String) -> Void) {
        complition(viewSix.note.text ?? "", viewSix.time.text ?? "", viewSix.text.text ?? "")
    }
    func closureLisVCSeven(complition: (String, String, String) -> Void) {
        complition(viewSeven.note.text ?? "", viewSeven.time.text ?? "", viewSeven.text.text ?? "")
    }
}
extension ListViewController: SomeProtocol {
    func count(count: String) {
        label.text = count
    }
    func fetchDataViewOne(textTimeOne: String, textMesgOne: String,
                          titleNotOne: String) {
        viewOne.time.text = textTimeOne
        viewOne.text.text = textMesgOne
        viewOne.note.text = titleNotOne
    }
    func fetchDataViewTwo(textTimeTwo: String, textMesgTwo: String,
                          titleNotTwo: String) {
        viewTwo.time.text = textTimeTwo
        viewTwo.text.text = textMesgTwo
        viewTwo.note.text = titleNotTwo
    }
    func fetchDataViewThree(textTimeThre: String, textMesgThre: String, titleNotThre: String) {
        viewThre.time.text = textTimeThre
        viewThre.text.text = textMesgThre
        viewThre.note.text = titleNotThre
    }
    func fetchDataViewFour(textTimeFour: String, textMesgFour: String, titleNotFour: String) {
        viewFour.time.text = textTimeFour
        viewFour.text.text = textMesgFour
        viewFour.note.text = titleNotFour
    }
}
extension ListViewController {
    func fetchDataViewFive(textTimeFive: String, textMesgFive: String, titleNotFive: String) {
        viewFive.time.text = textTimeFive
        viewFive.text.text = textMesgFive
        viewFive.note.text = titleNotFive
    }
    func fetchDataViewSix(textTimeSix: String, textMesgSix: String, titleNotSix: String) {
        viewSix.time.text = textTimeSix
        viewSix.text.text = textMesgSix
        viewSix.note.text = titleNotSix
    }
    func fetchDataViewSeven(textTimeSeven: String, textMesgSeven: String, titleNotSeven: String) {
        viewSeven.time.text = textTimeSeven
        viewSeven.text.text = textMesgSeven
        viewSeven.note.text = titleNotSeven
    }
}
