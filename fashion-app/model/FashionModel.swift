//
//  FashionModel.swift
//  fashion-app
//
//  Created by Сергей Голенко on 09.01.2021.
//

import UIKit

struct  OnboardingItem {
    let title : String
    let detail : String
    let image : UIImage?
    
    
   static let items: [OnboardingItem] = [
        .init(title: "Diana Vreeland",
              detail: "Fashion is part of the daily air and it changes all the time, with all the events. You can even see the approaching of a revolution in clothes. You can see and feel everything in clothes.",
              image: UIImage(named: "imFashion1")),
        .init(title: "Gianni Versace",
              detail: "Don't be into trends. Don't make fashion own you, but you decide what you are, what you want to express by the way you dress and the way to live.",
              image: UIImage(named: "imFashion2")),
        .init(title: "Karl Lagerfeld",
              detail: "One is never over-dressed or under-dressed with a Little Black Dress.",
              image: UIImage(named: "imFashion3")),
        .init(title: "Miuccia Prada",
              detail: "What you wear is how you present yourself to the world, especially today, when human contacts are so quick. Fashion is instant language.",
              image: UIImage(named: "imFashion4")),
        .init(title: "Bette Midler",
              detail: "I firmly believe that with the right footwear one can rule the world.",
              image: UIImage(named: "imFashion5"))
    ]
}

