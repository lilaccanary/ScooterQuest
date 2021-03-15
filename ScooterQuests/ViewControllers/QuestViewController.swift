//
//  QuestViewController.swift
//  ScooterQuests
//
//  Created by Olka on 08.03.2021.
//

import UIKit
import YandexMapsMobile
import SnapKit

final class QuestViewController: UIViewController, YMKUserLocationObjectListener, ButtonDelegate
{
    func onObjectRemoved(with view: YMKUserLocationView) {
    }
    
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {
    }
    
    var mapView = YMKMapView()
    var selectDistanceView = QuestionView(configure: .distance)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        selectDistanceView.delegate = self
    }

    func onObjectAdded(with view: YMKUserLocationView) {
        view.arrow.setIconWith(UIImage(named:"UserArrow")!)
    }
    
    func setupLayout() {
        setupMapView()
        setupSelectDistanceView()
    }

    private func setupMapView() {
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.width.equalTo(self.view.bounds.width)
        }
        mapView.mapWindow.map.move(with:
            YMKCameraPosition(target: YMKPoint(latitude: 0, longitude: 0), zoom: 14, azimuth: 0, tilt: 0))
        let mapKit = YMKMapKit.sharedInstance()
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.isHeadingEnabled = true
        userLocationLayer.setObjectListenerWith(self)
        userLocationLayer.setAnchorWithAnchorNormal(CGPoint(x: 400.0, y: 600.0), anchorCourse: CGPoint(x: 300.0, y: 300.0))
    }

    private func setupSelectDistanceView() {
        self.view.addSubview(selectDistanceView)
        selectDistanceView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func onButtonTap(sender: UIButton) {
        let customViewController = DrivingViewController()
        
        self.navigationController?.pushViewController(customViewController, animated: true)
    }
}
