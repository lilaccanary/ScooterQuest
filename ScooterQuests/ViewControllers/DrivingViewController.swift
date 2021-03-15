//
//  DrivingViewController.swift
//  ScooterQuests
//
//  Created by Olka on 12.03.2021.
//

import UIKit
import CoreLocation
import YandexMapsMobile
import SnapKit


class DrivingViewController: UIViewController, CLLocationManagerDelegate {
    var mapView = YMKMapView()
    var drivingSession: YMKDrivingSession?
    let ROUTE_START_POINT = YMKPoint(latitude: 55.741333, longitude: 37.620555)
    let ROUTE_END_POINT = YMKPoint(latitude: 55.751999, longitude: 37.617734)
    let CAMERA_TARGET = YMKPoint(latitude: 55.746666, longitude: 37.6191445)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.width.equalTo(self.view.bounds.width)
        }
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(target: CAMERA_TARGET, zoom: 14, azimuth: 0, tilt: 0))
        
        let requestPoints : [YMKRequestPoint] = [
            YMKRequestPoint(point: ROUTE_START_POINT, type: .waypoint, pointContext: nil),
            YMKRequestPoint(point: ROUTE_END_POINT, type: .waypoint, pointContext: nil),
            ]
        
        let responseHandler = {(routesResponse: [YMKDrivingRoute]?, error: Error?) -> Void in
            if let routes = routesResponse {
                self.onRoutesReceived(routes)
            } else {
                self.onRoutesError(error!)
            }
        }
        
        let drivingRouter = YMKDirections.sharedInstance().createDrivingRouter()
        drivingSession = drivingRouter.requestRoutes(
            with: requestPoints,
            drivingOptions: YMKDrivingDrivingOptions(),
            vehicleOptions: YMKDrivingVehicleOptions(),
            routeHandler: responseHandler)
    }
    
    func onRoutesReceived(_ routes: [YMKDrivingRoute]) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        for route in routes {
            mapObjects.addPolyline(with: route.geometry)
        }
    }
    
    func onRoutesError(_ error: Error) {
        let routingError = (error as NSError).userInfo[YRTUnderlyingErrorKey] as! YRTError
        var errorMessage = "Unknown error"
        if routingError.isKind(of: YRTNetworkError.self) {
            errorMessage = "Network error"
        } else if routingError.isKind(of: YRTRemoteError.self) {
            errorMessage = "Remote server error"
        }
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
