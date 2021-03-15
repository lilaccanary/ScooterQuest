//
//  QuestionView.swift
//  ScooterQuests
//
//  Created by Olka on 10.03.2021.
//

import Foundation
import UIKit


protocol ButtonDelegate {
    func onButtonTap(sender: UIButton)
}


enum ConfigureState {
    case distance, quest, ride
}

class QuestionView: UIView {
    var configure: ConfigureState
    var delegate: ButtonDelegate?
    
    private let questionLabel = UILabel()
    private let firstAnswerButton = UIButton()
    private let secondAnswerButton = UIButton()
    private let thirdAnswerButton = UIButton()
    private let startButton = UIButton()
    private var data: Quest?
    
    init(configure: ConfigureState) {
        self.configure = configure
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
      switch configure {
      case .distance:
        setupDistance()
      case .quest:
        setupQuest()
      case .ride:
        setupRide()
      }
    }
    
    // MARK: View Setup Distance
    
    private func setupDistance() {
            
        func setupLayout() {
            clearView()
            setupView()
            setupQuestionLabel()
            setupFirstAnswerButton()
            setupSecondAnswerButton()
            setupThirdAnswerButton()
            setupStartButton()
        }
        
        setupLayout()
      
      func clearView() {
        subviews.forEach({ $0.removeFromSuperview() })
      }
        
        func setupView() {
            backgroundColor = UIColor(named: "blueColor")
            makeRoundedCorners(radius: 8)
            snp.makeConstraints { (make) in
                make.width.equalTo(296)
                make.height.equalTo(444)
            }
        }
        
        func setupQuestionLabel() {
            addSubview(questionLabel)
            questionLabel.text = "Выбери расстояние, которое тебе предстоит проехать"
            questionLabel.font = UIFont(name: "Montserrat-Regular", size: 17)
            questionLabel.textColor = UIColor(named: "whiteColor")
            questionLabel.textAlignment = .center
            questionLabel.numberOfLines = 2
            questionLabel.snp.makeConstraints{ (make) in
                make.top.equalToSuperview().inset(56)
                make.centerX.equalToSuperview()
                make.width.equalTo(265)
            }
        }
        func setupFirstAnswerButton() {
            addSubview(firstAnswerButton)
            firstAnswerButton.setTitle("15 км", for: .normal)
            firstAnswerButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            firstAnswerButton.makeRoundedCorners(radius: 8)
            firstAnswerButton.titleLabel?.lineBreakMode = .byCharWrapping
            firstAnswerButton.titleLabel?.numberOfLines = 0
            firstAnswerButton.setSelectedColor(state: .normal)
            firstAnswerButton.snp.makeConstraints { (make) in
                make.top.equalToSuperview().inset(161)
                make.centerX.equalToSuperview()
                make.width.equalTo(264)
            }
            firstAnswerButton.addTarget(self, action: #selector(select15KmButtonPressed), for: .touchUpInside)
        }
        
        func setupSecondAnswerButton() {
            addSubview(secondAnswerButton)
            secondAnswerButton.setTitle("25 км", for: .normal)
            secondAnswerButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            secondAnswerButton.makeRoundedCorners(radius: 8)
            secondAnswerButton.titleLabel?.lineBreakMode = .byCharWrapping
            secondAnswerButton.titleLabel?.numberOfLines = 0
            secondAnswerButton.setSelectedColor(state: .normal)
            secondAnswerButton.snp.makeConstraints { (make) in
                make.top.equalTo(firstAnswerButton.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
                make.width.equalTo(264)
            }
            secondAnswerButton.addTarget(self, action: #selector(select25KmButtonPressed), for: .touchUpInside)
        }
        
        func setupThirdAnswerButton() {
            addSubview(thirdAnswerButton)
            thirdAnswerButton.setTitle("45 км", for: .normal)
            thirdAnswerButton.titleLabel?.lineBreakMode = .byCharWrapping
            thirdAnswerButton.titleLabel?.numberOfLines = 0
            thirdAnswerButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            thirdAnswerButton.makeRoundedCorners(radius: 8)
            thirdAnswerButton.setSelectedColor(state: .normal)
            thirdAnswerButton.snp.makeConstraints { (make) in
                make.top.equalTo(secondAnswerButton.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
                make.width.equalTo(264)
            }
            thirdAnswerButton.addTarget(self, action: #selector(select45KmButtonPressed), for: .touchUpInside)
        }
        
        func setupStartButton() {
            addSubview(startButton)
            startButton.isEnabled = false
            startButton.setTitle("Начинаем!", for: .normal)
            startButton.setTitleColor(UIColor(named: "greenColor"), for: .normal)
            startButton.setTitleColor(UIColor(named: "blueColor"), for: .selected)
            startButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            startButton.makeRoundedCorners(radius: 8)
            startButton.backgroundColor = UIColor(named: "whiteColor")
            startButton.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(372)
                make.centerX.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(264)
            }
            startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc func select15KmButtonPressed(sender: UIButton!) {
        deselectAllButtons()
        firstAnswerButton.isSelected = true
        firstAnswerButton.setSelectedColor(state: .selected)
        startButton.isEnabled = true
    }
    
    @objc func select25KmButtonPressed(sender: UIButton!) {
        deselectAllButtons()
        secondAnswerButton.isSelected = true
        secondAnswerButton.setSelectedColor(state: .selected)
        startButton.isEnabled = true
        
    }
    
    @objc func select45KmButtonPressed(sender: UIButton!) {
        deselectAllButtons()
        thirdAnswerButton.isSelected = true
        thirdAnswerButton.setSelectedColor(state: .selected)
        startButton.isEnabled = true
    }
    
    @objc func startButtonPressed(sender: UIButton!) {
        deselectAllButtons()
        self.configure = .quest
        configureView()
    }
    
    func deselectAllButtons() {
        for subView in self.subviews
        {
            if let button = subView as? UIButton
            {
                button.isSelected = false
                button.setSelectedColor(state: .normal)
            }
        }
    }
    
    // MARK: View Questions Quest
    
    private func setupQuest() {
        
        
        func setupLayout() {
            clearView()
            setupView()
            setupSelectDistanceLabel()
            setupSelectFirstAnswerButton()
            setupSelectSecondAnswerButton()
            setupSelectThirdAnswerButton()
            setupStartButton()
        }
    
        func setDataModel() {
            let service = DataService()
            let data = service.getData()
            self.data = data
        }
        
        func setupData(data: Quest?) {
            questionLabel.text = data?.question
            firstAnswerButton.setTitle(data?.answer1, for: .normal)
            secondAnswerButton.setTitle(data?.answer2, for: .normal)
            thirdAnswerButton.setTitle(data?.answer3, for: .normal)
        }
        
        
        setDataModel()
        setupData(data: data)
        setupLayout()
      
      func clearView() {
        subviews.forEach({ $0.removeFromSuperview() })
      }
        
        func setupView() {
            backgroundColor = UIColor(named: "blueColor")
            makeRoundedCorners(radius: 8)
            snp.makeConstraints { (make) in
                make.width.equalTo(296)
                make.height.equalTo(444)
            }
        }
       
        func setupSelectDistanceLabel() {
            addSubview(questionLabel)
            questionLabel.font = UIFont(name: "Montserrat-Regular", size: 17)
            questionLabel.textColor = UIColor(named: "whiteColor")
            questionLabel.textAlignment = .center
            questionLabel.numberOfLines = 5
            questionLabel.snp.makeConstraints{ (make) in
                make.top.equalToSuperview().inset(36)
                make.centerX.equalToSuperview()
                make.width.equalTo(265)
            }
        }
        func setupSelectFirstAnswerButton() {
            addSubview(firstAnswerButton)
            firstAnswerButton.titleLabel?.lineBreakMode = .byWordWrapping
            firstAnswerButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
            firstAnswerButton.makeRoundedCorners(radius: 8)
            firstAnswerButton.titleLabel?.numberOfLines = 0
            firstAnswerButton.setSelectedColor(state: .normal)
            firstAnswerButton.snp.makeConstraints { (make) in
                make.top.equalToSuperview().inset(161)
                make.height.equalTo(54)
                make.centerX.equalToSuperview()
                make.width.equalTo(264)
            }
            firstAnswerButton.addTarget(self, action: #selector(select15KmButtonPressed), for: .touchUpInside)
        }
        
        func setupSelectSecondAnswerButton() {
            addSubview(secondAnswerButton)
            secondAnswerButton.titleLabel?.lineBreakMode = .byWordWrapping
            secondAnswerButton.titleLabel?.numberOfLines = 0
            secondAnswerButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
            secondAnswerButton.makeRoundedCorners(radius: 8)
            secondAnswerButton.setSelectedColor(state: .normal)
            secondAnswerButton.snp.makeConstraints { (make) in
                make.top.equalTo(firstAnswerButton.snp.bottom).offset(3)
                make.height.equalTo(54)
                make.centerX.equalToSuperview()
                make.width.equalTo(264)
            }
            secondAnswerButton.addTarget(self, action: #selector(select25KmButtonPressed), for: .touchUpInside)
        }
        
        func setupSelectThirdAnswerButton() {
            addSubview(thirdAnswerButton)
            thirdAnswerButton.titleLabel?.lineBreakMode = .byWordWrapping
            thirdAnswerButton.titleLabel?.numberOfLines = 0
            thirdAnswerButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 13)
            thirdAnswerButton.makeRoundedCorners(radius: 8)
            thirdAnswerButton.setSelectedColor(state: .normal)
            thirdAnswerButton.snp.makeConstraints { (make) in
                make.top.equalTo(secondAnswerButton.snp.bottom).offset(3)
                make.height.equalTo(54)
                make.centerX.equalToSuperview()
                make.width.equalTo(264)
            }
            thirdAnswerButton.addTarget(self, action: #selector(select45KmButtonPressed), for: .touchUpInside)
        }
        
        func setupStartButton() {
            addSubview(startButton)
            startButton.isEnabled = false
            startButton.setTitle("Ответить", for: .normal)
            startButton.setTitleColor(UIColor(named: "greenColor"), for: .normal)
            startButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            startButton.makeRoundedCorners(radius: 8)
            startButton.backgroundColor = UIColor(named: "whiteColor")
            startButton.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(372)
                make.centerX.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(264)
            }
            startButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        }
    }
    
    @objc func answerButtonPressed(sender: UIButton!) {
        let variant = data?.rightAnswer
        let buttons = [
          firstAnswerButton,
          secondAnswerButton,
          thirdAnswerButton
        ]
        
        for button in buttons {
            if button.titleLabel?.text == variant {
            self.configure = .ride
            configureView()
            return
          }
        }
        deselectAllButtons()
        self.configure = .quest
        configureView()
    }
    
    private func setupRide() {
        func setupLayout() {
            clearView()
            setupView()
            setupGoodLabel()
            setupRideButton()
        }
        
        setupLayout()
      func clearView() {
        subviews.forEach({ $0.removeFromSuperview() })
      }
        
        func setupView() {
            backgroundColor = UIColor(named: "blueColor")
            makeRoundedCorners(radius: 8)
            snp.makeConstraints { (make) in
                make.width.equalTo(296)
                make.height.equalTo(236)
            }
        }
       
        func setupGoodLabel() {
            addSubview(questionLabel)
            questionLabel.text = "Верно"
            questionLabel.font = UIFont(name: "Montserrat-Regular", size: 17)
            questionLabel.textColor = UIColor(named: "whiteColor")
            questionLabel.textAlignment = .center
            questionLabel.numberOfLines = 5
            questionLabel.snp.makeConstraints{ (make) in
                make.center.equalToSuperview()
                make.width.equalTo(265)
            }
        }
        func setupRideButton() {
            addSubview(startButton)
            startButton.isEnabled = true
            startButton.setTitle("Поехали", for: .normal)
            startButton.setSelectedColor(state: .normal)
            startButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 17)
            startButton.makeRoundedCorners(radius: 8)
            startButton.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(150)
                make.centerX.equalToSuperview()
                make.height.equalTo(44)
                make.width.equalTo(264)
            }
            startButton.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        }
    }
    
    @objc func onButtonTap(sender: UIButton!) {
        subviews.forEach({ $0.removeFromSuperview() })
        self.removeFromSuperview()
        delegate?.onButtonTap(sender: sender)
    }
    
    
}
