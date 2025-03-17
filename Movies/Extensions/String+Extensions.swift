//
//  String+Extensions.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/17.
//

import Foundation

extension String {
    
    var isEmpryOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
