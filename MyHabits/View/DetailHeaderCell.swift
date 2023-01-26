//
//  DetailCell.swift
//  MyHabits
//
//  Created by Jazzband on 23.01.2023.
//

import UIKit

class DetailHeaderCell: UITableViewHeaderFooterView {

   static let headerID = "headerID"

    lazy var activityLabel: UILabel = {
        let activityLabele = UILabel()
        activityLabele.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        activityLabele.text = "Активность"
        activityLabele.textColor = .lightGray
        activityLabele.translatesAutoresizingMaskIntoConstraints = false
        return activityLabele
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(activityLabel)
        constraisConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension DetailHeaderCell {

    func constraisConfiguration(){
        NSLayoutConstraint.activate([
            activityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            activityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
