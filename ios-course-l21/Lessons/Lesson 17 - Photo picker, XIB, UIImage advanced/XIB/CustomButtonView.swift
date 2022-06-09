//
//  CustomButtonView.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 28.04.2022.
//

import UIKit

class CustomButtonView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
    
        //contentView =
        Bundle.main.loadNibNamed("CustomButtonView", owner: self, options: nil)

        self.addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        print("buttonAction")
    }
}
