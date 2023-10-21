//
//  ViewController.swift
//  TableViewProgrammaticly
//
//  Created by ahmetburakozturk on 15.10.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables
    private let imageList: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
        UIImage(named: "7")!,
        UIImage(named: "8")!,
        UIImage(named: "9")!,
        UIImage(named: "10")!
    ]
    
    var vh = Double()
    var vw = Double()
    

    
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.rowHeight = 96
        return tableView
    }()
    
    
    private let headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 36/255, green: 102/255, blue: 152/255, alpha: 1)
        return view
    }()
    
    private let headerTitle : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "Arama Sonucu"
        return label
    }()
    
    private let headerSubtitle : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.text = "10 ilan"
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: UIControl.State.normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.backward"), for: UIControl.State.normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vh = view.frame.size.height
        vw = view.frame.size.width
        
        self.setupUI()

        self.tableView.delegate = self
        self.tableView.dataSource = self

    }


    
    // MARK: - Setup UI
    private func setupUI(){
        //self.view.backgroundColor = UIColor(red: 36/255, green: 102/255, blue: 152/255, alpha: 1)
        self.view.backgroundColor = .systemYellow

        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerSubtitle.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        headerView.frame = CGRect(x: 0, y: 0, width: vw, height: vh * 0.1)
        let headerViewVH = headerView.frame.size.height
        tableView.frame = CGRect(x: 0, y: headerView.frame.height, width: vw, height: vh * 0.9)
        headerTitle.frame = CGRect(x: vw - (vw * 0.65), y: headerViewVH - headerViewVH * 0.5, width: vw * 0.30, height: headerViewVH * 0.2)
        headerSubtitle.frame = CGRect(x: vw - (vw * 0.65), y: headerViewVH - headerViewVH * 0.25, width: vw * 0.30, height: headerViewVH * 0.2)
        favoriteButton.frame = CGRect(x: vw - (vw * 0.11), y: headerViewVH - (headerViewVH * 0.5), width: vw * 0.1, height: headerViewVH * 0.4)
        backButton.frame = CGRect(x: vw - (vw * 0.99), y: headerViewVH - (headerViewVH * 0.5), width: vw * 0.1, height: headerViewVH * 0.4)
        
        
        self.view.addSubview(tableView)
        self.view.addSubview(headerView)
        self.headerView.addSubview(headerTitle)
        self.headerView.addSubview(headerSubtitle)
        self.headerView.addSubview(favoriteButton)
        self.headerView.addSubview(backButton)
        

        
        
        
        
        
        
        
    }
}


// MARK: - Extensions

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewController!")
        }
        
        cell.configure(with: self.imageList[indexPath.row], and: "Test amaçlı eklenmiş bir başlıktır. Lütfen dikkate almayınız", locationString: "Konya, Selçuklu", price: "30.000 TL")
        
        return cell
    }
    
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      //  return 96
    //}
    
    
}
