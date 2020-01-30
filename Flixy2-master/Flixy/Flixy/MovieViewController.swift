//
//  Movie MovieViewController.swift
//  Flixy
//
//  Created by Alexis Chen on 1/29/20.
//  Copyright © 2020 Alexis Chen. All rights reserved.
//

import UIKit

class Movie_MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //step one
    @IBOutlet weak var tableV: UITableView! //stand for table view
    
    var movies = [[String:Any]]() //array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()//run the first time the screen comes out

        //step three
        tableV.dataSource = self
        tableV.delegate = self
        
        
        //fetch data
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies = dataDictionary["results"] as! [[String:Any]] //cast as array dictionary
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //asking the number of row
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //give me the cell
        let cell = UITableViewCell()
            
        cell.textLabel!.text = "row: \(indexPath.row)"  //? mean swift optional
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
