//
//  ViewController.swift
//  fashion-app
//
//  Created by Сергей Голенко on 08.01.2021.
//

import UIKit

struct  OnboardingItem {
    let title : String
    let detail : String
    let image : UIImage?
}





class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK: - properties
    private let items: [OnboardingItem] = [
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
    
    
    //MARK: - IBOutlets ans IBAction
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var pageControl: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    //MARK: - functions
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    
    //MARK: - DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FashionCustomCell
        let item = items[indexPath.item]
        
        cell.configure(with: item)
    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}


class FashionCustomCell : UICollectionViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var secondTitleLable: UILabel!
    
    func configure(with item: OnboardingItem){
        titleLable.text = item.title
        secondTitleLable.text = item.detail
    }
}

