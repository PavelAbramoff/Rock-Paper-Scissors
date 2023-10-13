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
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private let imageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private let vSimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.backgroundColor = .clear
        imageView.alpha = 0
        return imageView
    }()
    
    private var mainView: UIView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentView(viewController: UIViewController) {
        guard let parentView = viewController.view else { return }
        mainView = parentView
        backgroundView.frame = parentView.frame
        parentView.addSubview(backgroundView)
        
        fonView.frame = parentView.frame
        parentView.addSubview(fonView)
        
        imageViewOne.frame = CGRect(x: parentView.frame.width,
                                    y: 200,
                                    width: parentView.frame.width - 20,
                                    height: 200)
        imageViewOne.image = UIImage(named: "mario")
        imageViewOne.contentMode = .scaleAspectFill
        imageViewOne.clipsToBounds = true
        imageViewOne.layer.cornerRadius = imageViewOne.frame.height / 2
        fonView.addSubview(imageViewOne)
        
        imageViewTwo.frame = CGRect(x: -parentView.frame.width,
                                    y: imageViewOne.frame.maxY + 50,
                                    width: parentView.frame.width - 20,
                                    height: 200)
        imageViewTwo.image = UIImage(named: "robot")
        imageViewTwo.contentMode = .scaleAspectFill
        imageViewTwo.clipsToBounds = true
        imageViewTwo.layer.cornerRadius = imageViewTwo.frame.height / 2
        fonView.addSubview(imageViewTwo)
        
        vSimageView.frame = CGRect(x: parentView.frame.width / 2 - parentView.frame.width / 4,
                                   y: imageViewOne.frame.maxY + 25 - parentView.frame.width / 4,
                                   width: parentView.frame.width / 2,
                                   height: parentView.frame.width / 2)
        vSimageView.image = UIImage(named: "vsLabel")
        vSimageView.contentMode = .scaleAspectFit
        fonView.addSubview(vSimageView)
        
        UIView.animate(withDuration: 1) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 2) {
                    self.imageViewOne.frame = CGRect(x: 10,
                                                y: 200,
                                                width: self.backgroundView.frame.width - 20,
                                                height: 200)
                    self.imageViewTwo.frame = CGRect(x: 10,
                                                     y: self.imageViewOne.frame.maxY + 50,
                                                     width: self.backgroundView.frame.width - 20,
                                                     height: 200)
                } completion: { done in
                    if done {
                        UIView.animate(withDuration: 0.5) {
                            self.vSimageView.alpha = 1
                        }
                    }
                }
            }
        }
    }
    
    func removeView() {
        fonView.removeFromSuperview()
        backgroundView.alpha = 0
        vSimageView.alpha = 0
        backgroundView.removeFromSuperview()
    }
}
