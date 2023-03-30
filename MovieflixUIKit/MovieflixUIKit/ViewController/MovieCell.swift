//
//  MovieTableViewCellController.swift
//  MovieflixUIKit
//
//  Created by Pietro Ciuci on 30/03/23.
//

import UIKit

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with movie: Movie) {
        titleLabel.text = movie.title
//        if let path = movie.posterPath {
//            posterImageView = posterImageView.imageFromServerURL(movie.posterPath ?? "", placeHolder: UIImage(named: "poster-placerholder"))
//        }
        overviewLabel.text = movie.overview
    }
    
}

extension UIImageView {

        func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {

        self.image = nil
        //If imageurl's imagename has space then this line going to work for this
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        

        if let url = URL(string: imageServerUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(String(describing: error))")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                       
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
