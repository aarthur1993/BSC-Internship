//
//  NoteViewController.swift
//  BasicNote
//
//  Created by Arthur111 Magomedov on 24.03.2022.
//

import UIKit

class NoteViewController: UIViewController {

    var items = [String]()
    let labelText: UILabel = {
            let labT = UILabel()
            labT.text = ""
            labT.textColor = UIColor.systemRed
            labT.layer.shadowRadius = 20
            labT.layer.shadowOffset = CGSize(width: 0.0, height: 20)
            labT.layer.shadowColor = UIColor.systemGray.cgColor
            labT.layer.shadowOpacity = 0.3
            labT.frame = CGRect(x: 40, y: 100, width: 300, height: 300)
            labT.numberOfLines = 0
            labT.textAlignment = .center
            labT.backgroundColor = .systemGray6
            
            return labT
        }()
    
    var cell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addItem))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
       
        view.addSubview(labelText)
        
        constraint()
    }

   @objc func addItem() {
       addAlertForNewItem()
    }
    
    
    func constraint() {
        labelText.translatesAutoresizingMaskIntoConstraints = false
        
        labelText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        labelText.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -10).isActive = true
        labelText.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        labelText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
    }
    
    func addAlertForNewItem() {
        
        let alert = UIAlertController(title: "BasicNotes", message: "Please add text", preferredStyle: .alert)
        
        var alertextFild: UITextField!
        alert.addTextField { textField in
            alertextFild = textField
            textField.placeholder = "Новая Задача"
        }
    
    
    let saveAction = UIAlertAction(title: "Добавить", style: .destructive) { (saveAct) in
        guard let text = alertextFild.text , !text.isEmpty else { return }
        self.labelText.text = text
    }
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}


