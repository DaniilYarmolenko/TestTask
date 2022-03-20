//
//  RocketCollectionViewCell.swift
//  KonturTestProject
//
//  Created by Даниил Ярмоленко on 16.03.2022.
//

import UIKit
import SDWebImage

class RocketCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    var rocketViewController: RocketViewController!
    var topicLabel = UILabel()
    var rocketModel: RocketModelElement?{
        didSet {
            nameLabel.text = rocketModel?.name
        }
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstaints()
        backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setUpConstaints() {
        
        addSubview(scrollView)
        
        scrollView.addSubview(imageRocket)
        scrollView.addSubview(contentScrollView)
        [nameLabel, buttonSetting, secondScrollView, stackBasicInfo, stackFirstStage, stackSecondStage, buttonLaunch].forEach{ contentScrollView.addSubview($0)}
        [stackHeight, stackDiametr, stackMass, (stackPayload)].forEach{ secondScrollView.addSubview($0)}
        
        
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1200)
        secondScrollView.contentSize = CGSize(width: 444, height: 96)
        scrollView.indicatorStyle = .black
        
        let labelConstraints = [
            nameLabel.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 32),
            nameLabel.widthAnchor.constraint(equalToConstant: 146),
            
        ]
        let buttonSettingsConstaints = [
            buttonSetting.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 20),
            buttonSetting.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            buttonSetting.heightAnchor.constraint(equalToConstant: 32),
            buttonSetting.widthAnchor.constraint(equalToConstant: 32),
        ]
        let imageConstraints = [
            imageRocket.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -15),
            imageRocket.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            imageRocket.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            imageRocket.heightAnchor.constraint(equalToConstant: 250),
            imageRocket.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ]
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ]
        let secondScrollViewConstraints = [
            secondScrollView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            secondScrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            secondScrollView.heightAnchor.constraint(equalToConstant: 100),
            secondScrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
        ]
        let buttonLaunchViewConstraints = [
            buttonLaunch.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonLaunch.heightAnchor.constraint(equalToConstant: 56),
            buttonLaunch.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width*7/8),
            buttonLaunch.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: -100)
            
        ]
        let contentScrollViewConstraints = [
            contentScrollView.topAnchor.constraint(equalTo: imageRocket.bottomAnchor, constant: -20),
            contentScrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentScrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20)
        ]
        let stackHeightConstraints = [
            stackHeight.leftAnchor.constraint(equalTo: secondScrollView.leftAnchor, constant: 16),
            stackHeight.widthAnchor.constraint(equalToConstant: 96),
            stackHeight.heightAnchor.constraint(equalToConstant: 96)
        ]
        let stackDiametrConstraints = [
            stackDiametr.leftAnchor.constraint(equalTo: stackHeight.rightAnchor, constant: 12),
            stackDiametr.widthAnchor.constraint(equalToConstant: 96),
            stackDiametr.heightAnchor.constraint(equalToConstant: 96)
        ]
        let stackMassConstraints = [
            stackMass.leftAnchor.constraint(equalTo: stackDiametr.rightAnchor, constant: 12),
            stackMass.widthAnchor.constraint(equalToConstant: 96),
            stackMass.heightAnchor.constraint(equalToConstant: 96)
        ]
        let stackPayloadConstraints = [
            stackPayload.leftAnchor.constraint(equalTo: stackMass.rightAnchor, constant: 12),
            stackPayload.widthAnchor.constraint(equalToConstant: 96),
            stackPayload.heightAnchor.constraint(equalToConstant: 96)
        ]
        let stackBasicInfoConstraints = [
            stackBasicInfo.topAnchor.constraint(equalTo: secondScrollView.bottomAnchor, constant: 32),
            stackBasicInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
            stackBasicInfo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-64),
            stackBasicInfo.heightAnchor.constraint(equalToConstant: 100)
        ]
        let stackFirstStageConstraints = [
            stackFirstStage.topAnchor.constraint(equalTo: stackBasicInfo.bottomAnchor, constant: 32),
            stackFirstStage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
            stackFirstStage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-64),
            stackFirstStage.heightAnchor.constraint(equalToConstant: 140)
        ]
        let stackSecondStageConstraints = [
            stackSecondStage.topAnchor.constraint(equalTo: stackFirstStage.bottomAnchor, constant: 32),
            stackSecondStage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 32),
            stackSecondStage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-64),
            stackSecondStage.heightAnchor.constraint(equalToConstant: 140)
        ]
        
        let heightConstraints = contentScrollView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraints.priority = UILayoutPriority(250)
        heightConstraints.isActive = true
        
        [scrollViewConstraints,contentScrollViewConstraints, labelConstraints, buttonSettingsConstaints, imageConstraints, secondScrollViewConstraints,stackBasicInfoConstraints, stackFirstStageConstraints, stackSecondStageConstraints, stackHeightConstraints, stackDiametrConstraints, stackMassConstraints, stackPayloadConstraints, buttonLaunchViewConstraints].forEach{ NSLayoutConstraint.activate($0)}
        
        
        
    }
    let scrollView: UIScrollView = {
        let scroll = UIScrollView.init(frame: CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-100))
        scroll.backgroundColor = ThemeColors.mainBlack
        scroll.showsVerticalScrollIndicator = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    let secondScrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    let imageRocket: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "scribble")
        img.scalesLargeContentImage = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let contentScrollView: UIView = {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: 950))
        view.backgroundColor = ThemeColors.mainBlack
        let path = UIBezierPath(roundedRect:view.bounds, byRoundingCorners:[.topRight, .topLeft], cornerRadii: CGSize(width: 25, height: 25))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        view.layer.mask = maskLayer
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TRUUUUUUM"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "LabGrotesque-Regular", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //    MARK: HEIGHT ------------------------------------------------------------------------------------------------------------------------------------
    let labelHeightFirst: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 16))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        label.text = "123"
        label.textColor = .white
        label.textAlignment = .center
        label.contentMode = .bottom
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelHeightSecond: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 14))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 14)
        label.text = "Высота"
        label.textColor = ThemeColors.textGray
        label.textAlignment = .center
        label.contentMode = .top
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackHeight: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelHeightFirst, labelHeightSecond], axis: .vertical, spacing: 8, distribution: .fillEqually)
        stack.backgroundColor = ThemeColors.simpleGray
        stack.layer.cornerRadius = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: Diametr -----------------------------------------------------------------------------------------------------------------------------------
    let labelDiametrFirst: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 16))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        label.text = "123"
        label.textColor = .white
        label.textAlignment = .center
        label.contentMode = .bottom
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelDiametrSecond: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 14))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 14)
        label.text = "Диаметр"
        label.textColor = ThemeColors.textGray
        label.textAlignment = .center
        label.contentMode = .top
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackDiametr: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelDiametrFirst, labelDiametrSecond], axis: .vertical, spacing: 8, distribution: .fillEqually)
        stack.backgroundColor = ThemeColors.simpleGray
        stack.layer.cornerRadius = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: MASS -----------------------------------------------------------------------------------------------------------------------------------
    let labelMassFirst: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 16))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        label.text = "123"
        label.textColor = .white
        label.textAlignment = .center
        label.contentMode = .bottom
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelMassSecond: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 14))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 14)
        label.text = "Масса"
        label.textColor = ThemeColors.textGray
        label.textAlignment = .center
        label.contentMode = .top
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackMass: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelMassFirst, labelMassSecond], axis: .vertical, spacing: 8, distribution: .fillEqually)
        stack.backgroundColor = ThemeColors.simpleGray
        stack.layer.cornerRadius = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: PAYLOAD -----------------------------------------------------------------------------------------------------------------------------------
    let labelPayloadFirst: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 16))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        label.text = "123"
        label.textColor = .white
        label.textAlignment = .center
        label.contentMode = .bottom
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelPayloadSecond: VerticalAlignedLabel = {
        let label = VerticalAlignedLabel(frame: CGRect(x: 0, y: 0, width: 98, height: 14))
        label.font = UIFont(name: "LabGrotesque-Bold", size: 14)
        label.text = "Нагрузка"
        label.textColor = ThemeColors.textGray
        label.textAlignment = .center
        label.contentMode = .top
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackPayload: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelPayloadFirst, labelPayloadSecond], axis: .vertical, spacing: 8, distribution: .fillEqually)
        stack.backgroundColor = ThemeColors.simpleGray
        stack.layer.cornerRadius = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: FIRST START ------------------------------------------------------------------------------------------------------------------------------
    let firstLaunchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Первый запуск"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let firstLaunchLabelData: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "7 февраля"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackFirstLaunh: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstLaunchLabel, firstLaunchLabelData], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //    MARK: COUNTRY -----------------------------------------------------------------------------------------------------------------------------------
    let countryLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Страна"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "США"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackCountry: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [countryLabelStatic, countryLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //    MARK: PAYLOADCOST -----------------------------------------------------------------------------------------------------------------------------------
    let payloadCostLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Стоимость запуска"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let payloadCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "$90 млн"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackPayloadCost: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [payloadCostLabelStatic, payloadCostLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //    MARK: BASIC INFO -------------------------------------------------------------------------------------------------------------------------------
    
    lazy var stackBasicInfo: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stackFirstLaunh, stackCountry, stackPayloadCost], axis: .vertical, spacing: 16, distribution: .equalSpacing)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: FIRST STAGE -------------------------------------------------------------------------------------------------------------------------------
    let firstStageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        label.text = "ПЕРВАЯ СТУПЕНЬ"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //    MARK: COUNT ENGINE-------------------------------------------------------------------------------------------------------------------------------
    
    let countEngineLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Количество двигателей"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countEngineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "27"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackCountEngine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [countEngineLabelStatic, countEngineLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: COUNT GAS-------------------------------------------------------------------------------------------------------------------------------
    let countGasLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Количество топлива"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countGasLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "301 ton"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackCountGas: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [countGasLabelStatic, countGasLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //    MARK: FIRE TIME -------------------------------------------------------------------------------------------------------------------------------
    let fireTimeLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Время сгорания"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let fireTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "593 sec"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackFireTime: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [fireTimeLabelStatic, fireTimeLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stackFirstStage: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstStageLabel, stackCountEngine, stackCountGas, stackFireTime], axis: .vertical, spacing: 16, distribution: .equalSpacing)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: SECOND STAGE ------------------------------------------------------------------------------------------------------------------------------
    let secondStageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Bold", size: 16)
        label.text = "ВТОРАЯ СТУПЕНЬ СТУПЕНЬ"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //    MARK: COUNT ENGINE TWO --------------------------------------------------------------------------------------------------------------------------
    
    let countEngineTwoLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Количество двигателей"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countEngineTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "27"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackCountTwoEngine: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [countEngineTwoLabelStatic, countEngineTwoLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //    MARK: COUNT GAS TWO ---------------------------------------------------------------------------------------------------------------------------
    let countGasLabelTwoStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Количество топлива"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let countGasTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "301 ton"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackCounTwotGas: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [countGasLabelTwoStatic, countGasTwoLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //    MARK: FIRE TIME TWO -----------------------------------------------------------------------------------------------------------------------------
    let fireTimeTwoLabelStatic: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "Время сгорания"
        label.textColor = ThemeColors.textLightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let fireTimeTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "LabGrotesque-Regular", size: 16)
        label.text = "593 sec"
        label.textColor = ThemeColors.whiteText
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackFireTwoTime: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [fireTimeTwoLabelStatic, fireTimeTwoLabel], axis: .horizontal, spacing: 0, distribution: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stackSecondStage: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [secondStageLabel, stackCountTwoEngine, stackCounTwotGas, stackFireTwoTime], axis: .vertical, spacing: 16, distribution: .equalSpacing)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //    MARK: BUTTON -------------------------------------------------------------------------------------------------------------------------------
    let buttonLaunch: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 12
        btn.setTitle("Посмотреть запуски", for: .normal)
        
        btn.backgroundColor = ThemeColors.simpleGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(goToLaunchDetail(_:)), for: .touchUpInside)
        return btn
    }()
    let buttonSetting: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 12
        let config = UIImage.SymbolConfiguration(textStyle: .title1)
        
        btn.setImage(UIImage(systemName: "gearshape", withConfiguration: config), for: .normal)
        btn.tintColor = ThemeColors.textLightGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(goTosetting(_:)), for: .touchUpInside)
        return btn
    }()
    @objc func goToLaunchDetail(_ sender: Any){
        let launch = LaunchViewController()
        launch.titleName = nameLabel.text!
        switch self.nameLabel.text!{
                case "Falcon 1":
            launch.launch = rocketViewController.launchFirst
                case "Falcon 9":
            launch.launch = rocketViewController.launchSecond
                case "Falcon Heavy":
            launch.launch = rocketViewController.launchThree
                default:
            print("error")
        }
        self.rocketViewController.navigationController?.pushViewController(launch, animated: false)
    }
    
    @objc func goTosetting(_ sender: Any){
        let settings = SettingsViewController()
        rocketViewController.present(settings, animated: true)
        
    }
    
}

