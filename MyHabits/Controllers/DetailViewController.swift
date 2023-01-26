//
//  DetailViewController.swift
//  MyHabits
//
//  Created by Jazzband on 22.01.2023.
//

import UIKit

class DetailViewController: UIViewController {

    var habit: Habit?
    var numberOfIndex: Int?

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.sectionHeaderTopPadding = 0.7
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.dateID)
        tableView.register(DetailHeaderCell.self, forHeaderFooterViewReuseIdentifier: DetailHeaderCell.headerID)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        setingConstrains()
        navigationBarSetings()


    }

   private lazy var dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
       dateFormater.timeStyle = .none
       dateFormater.dateStyle = .long
        dateFormater.locale = Locale(identifier: "ru-RU")
        dateFormater.doesRelativeDateFormatting = true
        return dateFormater
    }()

}

extension DetailViewController{

    func setingConstrains(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }


    func navigationBarSetings(){
        let navigationBar = UINavigationBarAppearance()
        navigationBar.backgroundColor = .white
        title = habit?.name
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.scrollEdgeAppearance = navigationBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editHabit))
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
        navigationItem.leftBarButtonItem?.title = "Сегодня"
        navigationItem.leftBarButtonItem?.tintColor = .systemPurple
        navigationItem.leftBarButtonItem?.style = .done
    }

    @objc func editHabit(){

        let toHVC = HabitViewController()
        toHVC.habit = habit
        toHVC.numberOfIndex = numberOfIndex
        navigationController?.show(toHVC, sender: .none)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerSettings = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailHeaderCell.headerID)
        return headerSettings
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        49
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.dateID, for: indexPath) as! DateTableViewCell
        cell.dateLabel.text = dateFormater.string(from: HabitsStore.shared.dates[HabitsStore.shared.dates.count - indexPath.item - 1])
        guard let habit = habit else { return cell }
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[HabitsStore.shared.dates.count - indexPath.item - 1]){
            cell.dateImage.image = UIImage(systemName: "checkmark")
        }
        return cell
    }


}
