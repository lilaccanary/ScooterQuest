//
//  ViewController.swift
//  ScooterQuests
//
//  Created by Olka on 08.03.2021.
//

import UIKit
import SnapKit

final class StartPageViewController: UIViewController
{
    private let scrollView = UIScrollView()
    private let backgroundView = UIView()
    private let headView = UIView()
    private let nameLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let scooterView = UIView()
    private var scooterImage = UIImageView()
    private var nameOfSourceImage = UIImageView()
    private var redSunImage = UIImageView()
    private var scooterShadowImage = UIImageView()
    private var waveImage = UIImageView()
    private let getDirectionButton = UIButton(type: .system)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()
        self.setupLayout()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        
        func addSubviews() {
            self.view.addSubview(scrollView)
            scrollView.addSubview(backgroundView)
            backgroundView.addSubview(headView)
           
            headView.addSubview(nameOfSourceImage)
            headView.addSubview(scooterView)
            scooterView.addSubview(redSunImage)
            scooterView.addSubview(scooterShadowImage)
            scooterView.addSubview(scooterImage)
            headView.addSubview(waveImage)
            headView.addSubview(nameLabel)
            backgroundView.addSubview(getDirectionButton)
            
        }
        
        func setupLayout() {
            setupScrollView()
            setupBackgroundView()
            setupHeadView()
            setupNameLabel()
            setupScooterView()
            setupRedSunImage()
            setupScooterImage()
            setupScooterShadowImage()
            setupWaveImage()
            setupNameOfSourceImage()
            setupGetDirectionButton()
        }
        
        private func setupScrollView() {
            scrollView.backgroundColor = .white
            scrollView.snp.makeConstraints { (make) in
                make.bottom.top.left.right.equalToSuperview()
            }
        }
        
        private func setupBackgroundView() {
            backgroundView.snp.makeConstraints { (make) in
                make.bottom.top.left.right.equalToSuperview()
                make.width.equalTo(self.view.bounds.width)
            }
        }
        
    private func setupHeadView() {
        headView.backgroundColor = UIColor(named: "blueColor")
        headView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(272)
        }
    }
    
    
        private func setupNameLabel() {
            nameLabel.text = "Прокат электросамокатов"
            nameLabel.font = UIFont(name: "Montserrat-Regular", size: 23)
            nameLabel.textColor = UIColor(named: "whiteColor")
            nameLabel.numberOfLines = 2
            nameLabel.snp.makeConstraints{ (make) in
                make.top.equalTo(headView).inset(61)
                make.left.equalTo(headView).inset(115)
                make.right.equalTo(headView).offset(-35)
            }
        }
        
    private func setupNameOfSourceImage() {
        let imageOfSource = #imageLiteral(resourceName: "nameOfSource")
        nameOfSourceImage.image = imageOfSource
        //nameOfSourceImage.transform.rotated(by: .pi)
        nameOfSourceImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel)
            make.height.width.equalTo(90)
            make.left.equalTo(headView).inset(22)
        }
    }
            
        private func setupScooterView() {
            scooterView.snp.makeConstraints { (make) in
                make.top.equalTo(headView).inset(11)
                make.left.equalTo(headView).inset(167)
                make.height.equalTo(233)
                make.width.equalTo(205)
            }
        }
    private func setupRedSunImage() {
        let imageOfSun = #imageLiteral(resourceName: "Ellipse 34")
        redSunImage.image = imageOfSun
        redSunImage.snp.makeConstraints { (make) in
            make.top.equalTo(scooterView).inset(4)
            make.left.equalTo(scooterView).inset(80)
        }
    }
    
    private func setupScooterShadowImage() {
        let imageOfShadow = #imageLiteral(resourceName: "Ellipse 33")
        scooterShadowImage.image = imageOfShadow
        scooterShadowImage.tintColor = UIColor(named: "blackColor")
        scooterShadowImage.snp.makeConstraints { (make) in
            make.height.equalTo(5)
            make.width.equalTo(173)
            make.top.equalTo(scooterView).inset(215)
            make.left.equalTo(scooterView).inset(9)
        }
    }
    
    private func setupScooterImage() {
        let imageOfScooter = #imageLiteral(resourceName: "scooter")
        scooterImage.image = imageOfScooter
        scooterImage.tintColor = UIColor(named: "blackColor")
        scooterImage.snp.makeConstraints { (make) in
            make.top.equalTo(scooterView).inset(-4)
            make.height.equalTo(221)
            make.left.equalTo(scooterView).inset(-5)
        }
    }
    
    private func setupWaveImage() {
        let waveImg = #imageLiteral(resourceName: "Vector 2")
        waveImage.image = waveImg
        waveImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(headView)
            make.width.equalTo(headView)
        }
    }
        
            
        private func setupGetDirectionButton() {
            getDirectionButton.setTitle("Проложить маршрут", for: .normal)
            getDirectionButton.setTitleColor(UIColor(named: "whiteColor"), for: .normal)
            getDirectionButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            getDirectionButton.makeRoundedCorners(radius: 8)
            getDirectionButton.backgroundColor = UIColor(named: "redColor")
            getDirectionButton.snp.makeConstraints { (make) in
                make.top.equalTo(headView.snp.bottom).offset(50)
                make.centerX.equalTo(backgroundView)
                make.height.equalTo(50)
                make.width.equalTo(280)
                make.bottom.equalTo(backgroundView.snp.bottom).offset(-50)
            }
            getDirectionButton.addTarget(self, action: #selector(getDirectionButtonPressed), for: .touchUpInside)
        }
        
        @objc func getDirectionButtonPressed(sender: UIButton!) {
           // let aboutUsVC = AboutUsViewController()
            //let questVC = QuestViewController()
            //let routeVC = RouteViewController()
            //let tabBarController = UITabBarController()
            //tabBarController.viewControllers = [aboutUsVC, questVC, routeVC]
            //self.navigationController?.pushViewController(questVC, animated: true)
        }
    }
