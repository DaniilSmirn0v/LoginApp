//
//  ImageViewController.swift
//  LoginApp
//
//  Created by Даниил Смирнов on 17.02.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var personalPhotoImageView: UIImageView!

    var person = Person.getInfoAboutPerson()

    override func viewDidLoad() {
        view.backgroundColor = .black
        personalPhotoImageView.image = UIImage(named: person.image)
        super.viewDidLoad()
    }

}
