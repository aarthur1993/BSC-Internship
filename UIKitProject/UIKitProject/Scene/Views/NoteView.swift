//
//  NoteView.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 20.04.2022.
//

import Foundation
import UIKit

// MARK: Custom Model
final class NoteView: UIView {
    var id = UUID().uuidString
     var note = UILabel()
     var message = UILabel()
     var time = UILabel()

    var model: Note = Note(title: "", text: "", date: "") {
        didSet {
            note.text = model.title
            message.text = model.text
            time.text = model.date
        }
    }

    func set(with: Note) {
        self.note.text = with.title
        self.message.text = with.text
        self.time.text = with.date
    }
}
