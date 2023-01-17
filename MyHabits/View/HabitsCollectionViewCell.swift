//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by Jazzband on 15.01.2023.
//

import UIKit

class HabitsCollectionViewCell: UICollectionViewCell {

    static let collectionCellID = "CollectionID"

    lazy var habitsLabele: UILabel = {
        let habitsLabel = UILabel()
        habitsLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        habitsLabel.numberOfLines = 3
        habitsLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitsLabel
    }()

    lazy var habitsFootNote: UILabel = {
        let habitsFootNote = UILabel()
        habitsFootNote.textColor = .systemGray
        habitsFootNote.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        habitsFootNote.translatesAutoresizingMaskIntoConstraints = false
        return habitsFootNote
    }()

    lazy var habitsCount: UILabel = {
        let habitsCount = UILabel()
        habitsCount.textColor = .lightGray
        habitsCount.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        habitsCount.translatesAutoresizingMaskIntoConstraints = false
        return habitsCount
    }()

    lazy var imageLabel: UIImageView = {
        let imageLabel = UIImageView()
        imageLabel.image = UIImage(named: "circle")
        imageLabel.isUserInteractionEnabled = true
        imageLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toDetailVC)))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()


    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .systemGray
        contentView.addSubview(habitsLabele)
        contentView.addSubview(habitsFootNote)
        contentView.addSubview(habitsCount)
        contentView.addSubview(imageLabel)
        constrainsForLabels()
    }

    @objc func toDetailVC(){

    }

    private func constrainsForLabels(){
        NSLayoutConstraint.activate([
            habitsLabele.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitsLabele.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitsLabele.widthAnchor.constraint(equalToConstant: 220),

            habitsFootNote.topAnchor.constraint(equalTo: habitsLabele.bottomAnchor, constant: 4),
            habitsFootNote.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            habitsCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitsCount.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),

            imageLabel.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 65),
            imageLabel.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIScreen.main.bounds.width - 32 - 25),
            imageLabel.heightAnchor.constraint(equalToConstant: 38),
            imageLabel.widthAnchor.constraint(equalToConstant: 38),
            imageLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 110),
            imageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }

}



