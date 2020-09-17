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

private let reuseIdentifier = "SimilarMovieCollectionReusableView"
private let reuseIdentifierHeaderTitle = "HeaderTitleTableViewCell"
private let baseImagePath = "https://image.tmdb.org/t/p/w500"
private let padding: CGFloat = 16

var imageCache = NSCache<NSString, UIImage>()

class MovieDetailViewController: UIViewController, MovieDetailDelegate {
 
    let viewModel: MovieDetailViewModel
    
    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    lazy var detailsTableview: UITableView = {
        return UITableView()
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
        
    }
    
    private func configTableView() {
        detailsTableview.register(SimilarMovieTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        detailsTableview.register(HeaderTitleTableViewCell.self, forCellReuseIdentifier: reuseIdentifierHeaderTitle)
        detailsTableview.delegate = self
        detailsTableview.dataSource = self
        detailsTableview.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        detailsTableview.isHidden = false
        detailsTableview.contentMode = .scaleToFill
    }
    
    private func configViewModel() {
        viewModel.delegate = self
        viewModel.getMainMovie()
    }
    
    func didLoadedMainMovieInfo() {
        guard let path = viewModel.mainMovie?.imagePath else { return }
        imageView.loadImage("\(baseImagePath)\(path)")
    }
    
    func didLoadedSimilarMovies() {
        detailsTableview.reloadData()
    }
}

extension MovieDetailViewController: ViewCodePrococol {
    func viewCodeHierarchySetup() {
        
        view.addSubview(detailsTableview)
    }
    
    func viewCodeConstraintSetup() {
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "sampleImage")
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
        return (viewModel.similarMovies?.titles.count ?? 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierHeaderTitle, for: indexPath) as? HeaderTitleTableViewCell else { return UITableViewCell() }
            cell.setup(movieData: viewModel.mainMovie)
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SimilarMovieTableViewCell else { return UITableViewCell() }
            cell.setup(currentSimilar: viewModel.similarMovies?.titles[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = 300 - (scrollView.contentOffset.y + 300)
       let height = min(max(y, 0), 700)
       imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}
