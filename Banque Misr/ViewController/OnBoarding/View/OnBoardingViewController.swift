//
//  OnBoardingViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 25/02/2026.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
     // MARK: - OutLets
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var skipButton: UIButton!
    @IBOutlet weak private var pageControl: UIPageControl!
    @IBOutlet weak private var nextButton: UIButton!
    
    
    // MARK: - Properties
    
    private var viewModel = OnBoardingViewModel()
    
    // MARK: -  Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        

        UserDefaults().setKeys(key: .isShowOnBoarding, value: true)
        setUpUI()
    }
    
   private func setUpUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: OnBoardingCollectionViewCell.self),
                                      bundle: nil),
                                forCellWithReuseIdentifier: String(describing: OnBoardingCollectionViewCell.self))
    }
    
    private func presentIntroductionViewController(){
        
        let introductionViewController = IntroductionViewController()
        RootRouter.presentRoot(root: introductionViewController)
    }

    @IBAction func skipButtonAction(_ sender: Any) {
        presentIntroductionViewController()
    }
    
    @IBAction func nextPageAction(_ sender: Any) {
        if pageControl.currentPage == (viewModel.list.count - 1) {
            presentIntroductionViewController()
        }else {
            let index = IndexPath(item: pageControl.currentPage + 1 , section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
}


extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OnBoardingCollectionViewCell.self), for: indexPath) as! OnBoardingCollectionViewCell
        cell.configure(list: viewModel.list[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = self.collectionView.bounds.size
        return itemSize
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let ofSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let center = width / 2
        let curentPage = Int(ofSet + center) / Int(width)
        pageControl.currentPage = curentPage
        
        if pageControl.currentPage == (viewModel.list.count - 1) {
            nextButton.setTitle("OnBoarding.Button.GetStarted".localized, for: .normal)
        } else {
            nextButton.setTitle("OnBoarding.Button.Next".localized, for: .normal)

        }
    }
}

