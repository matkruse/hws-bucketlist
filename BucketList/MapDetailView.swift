//
//  MapDetailView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/7/24.
//

import MapKit
import SwiftUI

struct MapDetailView: View {
    @State var location: Location
    var body: some View {
        Section("\(location.name): \(location.city), \(String(location.date)) \n\(location.description)"){

            let pos = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: location.coordinate,
                    span: location.span
                )
            )
            
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
