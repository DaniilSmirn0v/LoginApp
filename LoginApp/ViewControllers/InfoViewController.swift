//
//  InfoViewController.swift
//  LoginApp
//
//  Created by Даниил Смирнов on 17.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet var hobbiesLabels: [UILabel]!

    var info = Person.getInfoAboutPerson()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else {return}
        imageVC.person = info
    }

    func setupUI() {
        let hobbies = info.hobbies.map { $0.rawValue }
        hobbiesLabels.enumerated().forEach { index, label in
            label.text = hobbies[index]
        }

        fullNameLabel.text = "Полное имя - \(info.fullname)"
        dateOfBirthLabel.text = "Дата рождения - \(info.dateOfBirthday)"
        ageLabel.text = String("Мне \(info.age) годиков")
    }
}
