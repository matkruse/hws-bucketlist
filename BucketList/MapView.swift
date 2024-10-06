//
//  MapView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: Location.example1.coordinate,
            span: Location.example1.span
        )
    )

    var body: some View {
        let locations = [
            Location.example1,
            Location.example2,
            Location.example3
        ]

        NavigationStack {
                Map {
                    ForEach(locations) { location in
                        
                        Annotation(location.name, coordinate: location.coordinate) {
                            NavigationLink(
                                destination: MapDetailView(location: location)) {
                                    Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                }
                            
                        }
                        .annotationTitles(.hidden)
                    }
                }
                .mapStyle(.hybrid(elevation: .realistic))
                .onMapCameraChange { context in
                    print(context.region)
                }
            HStack (spacing: 50){
                
                ForEach(locations) { location in
                    NavigationLink(String(location.date), destination: MapDetailView(location: location))
                }
            }
        }
    }
}

#Preview {
    MapView()
}
