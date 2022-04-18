//
//  ListViewFetchData.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 13.04.2022.
//

import Foundation
import UIKit

// MARK: - Method tapButton
extension ListViewController {
   @objc func tapButton(_ sender: UIButton) {
        let vcTwo = TwoViewController()
        let noteVC = NoteViewOneGesture()
        vcTwo.delegatePR = self
        noteVC.delegateProtocol = self
        switch sender {
        case plusButton:
            count += 1
            vcTwo.labels.text  = "\(count)"
            print("Количество Вью \(count)")
            navigationController?.pushViewController(vcTwo, animated: true)
        case tapGestureRecognizerOne:
            noteVC.label.text = "\(count)"
            closure { notess, mesage, time in
                noteVC.notes.text = notess
                noteVC.textT.text = mesage
                noteVC.time.placeholder = time
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerTwo:
            noteVC.label.text = "\(count)"
            closureTwo { notess, mesage, time in
                noteVC.notes.text = notess
                noteVC.textT.text = mesage
                noteVC.time.placeholder = time
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerThre:
            noteVC.label.text = "\(count)"
            closureThre { notess, mesage, time in
                noteVC.notes.text = notess
                noteVC.textT.text = mesage
                noteVC.time.placeholder = time
            }
            navigationController?.pushViewController(noteVC, animated: true)
        case tapGestureRecognizerFour:
            noteVC.label.text = "\(count)"
            closureFour { notess, mesage, time in
                noteVC.notes.text = notess
                noteVC.textT.text = mesage
                noteVC.time.placeholder = time
            }
            navigationController?.pushViewController(noteVC, animated: true)
        default:
            break
        }
    }
}

// MARK: - Method tapButton
extension ListViewController {

    func closure(complition: (String, String, String) -> Void) {
        complition(titleNote.text ?? "",
                   textMessage.text ?? "",
                   titlTime.text ?? "")
    }
    func closureTwo(complition: (String, String, String) -> Void) {
        complition(titleNoteTwo.text ?? "",
                   textMessageTwo.text ?? "",
                   titlTimeTwo.text ?? "")
    }
    func closureThre(complition: (String, String, String) -> Void) {
        complition(titleNoteThre.text ?? "",
                   textMessageThre.text ?? "",
                   titlTimeThre.text ?? "")
    }
    func closureFour(complition: (String, String, String) -> Void) {
        complition(titleNoteFour.text ?? "",
                   textMessageFour.text ?? "",
                   titlTimeFour.text ?? "")
    }

}
