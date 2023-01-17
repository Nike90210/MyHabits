//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Jazzband on 17.01.2023.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {


    static let progressID = "progressID"

    lazy var progresslabelName: UILabel = {
        let progessLabelName = UILabel()
        progessLabelName.backgroundColor = .systemGray
        progessLabelName.font = UIFont.systemFont(ofSize: 13)
        progessLabelName.numberOfLines = 1
        progessLabelName.text = "Все получилось"
        progessLabelName.translatesAutoresizingMaskIntoConstraints = false
        return progessLabelName
    }()

    lazy var progressPercentage: UILabel = {
        let progressPercentage = UILabel()
        progressPercentage.backgroundColor = .systemGray
        progressPercentage.font = UIFont.systemFont(ofSize: 13)
        progressPercentage.numberOfLines = 1
        progressPercentage.translatesAutoresizingMaskIntoConstraints = false
        return progressPercentage
    }()

    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.backgroundColor = .systemPurple
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    lazy var baseView: UIView = {
        let baseView = UIView()
        baseView.backgroundColor = .white
        baseView.addSubview(progresslabelName)
        baseView.addSubview(progressPercentage)
        baseView.addSubview(progressView)
        baseView.translatesAutoresizingMaskIntoConstraints = false
        return baseView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(baseView)
        constrancsSetUp()
    }

}

extension ProgressCollectionViewCell {

    func constrancsSetUp(){
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            baseView.heightAnchor.constraint(equalToConstant: 60),

            progresslabelName.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            progresslabelName.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 12),

            progressView.topAnchor.constraint(equalTo: progresslabelName.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 12),
            progressView.heightAnchor.constraint(equalToConstant: 7),
            progressView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32 - 24),

            progressPercentage.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 12),
            progressPercentage.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: UIScreen.main.bounds.width - 32 - 24)
        ])
    }
}
