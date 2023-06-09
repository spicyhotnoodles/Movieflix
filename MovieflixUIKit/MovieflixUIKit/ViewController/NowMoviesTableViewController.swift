//
//  NowMoviesTableViewController.swift
//  MovieflixUIKit
//
//  Created by Pietro Ciuci on 30/03/23.
//

import UIKit

class NowMoviesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) async -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let data = await APIData()
        let movie = data.nowPlayingMovies?.results?[indexPath.row] ?? Movie(adult: false, backdropPath: "", genreIDS: [], id: 99, originalLanguage: OriginalLanguage.en, originalTitle: "", overview: "", popularity: 99.9, posterPath: "", releaseDate: "", title: "", video: false, voteAverage: 99.9, voteCount: 9999)
        // Configure the cell...
        cell.update(with: movie)
//        cell.titleLabel.text = "Movie Title"
//        cell.posterImageView.layer.cornerRadius = 14
//        cell.posterImageView.image = UIImage(named: "1")!
//        cell.overviewLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis interdum lorem vel ex dictum, at congue magna ornare. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent dui nulla, dictum vel elementum id, mattis porta arcu. Donec lacinia ut quam et convallis. In laoreet vulputate est, in blandit nibh egestas sed. Vestibulum vitae posuere tortor."
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView {
    
    func makeRounded() {
        
//        layer.borderWidth = 1
//        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
