//
//  Location.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/8/24.
//

import MapKit
import Foundation

struct Location: Codable, Equatable, Identifiable {
    var id: UUID = .init()
    var name: String
    var city: String
    var description: String
    var date: Int
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: latitude, longitude: longitude) }
    var span: MKCoordinateSpan { MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)}
    var zoom: Double
 
    init(name: String, city: String, description: String, date: Int, latitude: Double, longitude: Double, latitudeDelta: Double? = nil, longitudeDelta: Double? = nil, zoom: Double) {
        self.name = name
        self.city = city
        self.description = description
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
        self.zoom = zoom
    }
    
    static let example1 = Location(name: "Independence Hall", city:"Philadelphia", description: "A historical location where the Bill of Rights and Declaration of Independence was signed by Founding Fathers including Thomas Jefferson, Benjamin Franklin, and John Adams.", date:1787, latitude: 39.948873304641175, longitude: -75.15003898355654, zoom: 0.0025)
    
    static let example2 = Location(name: "Fort McHenry", city: "Balitmore", description: "A most iconic place to understand what our United States Flag really means as well as its reference in the National Anthem, with the Battle of Fort McHenry during the War of 1812.", date:1814, latitude: 39.26319, longitude: -76.57976, zoom: 0.005)

    static let example3 = Location(name: "Statue of Liberty", city: "New York", description: "The greatest landmark remind the world that our country is a land of Liberty and Freedom for both legal immigrants and our citizens", date:1886, latitude: 40.68923338868084, longitude: -74.04457988960172, zoom: 0.005)
}



