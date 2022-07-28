//
//  WorldView.swift
//  Trekr
//
//  Created by Paul Hudson on 22/12/2020.
//

import MapKit
import SwiftUI

struct WorldView: View {
    @EnvironmentObject var locations: Locations
    var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
            ScrollView {
                HStack {
                    Spacer()
                    NavigationLink(destination: WorldViewMap()){
                        Image(systemName: "map.fill")
                            .padding([.bottom, .trailing])
                    }
                    NavigationLink(destination: WorldViewList()){
                        Image(systemName: "list.bullet")
                            .padding([.bottom, .trailing])
                    }
                }
                LazyVGrid(columns: twoColumnGrid, spacing: 20) {
                    ForEach(locations.places.sorted(), id: \.id) { location in
                        NavigationLink(destination: ContentView(location: location)){
                            ZStack {
                                Image(location.country)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .opacity(0.3)
        //                            .mask(Circle())
                                                
                                Text(location.country)
                                    .fontWeight(.bold)
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                                
                                }
                            }
                        }
                    }
                }
            .navigationTitle("Locations")
        
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
