//
//  DateTableViewCell.swift
//  MyHabits
//
//  Created by Jazzband on 23.01.2023.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    static let dateID = "DateID"

    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textColor = .black
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return dateLabel
    }()

    lazy var dateImage: UIImageView = {
        let dateImage = UIImageView()
        dateImage.translatesAutoresizingMaskIntoConstraints = false
        dateImage.tintColor = .black
        return dateImage
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dateLabel)
        addSubview(dateImage)
        constrainsConfigurations()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension DateTableViewCell {

    func constrainsConfigurations(){
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 11),
            dateImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            dateImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 340)
        ])
    }
}
