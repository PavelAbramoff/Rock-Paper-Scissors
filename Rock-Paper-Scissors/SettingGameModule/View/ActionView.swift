//
//  ActionView.swift
//  Rock-Paper-Scissors
//
//  Created by Belov Igor on 02.10.2023.
//

import UIKit

class ActionView: UIView {
    
    private let backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = .black
        background.alpha = 0
        return background
    }()
    
    private let fonView = UIView()
    
    private let imageViewOne: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor(patternImage: UIImage(named: "scorpion")!)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.specialBlue.cgColor
        return imageView
    }()
    
    private let imageViewTwo: UIImageView = {
               let imageView = UIImageView()
               imageView.backgroundColor = UIColor(patternImage: UIImage(named: "sab-ziro")!)
               imageView.clipsToBounds = true
               imageView.layer.borderWidth = 5
               imageView.layer.borderColor = UIColor.specialBlue.cgColor
               return imageView
           }()
    
    private var mainView: UIView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentView(viewController: UIViewController, numberRounds: Int) {
        guard let parentView = viewController.view else { return }
        mainView = parentView
        backgroundView.frame = parentView.frame
        parentView.addSubview(backgroundView)
        
        fonView.frame = parentView.frame
        parentView.addSubview(fonView)
        
        imageViewOne.frame = CGRect(x: -parentView.frame.width,
                                    y: 100,
                                    width: parentView.frame.width - 20,
                                    height: 200)
        imageViewOne.image = UIImage(named: "sab-ziro")
        imageViewOne.contentMode = .scaleAspectFill
        imageViewOne.clipsToBounds = true
        imageViewOne.alpha = 1
        fonView.addSubview(imageViewOne)
        
        UIView.animate(withDuration: 1) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 2) {
                    self.imageViewOne.frame = CGRect(x: 10,
                                                y: 100,
                                                width: self.backgroundView.frame.width - 20,
                                                height: 200)
                }
            }
        }
    }
//        private let vSLabel: UILabel = {
//            let label = UILabel()
//            label.text = "VS"
//            label.alpha = 0.0
//            label.font = .robotoBold16()
//            label.textAlignment = .center
//            label.textColor = .specialGrayText
//            label.translatesAutoresizingMaskIntoConstraints = false
//            return label
//        }()
//        
//        private let vsView: UIView = {
//          let view = UIView()
//            view.backgroundColor = .white
//            view.alpha = 0.0
//            view.frame.size = CGSize(width: 50, height: 50)
//            view.layer.cornerRadius = 25
//            view.layer.borderWidth = 5
//            view.layer.borderColor = UIColor.specialBlue.cgColor
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
    
//    private func animation() {
//        let initialFrameOne = CGRect(x: -view.frame.size.width,
//                                     y: 200,
//                                     width: view.bounds.width * 0.7,
//                                     height: view.bounds.width * 0.7 * 0.3)
//        imageViewOne.frame = initialFrameOne
//
//        let finalFrameOne = CGRect(x: view.bounds.width * 0.3 / 2,
//                                   y: 200, width: view.bounds.width * 0.7,
//                                   height: view.bounds.width * 0.7 * 0.3)
//
//        let initialFrameTwo = CGRect(x: view.frame.size.width,
//                                     y: imageViewOne.frame.origin.y + imageViewOne.frame.height + 6,
//                                     width: view.bounds.width * 0.7,
//                                     height: view.bounds.width * 0.7 * 0.3)
//        imageViewTwo.frame = initialFrameTwo
//
//        let finalFrameTwo = CGRect(x: view.bounds.width * 0.3 / 2, y: imageViewOne.frame.origin.y + imageViewOne.frame.height + 5, width: view.bounds.width * 0.7, height: view.bounds.width * 0.7 * 0.3)
//
//        view.addSubview(imageViewOne)
//        UIView.animate(withDuration: 2) {
//            self.imageViewOne.frame = finalFrameOne
//        }
//
//        view.addSubview(imageViewTwo)
//        UIView.animate(withDuration: 2) {
//            self.imageViewTwo.frame = finalFrameTwo
//        }
//
//        let initialFrameVS = CGRect(x: view.bounds.size.width / 2 - vsView.bounds.size.height / 2,
//                                    y: imageViewTwo.frame.origin.y - 3 - vsView.bounds.size.height / 2,
//                                    width: self.vsView.bounds.width,
//                                     height: self.vsView.bounds.width)
//
//        vsView.frame = initialFrameVS
//
//        view.addSubview(vsView)
//        view.addSubview(vSLabel)
//        NSLayoutConstraint.activate([
//            vSLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            vSLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 275)
//        ])
//        UIView.animate(withDuration: 2) {
//            self.vsView.alpha = 1.0
//            self.vSLabel.alpha = 1.0
//        }
//    }
//}
}
