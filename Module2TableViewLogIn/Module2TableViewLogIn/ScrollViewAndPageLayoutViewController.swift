//
//  ScrollViewAndPageLayoutViewController.swift
//  Module2TableViewLogIn
//
//  Created by Vivek Patel on 25/04/23.
//

import UIKit

class ScrollViewAndPageLayoutViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var slides:[Slide] = [];
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        // Do any additional setup after loading the view.
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "download")
        slide1.labelTitle.text = "A real-life bear"
        slide1.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "download 2")
        slide2.labelTitle.text = "A real-life bear"
        slide2.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "download 3")
        slide3.labelTitle.text = "A real-life bear"
        slide3.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageView.image = UIImage(named: "download 4")
        slide4.labelTitle.text = "A real-life bear"
        slide4.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imageView.image = UIImage(named: "download 5")
        slide5.labelTitle.text = "A real-life bear"
        slide5.labelDesc.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    
}
