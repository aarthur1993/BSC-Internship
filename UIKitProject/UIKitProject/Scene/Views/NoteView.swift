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

    var id = UUID()
     var note = UILabel()
     var message = UILabel()
     var time = UILabel()

    func set(with: Note) {
        self.id = with.id
        self.note.text = with.title
        self.message.text = with.text
        self.time.text = with.date
    }
}
