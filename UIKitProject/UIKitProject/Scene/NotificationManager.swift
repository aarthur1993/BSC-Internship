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
    var title: String
    var textview: String
    var notification: Message
    mutating func funcCancel(_ message: String) {
        notification = .cancel(message: message)
    }
}
