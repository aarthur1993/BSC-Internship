//
//  Note.swift
//  test
//
//  Created by Arthur111 Magomedov on 12.04.2022.
//

import Foundation
import UIKit

struct Note: Codable, Identifiable {
    // MARK: - Internal properties

    var id = UUID().uuidString
    var title: String?
    var text: String?
    var date: String

    init(title: String?, text: String?, date: String) {
        self.title = title
        self.text = text
        self.date = date
    }
}
