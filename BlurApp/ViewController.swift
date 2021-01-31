//
//  ViewController.swift
//  BlurApp
//
//  Created by Ludmila Rezunic on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet var backgroundImageView: UIImageView! // Фон, который должен быть размыт
    
    // Названия изображений из ассетов
    let imageSet = ["crop", "vinyl", "concert", "theBeatles", "crowd"]
    var blurEffectView: UIVisualEffectView?
    
    // Функция срабатывает при изменении положения на landscape mode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        backgroundImageView?.frame = view.bounds
        blurEffectView?.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedImageIndex = Int(arc4random_uniform(3)) // Рандомим число
        loginView.layer.cornerRadius = CGFloat(10) // Настраиваем радиус закруглений экрана
        
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView!)
        blurEffectView?.alpha = 0.65
    }
    
    
}

