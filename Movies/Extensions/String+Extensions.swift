//
//  String+Extensions.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
