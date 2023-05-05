//
//  MovieModel.swift
//  APi prcatice
//
//  Created by Vivek Patel on 26/04/23.
//

import UIKit

class MovieModel: Decodable {	
    
   
    var artistName: String?
    var trackName: String?
    
    init(artistName: String? = nil, trackName: String? = nil) {
        self.artistName = artistName
        self.trackName = trackName
    }

}
  
class ResultsModel : Decodable {
    var results = [MovieModel]()
    
    init(results: [MovieModel]){
        self.results = results
    }
}

 //let "https://itunes.apple.com/search?media=music&term=bollywood"


