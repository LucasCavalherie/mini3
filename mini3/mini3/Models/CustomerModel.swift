//
//  CustomerModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

enum ContactForm: Codable {
    case instagram
    case whatsapp
    case facebook
    case messages
}

struct CustomerModel: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var contact: String
    var contactForm: ContactForm
}
