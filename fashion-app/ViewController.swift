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
    
    private var imageViews = [UIImageView]()
    
    var collectionViewWidth: CGFloat {
        return collectionView.frame.size.width
    }
    

    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPageControl()
        setupImageViews()
    }
    
    //MARK: - DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FashionCustomCell
        let shouldShow = indexPath.item == items.count - 1
        cell.showExploreButton(shouldShow: shouldShow)
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = getCurrentIndex()
        showItem(at: index)
    }
    
    
    //This is magic functions :)
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let index = getCurrentIndex()
        let fadeInAlpha = (x - collectionViewWidth * CGFloat(index)) / collectionViewWidth
        let fadeOutAlpha = CGFloat(1 - fadeInAlpha)
        let canShow = (index < items.count - 1)
        guard canShow else {
            return
        }
        imageViews[index].alpha = fadeOutAlpha
        imageViews[index + 1].alpha = fadeInAlpha
    }
    
    
    
    
    //MARK: - IBOutlets ans IBAction

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let nextRow = getCurrentIndex() + 1
        let nextIndexPath = IndexPath(row: nextRow, section: 0)
        collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        showItem(at: nextRow)
       
    }
    
    
    //MARK: - functions
    
    private func setupImageViews(){
        items.forEach { item in
            let imageView = UIImageView(image: item.image)
            imageView.contentMode = .scaleAspectFill
            imageView.alpha = 0.0
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            containerView.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8),
                imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            imageViews.append(imageView)
        }
        imageViews.first?.alpha = 1.0
        containerView.bringSubviewToFront(collectionView)
    }
    
    private func setupPageControl(){
        self.pageControl.numberOfPages = items.count
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    
    }
    
    private func getCurrentIndex() -> Int{
        return Int(collectionView.contentOffset.x / collectionView.frame.width)
    }
    
    private func showItem(at index: Int){
        pageControl.currentPage = index
    }
}


class FashionCustomCell : UICollectionViewCell {
    
    
    @IBOutlet weak var exploreButton: UIButton!
    
    @IBAction func exploreButtonTapped(_ sender: Any) {
      
    }
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var secondTitleLable: UILabel!
    func configure(with item: OnboardingItem){
        titleLable.text = item.title
        secondTitleLable.text = item.detail
    }
    
    func showExploreButton(shouldShow: Bool){
        exploreButton.isHidden = !shouldShow
    }
}

