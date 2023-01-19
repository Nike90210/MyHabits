//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Jazzband on 13.01.2023.
//

import UIKit

class InfoViewController: UIViewController {

    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        scrollViewText()
        setUpConstrains()
        title = "Информация"

    }
    lazy var textLlabelInfo : UILabel = {
        let textLabelInfo = UILabel()
        textLabelInfo.translatesAutoresizingMaskIntoConstraints = false
        textLabelInfo.text = "Привычка за 21 день"
        textLabelInfo.font = .boldSystemFont(ofSize: 20)
        textLabelInfo.textColor = .black
        return textLabelInfo
    }()

    lazy var textInformation1: UILabel = {
        let textFieldInfo1 = UILabel()
        textFieldInfo1.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo1.textColor = .black
        textFieldInfo1.numberOfLines = 0
        textFieldInfo1.text = "1. Провести 1 день без обращения к старым привычкам, стараться весьи себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        return textFieldInfo1
    }()
    lazy var textInformation2: UILabel = {
        let textFieldInfo = UILabel()
        textFieldInfo.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo.numberOfLines = 0
        textFieldInfo.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        return textFieldInfo
    }()
    lazy var textInformation3: UILabel = {
        let textFieldInfo = UILabel()
        textFieldInfo.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo.numberOfLines = 0
        textFieldInfo.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги - что оказалось тяжело, что - легче, с чем еще предстоит серьезно бороться."
        return textFieldInfo
    }()
    lazy var textInformation4: UILabel = {
        let textFieldInfo = UILabel()
        textFieldInfo.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo.numberOfLines = 0
        textFieldInfo.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уе примет форму осозноого преодоления и человек сможет больше рабоать в сторону принятия положительных качеств."
        return textFieldInfo
    }()
    lazy var textInformation5: UILabel = {
        let textFieldInfo = UILabel()
        textFieldInfo.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo.numberOfLines = 0
        textFieldInfo.text = "5. Держать планку 40 дней.Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        return textFieldInfo
    }()
    lazy var textInformation6: UILabel = {
        let textFieldInfo = UILabel()
        textFieldInfo.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo.numberOfLines = 0
        textFieldInfo.text = "6. На 90-й день соблюдения техники вс лишнее из ''прошлой жизни'' перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью освободившимся."
        return textFieldInfo
    }()

    lazy var textInformation7: UILabel = {
        let textFieldInfo = UILabel()
        textFieldInfo.translatesAutoresizingMaskIntoConstraints = false
        textFieldInfo.numberOfLines = 0
        textFieldInfo.text = "Источник: psychbook.ru"
        return textFieldInfo
    }()

    func scrollViewText(){
        self.scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 900)
        self.view.addSubview(scrollView)
        scrollView.addSubview(textInformation1)
        scrollView.addSubview(textInformation2)
        scrollView.addSubview(textInformation3)
        scrollView.addSubview(textInformation4)
        scrollView.addSubview(textInformation5)
        scrollView.addSubview(textInformation6)
        scrollView.addSubview(textInformation7)
        scrollView.addSubview(textLlabelInfo)
    }
}

extension InfoViewController{

    func setUpConstrains(){
        NSLayoutConstraint.activate([
            self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            self.scrollView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.scrollView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),

            textLlabelInfo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 22),
            textLlabelInfo.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textLlabelInfo.widthAnchor.constraint(equalToConstant: 218),
            textLlabelInfo.heightAnchor.constraint(equalToConstant: 24),

            textInformation1.topAnchor.constraint(equalTo: textLlabelInfo.bottomAnchor, constant: 16),
            textInformation1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation1.widthAnchor.constraint(equalToConstant: 343),

            textInformation2.topAnchor.constraint(equalTo: textInformation1.bottomAnchor, constant: 12),
            textInformation2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation2.widthAnchor.constraint(equalToConstant: 343),

            textInformation3.topAnchor.constraint(equalTo: textInformation2.bottomAnchor, constant: 12),
            textInformation3.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation3.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation3.widthAnchor.constraint(equalToConstant: 343),

            textInformation4.topAnchor.constraint(equalTo: textInformation3.bottomAnchor, constant: 12),
            textInformation4.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation4.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation4.widthAnchor.constraint(equalToConstant: 343),

            textInformation5.topAnchor.constraint(equalTo: textInformation4.bottomAnchor, constant: 12),
            textInformation5.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation5.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation5.widthAnchor.constraint(equalToConstant: 343),

            textInformation6.topAnchor.constraint(equalTo: textInformation5.bottomAnchor, constant: 12),
            textInformation6.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation6.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation6.widthAnchor.constraint(equalToConstant: 343),

            textInformation7.topAnchor.constraint(equalTo: textInformation6.bottomAnchor, constant: 12),
            textInformation7.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textInformation7.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textInformation7.widthAnchor.constraint(equalToConstant: 343)
        ])
    }
}
