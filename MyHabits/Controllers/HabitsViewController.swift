//
//  ProgrammViewController.swift
//  MyHabits
//
//  Created by Jazzband on 11.01.2023.
//

import UIKit

class HabitsViewController: UIViewController{

    var storeHabits = HabitsStore.shared

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 12

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .lightText
        collectionView.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: HabitsCollectionViewCell.collectionCellID)
        collectionView.register(ProgressCollectionViewCell.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProgressCollectionViewCell.progressID)
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
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarItem
        navigationController?.navigationBar.tintColor = UIColor.black
        title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createHabit))

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(collectionView)
        addConstrains()
        navigationBar()
        collectionView.reloadData()
        let changePostionLongPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        collectionView.addGestureRecognizer(changePostionLongPress)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

    @objc func createHabit(){
        let hvc = UINavigationController(rootViewController: HabitViewController())
        hvc.modalPresentationStyle = .fullScreen
        present(hvc, animated: true)
    }

    @objc func longPress(_ sender: UILongPressGestureRecognizer){
        let longPress = sender.location(in: collectionView)
        switch sender.state {
        case .began:
            if let item = collectionView.indexPathForItem(at: longPress){
                self.collectionView.beginInteractiveMovementForItem(at: item)
            }else {
                return
            }
        case .changed:
            self.collectionView.updateInteractiveMovementTargetPosition(longPress)
        case .ended:
            self.collectionView.endInteractiveMovement()
        case .cancelled:
            self.collectionView.cancelInteractiveMovement()
        @unknown default:
            return
        }
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

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProgressCollectionViewCell.progressID, for: indexPath) as! ProgressCollectionViewCell
        header.headerConfiguration(storeHabits)
        return header
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitsCollectionViewCell.collectionCellID, for: indexPath) as! HabitsCollectionViewCell
        cell.setupCell(storeHabits.habits[indexPath.item]) {
            self.collectionView.reloadData()
        }
        cell.layer.cornerRadius = 8
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storeHabits.habits.count
    }


    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let hdvc = DetailViewController()
        hdvc.habit = storeHabits.habits[indexPath.row]
        hdvc.numberOfIndex = indexPath.row
        navigationController?.pushViewController(hdvc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = HabitsStore.shared.habits.remove(at: sourceIndexPath.item)
        HabitsStore.shared.habits.insert(item, at: destinationIndexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width,height: 90)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32,height: 130)
    }

}












