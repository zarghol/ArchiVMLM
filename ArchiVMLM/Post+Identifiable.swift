//
//  Post+Identifiable.swift
//  ArchiVMLM
//
//  Created by Clément Nonn on 12/03/2021.
//

import Foundation
import SwiftUI

extension Post: Identifiable {
    // the pair author and title could be a first id for identify each posts as one author won't write multiple posts with the same title
    var id: String { title + author }
}
