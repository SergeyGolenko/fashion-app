//
//  ViewController.swift
//  fashion-app
//
//  Created by Сергей Голенко on 08.01.2021.
//

import UIKit

class FashionController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //MARK: - properties

    private let storageManager = StorageManager()
    private let navigationManager = NavigationManager()
    private var items: [OnboardingItem] = OnboardingItem.items
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
        updateFlag()
    }
    
    //MARK: - DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FashionCustomCell
        cell.delegate = self
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
    
  
    
    //MARK: - functions
    
    private func updateFlag() {
        storageManager.setOnboardingSeen()
    }
    
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
        pageControl.pageIndicatorTintColor = .black
       
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func getCurrentIndex() -> Int{
        return Int(collectionView.contentOffset.x / collectionView.frame.width)
    }
    
    private func showItem(at index: Int){
        pageControl.currentPage = index
        let shouldHide = index == items.count - 1
        nextButton.isHidden = shouldHide
    }
}

extension FashionController: QuoteCollectionViewDelegate{
    func didTapExploreButton() {
        navigationManager.show(screen: .mainApp, inController: self)
    }
}
