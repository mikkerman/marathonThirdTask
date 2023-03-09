//
//  ViewController.swift
//  marathonThirdTask
//
//  Created by Михаил Герман on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        constraintsSetting()
        squareViewSettings()
        
        animator = UIViewPropertyAnimator(duration: 0, curve: .linear, animations: {
        self.squareView.transform = CGAffineTransform(rotationAngle: (.pi) / 2).scaledBy(x: 1.5, y: 1.5)
        self.squareView.frame = self.squareView.frame.offsetBy(
            dx:self.view.frame.width - self.squareView.frame.width - self.view.layoutMargins.right,
            dy: 0)
        self.animator.pausesOnCompletion = true
                })
    }
    
    
    
  
    @IBAction func sliderAction(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
    
    @IBAction func releaseSlider(_ sender: UISlider) {
        if animator.isRunning {
            slider.value = Float(animator.fractionComplete)
        }
        slider.setValue(slider.maximumValue, animated: true)
        animator.startAnimation()
    }
    
    
    private func constraintsSetting() {
        let marginsGuide = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: marginsGuide.topAnchor, constant: 50),
            squareView.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            squareView.heightAnchor.constraint(equalToConstant: 70),
            squareView.widthAnchor.constraint(equalToConstant: 70),
            
            slider.topAnchor.constraint(equalTo: squareView.bottomAnchor, constant: 50),
            slider.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: marginsGuide.trailingAnchor),
        ])
        
    }
    private func squareViewSettings(){
        squareView.layer.cornerRadius = 10

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemYellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 10
        
        squareView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}
