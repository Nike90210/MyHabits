//
//  ProgrammViewController.swift
//  MyHabits
//
//  Created by Jazzband on 11.01.2023.
//

import UIKit

class HabitsViewController: UIViewController{


    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 12

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
        collectionView.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: HabitsCollectionViewCell.collectionCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    func navigationBar(){
        let navigationBarItem = UINavigationBarAppearance()
        navigationBarItem.backgroundColor = .white
        navigationBarItem.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.scrollEdgeAppearance = navigationBarItem
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance = navigationBarItem
        navigationController?.navigationBar.tintColor = UIColor.black
        title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createHabit))

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        addConstrains()
        navigationBar()
    }

    @objc func createHabit(){
      let hvc = UINavigationController(rootViewController: HabitViewController())
        hvc.modalPresentationStyle = .fullScreen
       present(hvc, animated: true)
    }
}


extension HabitsViewController{
    func addConstrains(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            collectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitsCollectionViewCell.collectionCellID, for: indexPath) as! HabitsCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: (UIScreen.main.bounds.width - 32), height: 130)
    }





}




