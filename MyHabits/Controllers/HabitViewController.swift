//
//  CreateHabitsViewController.swift
//  MyHabits
//
//  Created by Jazzband on 17.01.2023.
//

import UIKit

class HabitViewController: UIViewController {

    var colorPicker: UIColorPickerViewController!
    var scrollViewCreateHabits: UIScrollView!


    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "НАЗВАНИЕ"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: .none)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    lazy var habitText: UITextField = {
        let habitText = UITextField()
        habitText.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        habitText.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: .none)
        habitText.textColor = .systemBlue
        habitText.translatesAutoresizingMaskIntoConstraints = false
        return habitText
    }()

    lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.text = "ЦВЕТ"
        colorLabel.font = UIFont.preferredFont(forTextStyle: .footnote, compatibleWith: .none)
        colorLabel.textColor = .black
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        return colorLabel
    }()

    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.text = "ВРЕМЯ"
        timeLabel.font = UIFont.preferredFont(forTextStyle: .footnote, compatibleWith: .none)
        timeLabel.textColor = .black
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()

    lazy var pickColor: UIImageView = {
        let pickCollor = UIImageView()
        pickCollor.layer.cornerRadius = 15
        pickCollor.clipsToBounds = true
        pickCollor.backgroundColor = .systemOrange
        pickCollor.translatesAutoresizingMaskIntoConstraints = false
        pickCollor.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(setUpColor)))
        return pickCollor
    }()


    lazy var frequencyLabel: UILabel = {
        let frequencyLabel = UILabel()
        frequencyLabel.text = "Каждый день в \(datePicker.datePickerMode)"
        frequencyLabel.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: .none)
        frequencyLabel.textColor = .black
        frequencyLabel.translatesAutoresizingMaskIntoConstraints = false
        return frequencyLabel
    }()

    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    lazy var removeHabit: UIButton = {
        let removeHabit = UIButton()
        removeHabit.setTitle("Удалить привычку", for: .normal)
        removeHabit.setTitleColor(UIColor?(.systemRed), for: .normal)
        removeHabit.translatesAutoresizingMaskIntoConstraints = false
        return removeHabit
    }()



    private func navigationBar(){
        let navigationAperrance = UINavigationBarAppearance()
        navigationAperrance.titleTextAttributes = [.foregroundColor: UIColor.systemPurple]
        navigationAperrance.backgroundColor = .white
        navigationItem.scrollEdgeAppearance = navigationAperrance
        let leftButton = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(cancelButton))
        let rightButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButton))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
        navigationItem.leftBarButtonItem?.tintColor = .systemPurple
        title = "Создать"
    }

    private func scrollViewForHabit(){
        self.scrollViewCreateHabits = UIScrollView()
        scrollViewCreateHabits.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 900)
        scrollViewCreateHabits.keyboardDismissMode = .interactive
        scrollViewCreateHabits.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(scrollViewCreateHabits)
        scrollViewCreateHabits.addSubview(nameLabel)
        scrollViewCreateHabits.addSubview(habitText)
        scrollViewCreateHabits.addSubview(colorLabel)
        scrollViewCreateHabits.addSubview(timeLabel)
        scrollViewCreateHabits.addSubview(pickColor)
        scrollViewCreateHabits.addSubview(frequencyLabel)
        scrollViewCreateHabits.addSubview(datePicker)
        scrollViewCreateHabits.addSubview(removeHabit)
    }

    @objc func setUpColor(){
        self.colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.present(colorPicker, animated: true)
    }

    @objc func cancelButton(){
        dismiss(animated: true)
    }

    @objc func saveButton(){

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationBar()
        scrollViewForHabit()
        constrainsConfiguration()
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate{

}

extension HabitViewController {

    func constrainsConfiguration(){
        NSLayoutConstraint.activate([
            self.scrollViewCreateHabits.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            self.scrollViewCreateHabits.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            self.scrollViewCreateHabits.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            self.scrollViewCreateHabits.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),

            nameLabel.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.widthAnchor.constraint(equalToConstant: 120),

            habitText.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 46),
            habitText.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 15),
            habitText.heightAnchor.constraint(equalToConstant: 22),
            habitText.widthAnchor.constraint(equalToConstant: 340),

            colorLabel.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 83),
            colorLabel.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 16),
            colorLabel.heightAnchor.constraint(equalToConstant: 18),
            colorLabel.widthAnchor.constraint(equalToConstant: 36),

            pickColor.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 108),
            pickColor.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 16),
            pickColor.widthAnchor.constraint(equalToConstant: 30),
            pickColor.heightAnchor.constraint(equalToConstant: 30),

            timeLabel.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 153),
            timeLabel.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 16),
            timeLabel.widthAnchor.constraint(equalToConstant: 47),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),

            frequencyLabel.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 178),
            frequencyLabel.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 16),
            frequencyLabel.widthAnchor.constraint(equalToConstant: 320),
            frequencyLabel.heightAnchor.constraint(equalToConstant: 22),

            datePicker.topAnchor.constraint(equalTo: scrollViewCreateHabits.topAnchor, constant: 215),
            datePicker.widthAnchor.constraint(equalToConstant: 375),
            datePicker.heightAnchor.constraint(equalToConstant: 216),

            removeHabit.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 219),
            removeHabit.bottomAnchor.constraint(equalTo: scrollViewCreateHabits.bottomAnchor, constant: 18),
            removeHabit.leadingAnchor.constraint(equalTo: scrollViewCreateHabits.leadingAnchor, constant: 114.5),
            removeHabit.trailingAnchor.constraint(equalTo: scrollViewCreateHabits.trailingAnchor, constant: 113.5),
            removeHabit.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
