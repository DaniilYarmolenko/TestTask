//
//  FirstViewControllerExtension.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 17.03.2022.
//
import UIKit

extension RocketViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocket.count
    }
    
    //MARK: CELL CONFIGURE ----------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RocketCollectionViewCell
        let rocket = rocket[indexPath.row]
        cell.rocketModel = rocket
        cell.rocketViewController = self
        
        if UserDefaults.standard.string(forKey: "Height") == "ft" && rocket.height.feet != nil {
            cell.labelHeightFirst.text = "\(rocket.height.feet!)"
            cell.labelHeightSecond.text = "Высота, ft"
        } else {
            cell.labelHeightFirst.text = "\(rocket.height.meters!)"
            cell.labelHeightSecond.text = "Высота, m"
        }
        
        if UserDefaults.standard.string(forKey: "Diametr") == "ft" && rocket.diameter.feet != nil {
            cell.labelDiametrFirst.text = "\(rocket.diameter.feet!)"
            cell.labelDiametrSecond.text = "Диаметр, ft"
        } else {
            cell.labelDiametrFirst.text = "\(rocket.diameter.meters!)"
            cell.labelDiametrSecond.text = "Диаметр, m"
        }
        
        if UserDefaults.standard.string(forKey: "Mass") == "lb" {
            cell.labelMassFirst.text = "\(rocket.mass.lb)"
            cell.labelMassSecond.text = "Масса, lb"
        } else {
            cell.labelMassFirst.text = "\(rocket.mass.kg)"
            cell.labelMassSecond.text = "Масса, kg"
        }
        
        if UserDefaults.standard.string(forKey: "Payload") == "lb" && rocket.payloadWeights.first != nil {
            cell.labelPayloadFirst.text = "\(rocket.payloadWeights.first!.lb)"
            cell.labelPayloadSecond.text = "Нагрузка, lb"
        } else if rocket.payloadWeights.first != nil{
            cell.labelPayloadFirst.text = "\(rocket.payloadWeights.first!.kg)"
            cell.labelPayloadSecond.text = "Нагрузка, kg"
        }
        
        
        if rocket.flickrImages.first != nil{
            let stringURL = URL(string: rocket.flickrImages.first!)
            cell.imageRocket.sd_setImage(with: stringURL as URL?, placeholderImage:  UIImage(systemName: "scribble"))
        }
        
        cell.firstLaunchLabelData.text = "\(rocket.firstFlight)"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        if let date = dateFormatterGet.date(from: rocket.firstFlight) {
            cell.firstLaunchLabelData.text = dateFormatter.string(from: date)
        } else {
            cell.firstLaunchLabelData.text = ""
        }
        
        cell.countryLabel.text = "\(rocket.country)"
        cell.payloadCostLabel.text = "$\(rocket.costPerLaunch/1_000_000) млн"
        
        cell.countEngineLabel.text = "\(rocket.firstStage.engines)"
        cell.countGasLabel.text = "\(rocket.firstStage.fuelAmountTons) ton"
        if rocket.firstStage.burnTimeSEC != nil {
        cell.fireTimeLabel.text = "\(rocket.firstStage.burnTimeSEC!) sec"
        } else {
            cell.fireTimeLabel.text = "no information"
        }
        
        cell.countEngineTwoLabel.text = "\(rocket.secondStage.engines)"
        cell.countGasTwoLabel.text = "\(rocket.secondStage.fuelAmountTons) ton"
        if rocket.secondStage.burnTimeSEC != nil {
        cell.fireTimeTwoLabel.text = "\(rocket.secondStage.burnTimeSEC!) sec"
        } else {
            cell.fireTimeLabel.text = "no information"
        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    //MARK: ANIMATION ----------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let rocketCell = cell as! RocketCollectionViewCell
        rocketCell.imageRocket.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        rocketCell.nameLabel.transform = CGAffineTransform(translationX: view.frame.origin.x + view.frame.width/2, y: 0)
        rocketCell.stackBasicInfo.transform = CGAffineTransform(translationX: view.frame.origin.x + view.frame.width/2, y: 0)
        rocketCell.stackFirstStage.transform = CGAffineTransform(translationX: view.frame.origin.x + view.frame.width/2, y: 0)
        rocketCell.stackSecondStage.transform = CGAffineTransform(translationX: view.frame.origin.x + view.frame.width/2, y: 0)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            rocketCell.imageRocket.transform = .identity
            rocketCell.nameLabel.transform = .identity
            rocketCell.stackBasicInfo.transform = .identity
            rocketCell.stackFirstStage.transform = .identity
            rocketCell.stackSecondStage.transform = .identity
        })
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
    //MARK: CELL CONFIGURE ----------------------------------------------------------------------------------------------------
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let xValue = targetContentOffset.pointee.x
        let pageNum = Int(xValue / view.frame.width)
        pageControl.currentPage = pageNum

    }
    
}

