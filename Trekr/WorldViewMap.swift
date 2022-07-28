//
//  WorldView.swift
//  Trekr
//
//  Created by Paul Hudson on 22/12/2020.
//

import MapKit
import SwiftUI

struct WorldViewMap: View {
    @EnvironmentObject var locations: Locations
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    
    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(destination: ContentView(location: location)) {
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                }
            }
        }
        .navigationTitle("Locations")
        
    }
}

struct WorldViewMap_Previews: PreviewProvider {
    static var previews: some View {
        WorldViewMap()
    }
}
