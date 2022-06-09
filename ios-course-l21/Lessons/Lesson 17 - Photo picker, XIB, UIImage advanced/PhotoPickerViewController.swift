//
//  PhotoPickerViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 28.04.2022.
//

import UIKit

extension UIDevice {
    static var isSimulator: Bool = {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }()
}

class PhotoPickerViewController: UIViewController, (UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
    
    //Кложуры используются при инициализации
    //PhotoKit
    lazy var pickerController: UIImagePickerController = {
        let pickerController = UIImagePickerController()
        
        if UIDevice.isSimulator {
            pickerController.sourceType = .savedPhotosAlbum
        } else {
            pickerController.sourceType = .camera
        }
       
        pickerController.allowsEditing = true
        pickerController.delegate = self
        
        return pickerController
    }()
    
    var someValue = 5

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.contentMode = .scaleAspectFill
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(zoomAction(_:)))
        
        photoImageView.isUserInteractionEnabled = true
        photoImageView.addGestureRecognizer(pinchGesture)
    }
    
    @objc
    func zoomAction(_ sender: UIPinchGestureRecognizer) {
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
    }
    
    open func takeScreenshot(_ shouldSave: Bool = true) -> UIImage? {
        
        var screenshotImage: UIImage?
        //let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(view.layer.frame.size, false, scale);
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        view.layer.render(in:context)
        
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        return screenshotImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            photoImageView.image = image
            
        }
        picker.dismiss(animated: true, completion: nil)
    }

    @IBAction func choosePhotoFromGalleryAction(_ sender: Any) {
        
        self.present(pickerController, animated: true, completion: nil)
        
        //takeScreenshot(true)
    }
}
