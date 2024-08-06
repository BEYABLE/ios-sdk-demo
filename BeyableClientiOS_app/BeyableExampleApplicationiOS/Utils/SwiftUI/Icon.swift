//
//  Icon.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//
import UIKit

struct Icon {
    static let satisfiedRefund  = Icon(name: "satisfied_refund")
    static let warranty         = Icon(name: "warranty")
    static let info             = Icon(name: "info")

    let uiImage: UIImage

    init(name: String) {
        self.uiImage = UIImage(named: name) ?? UIImage()
    }
}
