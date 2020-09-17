//
//  MovieDetailViewController.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 15/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

protocol MovieDetailDelegate {
    func didLoadedMainMovieInfo()
    func didLoadedSimilarMovies()
}

import UIKit

var imageCache = NSCache<NSString, UIImage>()

class MovieDetailViewController: UIViewController, MovieDetailDelegate {
 
    let viewModel: MovieDetailViewModel
    
    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    lazy var detailsTableview: UITableView = {
        return UITableView()
    }()
    
    lazy var footerView: UIView = {
        return UIView()
    }()
    
    init(viewModel: MovieDetailViewModel = MovieDetailViewModel(delegate: nil)) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCodeSetup()
        configTableView()
        configViewModel()
        //configFooterView()
    }
    
    private func configTableView() {
        detailsTableview.register(SimilarMovieTableViewCell.self, forCellReuseIdentifier: ConstantTableViewIdentifier.kReuseIdentifier)
        detailsTableview.register(HeaderTitleTableViewCell.self, forCellReuseIdentifier: ConstantTableViewIdentifier.kReuseIdentifierHeaderTitle)
        detailsTableview.delegate = self
        detailsTableview.dataSource = self
        detailsTableview.contentInset = UIEdgeInsets(top: ConstantNumber.kCGFloat300, left: ConstantNumber.kCGFloatZero, bottom: ConstantNumber.kCGFloatZero, right: ConstantNumber.kCGFloatZero)
        detailsTableview.isHidden = false
        detailsTableview.contentMode = .scaleToFill
    }
    
    private func configViewModel() {
        viewModel.delegate = self
        viewModel.getMainMovie()
    }
    
    private func configFooterView() {
        let footer = ButtonsView()
        footer.setup()
        detailsTableview.tableFooterView = footer
    }
    
    @objc func likeButton() {
        
    }
    
    func didLoadedMainMovieInfo() {
        guard let path = viewModel.mainMovie?.imagePath else { return }
        imageView.loadImage("\(ConstantURL.kBaseImagePath)\(path)")
    }
    
    func didLoadedSimilarMovies() {
        DispatchQueue.main.async {
            self.detailsTableview.reloadData()
        }
        
    }
}

extension MovieDetailViewController: ViewCodePrococol {
    func viewCodeHierarchySetup() {
        
        view.addSubview(detailsTableview)
    }
    
    func viewCodeConstraintSetup() {
        
        imageView.frame = CGRect(x: ConstantNumber.kCGFloatZero, y: ConstantNumber.kCGFloatZero, width: UIScreen.main.bounds.size.width, height: ConstantNumber.kCGFloat300)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        detailsTableview.fillSuperview()
    }
    
    func viewCodeAdditionalSetup() {
        view.backgroundColor = .black
        detailsTableview.backgroundColor = .black
    }
    
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.similarMovies?.titles.count ?? ConstantNumber.kInteger1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == ConstantNumber.kIntegerZero {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstantTableViewIdentifier.kReuseIdentifierHeaderTitle, for: indexPath) as? HeaderTitleTableViewCell else { return UITableViewCell() }
            cell.setup(movieData: viewModel.mainMovie)
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ConstantTableViewIdentifier.kReuseIdentifier, for: indexPath) as? SimilarMovieTableViewCell else { return UITableViewCell() }
            cell.setup(currentSimilar: viewModel.similarMovies?.titles[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = ConstantNumber.kCGFloat300 - (scrollView.contentOffset.y + ConstantNumber.kCGFloat300)
       let height = min(max(y, ConstantNumber.kCGFloatZero), ConstantNumber.kCGFloat700)
       imageView.frame = CGRect(x: ConstantNumber.kCGFloatZero, y: ConstantNumber.kCGFloatZero, width: UIScreen.main.bounds.size.width, height: height)
    }
}
