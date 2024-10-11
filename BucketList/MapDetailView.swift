//
//  MapDetailView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/7/24.
//
//  Personal addition to the map, to show detail level of target site, zoomed in
//  Displayed with location attributes and description

import MapKit
import SwiftUI

struct MapDetailView: View {
    @State var location: Location
    var body: some View {
        Section {

            // set map position
            let pos = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinate,
                    span: location.span
                )
            )
            
            // display heading
            Text("\(location.city), \(String(location.date))")
                .padding()
                .fontWeight(.bold)
            Text(location.description)
            
            // display map view
            Map(initialPosition: pos)
                .mapStyle(.hybrid(elevation: .realistic))
                .onMapCameraChange { context in
                print(context.region)
                }
        }
    }
}

#Preview {
    MapDetailView(location: Location.example1)
}
