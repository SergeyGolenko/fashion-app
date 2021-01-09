//
//  FashionCustomCell.swift
//  fashion-app
//
//  Created by Сергей Голенко on 09.01.2021.
//

import UIKit


class FashionCustomCell : UICollectionViewCell {
    weak var delegate : QuoteCollectionViewDelegate?
    @IBOutlet weak var exploreButton: UIButton!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var secondTitleLable: UILabel!
    
    @IBAction func exploreButtonTapped(_ sender: Any) {
        delegate?.didTapExploreButton()
    }
    
    func configure(with item: OnboardingItem){
        titleLable.text = item.title
        secondTitleLable.text = item.detail
    }
    
    func showExploreButton(shouldShow: Bool){
        exploreButton.isHidden = !shouldShow
    }
}
