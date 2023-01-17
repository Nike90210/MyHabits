//
//  CreateHabitsViewController.swift
//  MyHabits
//
//  Created by Jazzband on 17.01.2023.
//

import UIKit

class HabitViewController: UIViewController {

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
    
    @objc func cancelButton(){
        
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
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
