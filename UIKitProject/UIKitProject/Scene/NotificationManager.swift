//
//  NotificationManager.swift
//  UIKitProject
//
//  Created by Arthur111 Magomedov on 05.04.2022.
//

import Foundation

enum Message {
    case order
    case cancel(message: String)
}
struct NotificationManager {
    var text: String
    var notification: Message
    var reminderDate: Date?
    mutating func funcCancel(_ message: String) {
        notification = .cancel(message: message)
        reminderDate = nil
    }
}
