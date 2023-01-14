//
//  HabitsCollectioViewCell.swift
//  MyHabits
//
//  Created by Jazzband on 12.01.2023.
//

import UIKit

class HabitsCollectioViewCell: UICollectionViewCell {

    static let cocelltionID = "CollectionID"

    lazy var taskTextField: UITextField = {
        let taskText = UITextField()
        taskText.textColor = .blue
        taskText.font = UIFont(name: "SF Pro Text", size: 17)
        return taskText
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(taskTextField)
        setConstrains()
    }
}

extension HabitsCollectioViewCell{

    func setConstrains(){
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            taskTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            taskTextField.widthAnchor.constraint(equalToConstant: 220),
            taskTextField.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
