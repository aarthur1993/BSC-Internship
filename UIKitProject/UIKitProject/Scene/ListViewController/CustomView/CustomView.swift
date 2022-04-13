//
//  ModelView.swift
//  test
//
//  Created by Arthur111 Magomedov on 12.04.2022.
//

import Foundation
import UIKit

let viewOne: ViewOne = {
    let view = ViewOne()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.textColor = .black
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()

let viewTwo: ViewTwo = {
    let view = ViewTwo()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()

let viewThre: ViewThre = {
    let view = ViewThre()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()
let viewFour: ViewFour = {
    let view = ViewFour()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()
let viewFive: ViewFive = {
    let view = ViewFive()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()
let viewSix: ViewSix = {
    let view = ViewSix()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()
let viewSeven: ViewSeven = {
    let view = ViewSeven()
    view.layer.cornerRadius = 14
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isHidden = true
    view.backgroundColor = .red
    view.note.translatesAutoresizingMaskIntoConstraints = false
    view.note.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.note.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
    view.note.textAlignment = .left
    view.text.translatesAutoresizingMaskIntoConstraints = false
    view.text.textColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1)
    view.text.font =  UIFont.systemFont(ofSize: 10.0, weight: UIFont.Weight.medium)
    view.text.textAlignment = .left
    view.time.translatesAutoresizingMaskIntoConstraints = false
    view.time.textAlignment = .left
    view.time.frame = CGRect(x: 220, y: 150, width: 200, height: 50)
    view.time.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    view.time.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.medium)
    view.addSubview(view.note)
    view.addSubview(view.time)
    view.addSubview(view.text)
    return view
}()
