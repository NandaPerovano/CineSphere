//
//  TabItem.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let view: AnyView
}

