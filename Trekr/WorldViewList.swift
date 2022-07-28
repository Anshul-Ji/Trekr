//
//  WorldViewList.swift
//  Trekr
//
//  Created by Anshul Gautam on 27/07/22.
//

import SwiftUI

struct WorldViewList: View {
    @EnvironmentObject var locations: Locations
    var body: some View {
        
        List(locations.places.sorted(), id: \.id){ location in
            HStack {
                NavigationLink(destination: ContentView(location: location)) {
                    Image(location.country)
                        .resizable()
                        .scaledToFit()
                        .frame(height:30)
                        .cornerRadius(10)

                    Text(location.country)
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationTitle("Locations")
        
    }
}

struct WorldViewList_Previews: PreviewProvider {
    static var previews: some View {
        WorldViewList()
    }
}
