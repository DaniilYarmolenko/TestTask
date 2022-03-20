//
//  LaunchViewControllerExtension.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 20.03.2022.
//


import UIKit
extension LaunchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return launch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdLaunch", for: indexPath) as! LaunchCollectionViewCell
        let launch = launch[indexPath.row]
        if launch.success == nil {
            cell.stateLaunch = false
        } else {
            cell.stateLaunch = launch.success!
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        if let date = dateFormatterGet.date(from: launch.dateUTC) {
            cell.dataLabel.text = dateFormatter.string(from: date)
        } else {
            cell.dataLabel.text = ""
        }

        cell.nameLabel.text = launch.name
        cell.backgroundColor = ThemeColors.simpleGray
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 30,
                             height: collectionView.frame.width - 280)
    }
}
