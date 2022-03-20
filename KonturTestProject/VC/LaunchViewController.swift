//
//  LaunchViewController.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 18.03.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    var launch = LaunchModel()
    var titleName = "ИМЯ"
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if !launch.isEmpty{
            setupCollectionView()
        } else {
            setupEmtyView()
        }
        navigationItem.title = titleName
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupEmtyView(){
        view.addSubview(labelEmpty)
        let constraints = [
            labelEmpty.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelEmpty.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.clipsToBounds = false
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = false
        
        collectionView.register(LaunchCollectionViewCell.self, forCellWithReuseIdentifier: "cellIdLaunch")
        let constraints = [
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    let labelEmpty: UILabel = {
        let label = UILabel()
        label.text = "Запусков еще не было("
        label.font = UIFont(name: "LabGrotesque-Bold", size: 20)
        label.textColor = ThemeColors.textGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
