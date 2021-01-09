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
              image: UIImage(named: "imFashion5")),
        .init(title: "British Vogue", detail: "Mert Alas and Marcus Piggott - Photographer,Edward Enninful - Fashion Editor/StylistPaul Hanlon - Hair StylistLucia Pieroni - Makeup Artist,Lorraine Griffin - Manicurist,Kate Moss - Model", image:UIImage(named: "imFashion6")),
        .init(title: "MAC Cosmetics", detail:"Ben Hassett - Photographer,Gordon von Steiner - Director, Clare Byrne - Fashion Editor/Stylist ,Orlando Pita - Hair StylistSam Visser - Makeup Artist, Yuemeng Ma - Model", image: UIImage(named: "imFashion7")),
    .init(title: "Vogue Italia", detail: "Heji Shin - Photographer,Johnny Dufort - Photographer,Emanuele Farneti - Editor,Ferdinando Verderi - Creative Director,Ai Kamoshita - Fashion Editor/Stylist,Lotta Volkova - Fashion Editor/Stylist,Christian Eberhard - Hair Stylist,Yann Turchi - Hair Stylist,Inge Grognard - Makeup Artist,Piergiorgio Del Moro - Casting Director,Samuel Ellis Scheinman - Casting Director,Christina Conrad - Manicurist,Ifrah Qaasim - Model,Sofia Hansson - Model", image: UIImage(named: "imFashion8")),
    .init(title: "Fendi", detail: "Венеция Скотт - фотограф,Шарлотта Стокдейл - редактор моды / стилист,Цзе Чжэн - модель,Мэгги Ченг - модель,Селена Форрест - Модель,Сонни Холл - модель,Стелла Джонс - Модель", image:UIImage(named: "imFashion9")),
    .init(title: "Vogue China", detail: "Autumn de Wilde - Photographer,Max Ortega - Fashion Editor/Stylist,Evanie Frausto - Hair Stylist,Kendall Jenner - Model", image: UIImage(named: "imFashion10")),
    .init(title: "Prada", detail: "Miuccia Prada - Designer,Raf Simons - Designer,Ferdinando Verderi - Creative Director,Olivier Rizzo - Fashion Editor/Stylist,Anthony Turner - Hair Stylist,Pat McGrath - Makeup Artist", image: UIImage(named: "imFashion11")),
    .init(title: "V Magazine", detail: "V Magazine x Emporio Armani 2021 Calendar", image: UIImage(named: "imFashion12")),
    .init(title: "Tom Ford", detail: "Tom Ford Costa Azzurra Fragrance 2021 Campaign" , image: UIImage(named:"imFashion13")),
    .init(title: "Man About Town", detail:"Man About Town S/S 2021 Covers",  image: UIImage(named: "imFashion14")),
    .init(title: "Harper's Bazaar UK", detail: "Paola Kudacki - Photographer,Jason Rembert - Fashion Editor/Stylist,Oscar James - Hair Stylist,Camille Thompson - Makeup Artist,Tom Macklin - Casting Director,Iman Abdulmajid - Model", image: UIImage(named: "imFashion15"))
        
    ]
}

