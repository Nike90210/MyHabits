//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by Jazzband on 15.01.2023.
//

import UIKit

class HabitsCollectionViewCell: UICollectionViewCell {

    static let collectionCellID = "CollectionID"

    private var habit: Habit!

    private var onImageStatusAction: (() -> ())!

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
        imageLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageStatusAction)))
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        return imageLabel
    }()


    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8
        backgroundColor = .white
        contentView.addSubview(habitsLabele)
        contentView.addSubview(habitsFootNote)
        contentView.addSubview(habitsCount)
        contentView.addSubview(imageLabel)
        constrainsForLabels()
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
            imageLabel.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIScreen.main.bounds.width - 30 - 22),
            imageLabel.heightAnchor.constraint(equalToConstant: 38),
            imageLabel.widthAnchor.constraint(equalToConstant: 38),
        ])
    }

    func setupCell(_ habit: Habit, onImageStatusAction: @escaping () -> ()) {
        self.habit = habit
        self.onImageStatusAction = onImageStatusAction
        habitsFootNote.text = habit.dateString
        habitsLabele.text = habit.name
        habitsLabele.textColor = habit.color
        habitsCount.text = "Счетчик: \(habit.trackDates.count)"
        if habit.isAlreadyTakenToday {
            imageLabel.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            imageLabel.image = UIImage(systemName: "circle")
        }
        imageLabel.tintColor = habit.color
    }

    @objc func imageStatusAction() {
        guard !habit.isAlreadyTakenToday else {return}
        imageLabel.image = UIImage(systemName: "checkmark.circle.fill")
        HabitsStore.shared.track(habit)
        onImageStatusAction()
    }


}



