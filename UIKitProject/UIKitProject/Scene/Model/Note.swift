//
//  Note.swift
//  test
//
//  Created by Arthur111 Magomedov on 12.04.2022.
//

import Foundation
import UIKit

struct Note {
    // MARK: - Internal properties
    var id = UUID()
    var title: String?
    var text: String?
    var date: String

    init(id: UUID, title: String?, text: String?, date: String) {
        self.id = id
        self.title = title
        self.text = text
        self.date = date
    }
}
