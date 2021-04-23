//
//  Trip.swift
//  CustomCarouselSlider2
//
//  Created by Maxim Macari on 23/4/21.
//

import SwiftUI

struct Trip: Identifiable, Hashable {
    var id = UUID().uuidString
    var image: String
    var title: String
}

var trips: [Trip]  = [
    Trip(image: "1", title: "Dark"),
    Trip(image: "2", title: "Tree"),
    Trip(image: "3", title: "Lake"),
    Trip(image: "4", title: "Space"),
    Trip(image: "5", title: "Thunder")
]
