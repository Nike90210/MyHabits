//
//  CreateHabitsViewController.swift
//  MyHabits
//
//  Created by Jazzband on 17.01.2023.
//

import UIKit

class HabitViewController: UIViewController {

    var habit: Habit?
    var numberOfIndex: Int?
    
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
        habitText.textColor = .black
        habitText.translatesAutoresizingMaskIntoConstraints = false
        habitText.tintColor = .black
        habitText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        if let habit = habit{
            habitText.text = habit.name
        }
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
        pickCollor.backgroundColor = .systemOrange
        pickCollor.isUserInteractionEnabled = true
        pickCollor.translatesAutoresizingMaskIntoConstraints = false
        pickCollor.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setUpColor)))
        return pickCollor
    }()

    lazy var color: UIColor = {
        var color = UIColor()
        if let habit = habit {
            color = habit.color
        }else{
            color = .systemOrange
        }
        return color
    }()
    
    
    lazy var frequencyLabel: UILabel = {
        let frequencyLabel = UILabel()
        frequencyLabel.text = "Каждый день в "
        frequencyLabel.font = UIFont.preferredFont(forTextStyle: .body, compatibleWith: .none)
        frequencyLabel.textColor = .black
        frequencyLabel.translatesAutoresizingMaskIntoConstraints = false
        return frequencyLabel
    }()

    lazy var timeOfClockLabel: UILabel = {
        let clockLabelTime = UILabel()
        clockLabelTime.textColor = .systemBlue
        clockLabelTime.text = dataFormatter.string(from: datePicker.date)
        clockLabelTime.translatesAutoresizingMaskIntoConstraints = false
        return clockLabelTime
    }()

    lazy var dataFormatter: DateFormatter = {
        var dateFormater = DateFormatter()
        dateFormater.timeStyle = .short
        dateFormater.dateStyle = .none
        return dateFormater
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(actionForPicker), for: .allEvents)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        if let habit = habit {
            datePicker.date = habit.date
        }else{
            datePicker.date = Date()
        }
        return datePicker
    }()
    
    lazy var removeHabit: UIButton = {
        let removeHabit = UIButton()
        removeHabit.setTitle("Удалить привычку", for: .normal)
        removeHabit.setTitleColor(UIColor?(.systemRed), for: .normal)
        removeHabit.translatesAutoresizingMaskIntoConstraints = false
        removeHabit.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeHabitAction)))
        if let habit = habit{
            return removeHabit
        }else{
            removeHabit.isHidden = true
        }
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


    @objc func saveButton(){

        guard let isText = habitText.text else { return }
        guard isText != "" else { return }
        if habit != nil{
            guard let index = numberOfIndex else { return }
            HabitsStore.shared.habits[index] = Habit(name: habitText.text ?? "", date: datePicker.date, color: pickColor.backgroundColor ?? color)
            self.navigationController?.popToRootViewController(animated: true)
        }else {
            let anotherHabit = Habit(name: habitText.text ?? "", date: datePicker.date, color: pickColor.backgroundColor ?? color)
            let habitStore = HabitsStore.shared
            habitStore.habits.append(anotherHabit)
            dismiss(animated: true)
        }
    }

    @objc func removeHabitAction(){
        let alertControoler = UIAlertController(title: "Удалить привычку", message: "вы уверены, что хотите удалить привычку \(habit?.name ?? " привычка ? ")", preferredStyle: .alert)
        alertControoler.addAction(UIAlertAction(title: "Отменить", style: .cancel){ _ in
            alertControoler.dismiss(animated: true)
        })

        alertControoler.addAction(UIAlertAction(title: "Удалить", style: .destructive){_ in
            guard let numberIndex = self.numberOfIndex else { return }
            HabitsStore.shared.habits.remove(at: numberIndex)
            self.navigationController?.popToRootViewController(animated: true)
        })
        present(alertControoler, animated: true)
    }

    @objc func actionForPicker(){
        timeOfClockLabel.text = dataFormatter.string(from: datePicker.date)
    }
    
    @objc func setUpColor(){
        let setColor = UIColorPickerViewController()
        setColor.selectedColor = pickColor.backgroundColor ?? color
        setColor.delegate = self
        present(setColor, animated: true)
    }
    
    @objc func cancelButton(){

        if habit != nil{
            self.navigationController?.popViewController(animated: true)
        }else{
            dismiss(animated: true)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(habitText)
        view.addSubview(colorLabel)
        view.addSubview(pickColor)
        view.addSubview(timeLabel)
        view.addSubview(frequencyLabel)
        view.addSubview(datePicker)
        view.addSubview(removeHabit)
        view.addSubview(timeOfClockLabel)
        constrainsConfiguration()
    }
}

extension HabitViewController: UIColorPickerViewControllerDelegate{
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        pickColor.backgroundColor = color
    }
}

extension HabitViewController {
    
    func constrainsConfiguration(){
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.widthAnchor.constraint(equalToConstant: 120),

            habitText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 46),
            habitText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            habitText.heightAnchor.constraint(equalToConstant: 22),
            habitText.widthAnchor.constraint(equalToConstant: 340),

            colorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 83),
            colorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            colorLabel.heightAnchor.constraint(equalToConstant: 18),
            colorLabel.widthAnchor.constraint(equalToConstant: 36),

            pickColor.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            pickColor.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pickColor.widthAnchor.constraint(equalToConstant: 30),
            pickColor.heightAnchor.constraint(equalToConstant: 30),

            timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 153),
            timeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            timeLabel.widthAnchor.constraint(equalToConstant: 47),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),

            frequencyLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            frequencyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),

            timeOfClockLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            timeOfClockLabel.leadingAnchor.constraint(equalTo: frequencyLabel.trailingAnchor),

            datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 215),
            datePicker.widthAnchor.constraint(equalToConstant: 375),
            datePicker.heightAnchor.constraint(equalToConstant: 216),

            removeHabit.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            removeHabit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),

        ])
    }
}
