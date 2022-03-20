//
//  LaunchCollectionViewCell.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 20.03.2022.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    var stateLaunch: Bool?{
        didSet {
            if !stateLaunch! {
                launchImage.image = UIImage(named: "rocketDown")
                stateLaunchImage.image = UIImage(systemName: "xmark.circle.fill")
                stateLaunchImage.tintColor = .red
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func setUpConstaints(){

       addSubview(nameLabel)
       addSubview(dataLabel)
       addSubview(launchImage)
       launchImage.addSubview(stateLaunchImage)
       let labelNameConstraints = [
           nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
           nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
           nameLabel.heightAnchor.constraint(equalToConstant: 28),
           nameLabel.rightAnchor.constraint(equalTo: launchImage.leftAnchor)
           
       ]
       let labelDataConstraints = [
        dataLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
        dataLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
        dataLabel.heightAnchor.constraint(equalToConstant: 24),
        dataLabel.rightAnchor.constraint(equalTo: launchImage.leftAnchor)
           
       ]
       let imageLaunchConstraints = [
        launchImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 34),
        launchImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        launchImage.heightAnchor.constraint(equalToConstant: 32),
        launchImage.widthAnchor.constraint(equalToConstant: 32),
       ]
       
       let imageStateConstraints = [
        stateLaunchImage.bottomAnchor.constraint(equalTo: launchImage.bottomAnchor),
        stateLaunchImage.trailingAnchor.constraint(equalTo: launchImage.trailingAnchor),
        stateLaunchImage.heightAnchor.constraint(equalToConstant: 12),
        stateLaunchImage.widthAnchor.constraint(equalToConstant: 12),
       ]
       [labelNameConstraints, labelDataConstraints, imageLaunchConstraints, imageStateConstraints].forEach{ NSLayoutConstraint.activate($0)}
       
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Название лаунча"
        label.font = UIFont(name: "LabGrotesque-Regular", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dataLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата"
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.textAlignment = .left
        label.textColor = ThemeColors.textGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let launchImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "rocketUp")
        img.backgroundColor = ThemeColors.simpleGray
        img.tintColor = ThemeColors.textGray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let stateLaunchImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.down.circle.fill") 
        img.tintColor = .green
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
}
