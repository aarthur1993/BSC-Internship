//
//  ModelView.swift
//  test
//
//  Created by Arthur111 Magomedov on 12.04.2022.
//

import Foundation
import UIKit

// MARK: Custom Model
class ViewOne: UIView {
    var time = UILabel()
    var note = UILabel()
    var text = UILabel()
    var id = NSUUID().uuidString

    init(text: String, note: String, time: String, id: String) {
        self.text.text = text
        self.note.text = note
        self.time.text = time
        self.id.append(id)

        super.init(frame: CGRect())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Method itemss
func itemss() -> [ViewOne] {
    var addData: [ViewOne] = []
    for iii in 0...8 {

        addData.append(ViewOne(text: "Text: \(iii)", note: "Note: \(iii)", time: "Time: \(iii)", id: "UUIID: \(iii)"))
    }
    return addData
}
