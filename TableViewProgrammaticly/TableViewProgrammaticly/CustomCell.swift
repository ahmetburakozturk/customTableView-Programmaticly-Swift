//
//  CustomCell.swift
//  TableViewProgrammaticly
//
//  Created by ahmetburakozturk on 15.10.2023.
//

import UIKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        return iv
    }()
    
    private let myLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Error"
        label.numberOfLines = 2
        return label
    }()
    
    private let locationLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 8, weight: .light)
        label.text = "Error"
        label.numberOfLines = 1
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Error"
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, and label: String, locationString: String, price: String){
        self.myImageView.image = image
        self.myLabel.text = label
        self.locationLabel.text = locationString
        self.priceLabel.text = price
    }
    
    private func setupUI(){
        
        //let vw = self.contentView.frame.size.width
        //let vh = 96.0
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        myImageView.frame = CGRect(x: (96 - 90) / 2, y: (96 - 90) / 2, width: 90 , height: 90 )
        myLabel.frame = CGRect(x: 101, y: (96 / 10), width: 250, height: 40)
        locationLabel.frame = CGRect(x: 101, y: 77, width: 150, height: 15)
        priceLabel.frame = CGRect(x: 300, y: 77, width: 100, height: 15)
        
        
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myLabel)
        self.contentView.addSubview(locationLabel)
        self.contentView.addSubview(priceLabel)
        
    }
    

}
