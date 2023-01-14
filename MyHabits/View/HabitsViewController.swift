//
//  ProgrammViewController.swift
//  MyHabits
//
//  Created by Jazzband on 11.01.2023.
//

import UIKit

class HabitsViewController: UIViewController{
    

    lazy var addButton: UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.tintColor = .purple
        return addButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(addButton)
        addConstrains()
    }
}


extension HabitsViewController{
    func addConstrains(){
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            addButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 326),
            addButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            addButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
}




