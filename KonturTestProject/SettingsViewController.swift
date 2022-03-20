//
//  SettingsViewController.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 19.03.2022.
//

import UIKit
import Lottie

class SettingsViewController: UIViewController {
    
    var action = false
    var changeState = false
    
    static let titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeColors.textGray]
    static let titleTwoTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

    override func viewDidLoad() {
        super.viewDidLoad()
        basicView()
        setupView()
    }
    
    func basicView(){
        let path = UIBezierPath(roundedRect:view.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 25, height: 25))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        view.layer.mask = maskLayer
        view.backgroundColor = ThemeColors.secondaryBlack
    }
    
    func setupView() {
        view.addSubview(labelSettings)
        view.addSubview(buttonBack)
        view.addSubview(stackAll)
        
        let labelSettingsConstrants = [
            labelSettings.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            labelSettings.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let labelButtonsConstrants = [
            buttonBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            buttonBack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24)
        ]
        let heightConstaints = [
            stackAll.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            stackAll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28),
            stackAll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -28),
            stackHeight.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        [labelSettingsConstrants, labelButtonsConstrants, heightConstaints].forEach{ NSLayoutConstraint.activate($0)}
    }
    
    let labelSettings: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Настройки"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let labelHeight: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 176, height: 60)
        label.text = "Высота"
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.textColor = ThemeColors.whiteText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let segmentHeightControl: UISegmentedControl = {
        let item = ["m", "ft"]
        let segment = UISegmentedControl(items: item)
        segment.frame = CGRect(x: 0, y: 0, width: 115, height: 60)
        segment.backgroundColor = .black
        segment.selectedSegmentTintColor = .white
        segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segment.setTitleTextAttributes(titleTwoTextAttributes, for: .selected)
        segment.layer.cornerRadius = 12
        segment.addTarget(self, action:  #selector(changeHeihgt(_:)), for: .valueChanged)
        if UserDefaults.standard.string(forKey: "Height") ==  "ft" {
            segment.selectedSegmentIndex = 1
            
        } else {
            segment.selectedSegmentIndex = 0
        }
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    lazy var stackHeight: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelHeight, segmentHeightControl], axis: .horizontal, spacing: 0, distribution: .fillEqually)
        stack.frame = CGRect(x: 0, y: 0, width: 115, height: 60)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let labelDiametr: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 176, height: 60)
        label.text = "Диаметр"
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.textColor = ThemeColors.whiteText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let segmentDiametrControl: UISegmentedControl = {
        let item = ["m", "ft"]
        let segment = UISegmentedControl(items: item)
        segment.frame = CGRect(x: 0, y: 0, width: 115, height: 60)
        segment.backgroundColor = .black
        segment.selectedSegmentTintColor = .white
        segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segment.setTitleTextAttributes(titleTwoTextAttributes, for: .selected)
        segment.layer.cornerRadius = 12
        segment.addTarget(self, action:  #selector(changeDiametr(_:)), for: .valueChanged)
        if UserDefaults.standard.string(forKey: "Diametr") ==  "ft" {
            segment.selectedSegmentIndex = 1
            
        } else {
            segment.selectedSegmentIndex = 0
        }
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    lazy var stackDiametr: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelDiametr, segmentDiametrControl], axis: .horizontal, spacing: 0, distribution: .fillEqually)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let labelMass: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 176, height: 60)
        label.text = "Масса"
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.textColor = ThemeColors.whiteText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let segmentMassControl: UISegmentedControl = {
        let item = ["kg", "lb"]
        let segment = UISegmentedControl(items: item)
        segment.frame = CGRect(x: 0, y: 0, width: 115, height: 60)
        segment.backgroundColor = .black
        segment.selectedSegmentTintColor = .white
        segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segment.setTitleTextAttributes(titleTwoTextAttributes, for: .selected)
        segment.addTarget(self, action:  #selector(changeMass(_:)), for: .valueChanged)
        segment.layer.cornerRadius = 12
        if UserDefaults.standard.string(forKey: "Mass") ==  "lb" {
            segment.selectedSegmentIndex = 1
            
        } else {
            segment.selectedSegmentIndex = 0
        }
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    lazy var stackMass: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelMass, segmentMassControl], axis: .horizontal, spacing: 0, distribution: .fillEqually)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let labelPayload: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 176, height: 60)
        label.text = "Полезная нагрузка"
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.textColor = ThemeColors.whiteText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let segmentPayloadControl: UISegmentedControl = {
        let item = ["kg", "lb"]
        let segment = UISegmentedControl(items: item)
        segment.frame = CGRect(x: 0, y: 0, width: 115, height: 60)
        segment.backgroundColor = .black
        segment.selectedSegmentTintColor = .white
        segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segment.setTitleTextAttributes(titleTwoTextAttributes, for: .selected)
        segment.addTarget(self, action:  #selector(changePayload(_:)), for: .valueChanged)
        segment.layer.cornerRadius = 12
        if UserDefaults.standard.string(forKey: "Paload") ==  "lb" {
            segment.selectedSegmentIndex = 1
            
        } else {
            segment.selectedSegmentIndex = 0
        }
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    lazy var stackPayload: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelPayload, segmentPayloadControl], axis: .horizontal, spacing: 0, distribution: .fillEqually)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var stackAll: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stackHeight, stackDiametr, stackMass, stackPayload], axis: .vertical, spacing: 40, distribution: .fillEqually)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let buttonBack: UIButton = {
       let btn = UIButton()
        btn.setTitle("Закрыть", for: .normal)
        btn.titleLabel?.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        btn.addTarget(self,action: #selector(goBackButtonAction(_:)), for: .touchUpInside)
        btn.tintColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func goBackButtonAction(_ sender: Any){
        action = true
        if changeState {
        NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
@objc func changeHeihgt(_ segmentedControl: UISegmentedControl) {
    changeState = true
    switch (segmentedControl.selectedSegmentIndex){
    case 0:
        UserDefaults.standard.set("m", forKey: "Height")
    case 1:
        UserDefaults.standard.set("ft", forKey: "Height")
    default:
        print("Error")
    }
    
    }
    @objc func changeDiametr(_ segmentedControl: UISegmentedControl) {
        changeState = true
        switch (segmentedControl.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("m", forKey: "Diametr")
        case 1:
            UserDefaults.standard.set("ft", forKey: "Diametr")
        default:
            print("Error")
        }
        
        }
    @objc func changeMass(_ segmentedControl: UISegmentedControl) {
        changeState = true
        switch (segmentedControl.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("kg", forKey: "Mass")
        case 1:
            UserDefaults.standard.set("lb", forKey: "Mass")
        default:
            print("Error")
        }
        
        }
    @objc func changePayload(_ segmentedControl: UISegmentedControl) {
        changeState = true
        switch (segmentedControl.selectedSegmentIndex){
        case 0:
            UserDefaults.standard.set("kg", forKey: "Payload")
        case 1:
            UserDefaults.standard.set("lb", forKey: "Payload")
        default:
            print("Error")
        }
        
        }
    
    deinit {
        if !action && changeState{
        NotificationCenter.default.post(name: Notification.Name("reloadData"), object: nil)
        }
    }

}
