//
//  ContentView.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//  Personal exercise to create pre-determined markers on the map, with navlinks
//  to zoom in on site details
//  TODO: Fix issue where map nudging is required to display the markers
//  TODO: Enable user to add additional sites to this style interface

import MapKit
import SwiftUI

struct ContentView: View {

    // establish location array with sample data
    var body: some View {
        let locations = [
            Location.example1,
            Location.example2,
            Location.example3
        ]

        NavigationStack {
                // build a map with markers
                Map {
                    ForEach(locations) { location in
                        
                        // custom marker (annotation) from SwiftUI lesson
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
                // pick a map presentation style
                .mapStyle(.hybrid(elevation: .realistic))
            
            // add buttons for quick access to saved sites as personal addition
            HStack (spacing: 50){
                
                ForEach(locations) { location in
                    NavigationLink(String(location.date), destination: MapDetailView(location: location))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
