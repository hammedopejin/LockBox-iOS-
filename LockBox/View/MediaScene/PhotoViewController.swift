//
//  photoViewController.swift
//  LockBox
//
//  Created by Hammed opejin on 6/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var content: Content!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoScrollView.minimumZoomScale = 1.0
        photoScrollView.maximumZoomScale = 10.0

        setupImage()
        
    }
    
    func setupImage () {
        
        guard let url = FileService.loadWithFM(content.path!), let image = UIImage(contentsOfFile: url.path) else {
            return
        }
        
        self.photoImageView.image = image
        
    }

}

extension PhotoViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
}
