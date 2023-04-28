//
//  MovieViewModel.swift
//  APi prcatice
//
//  Created by Vivek Patel on 27/04/23.
//

import UIKit

class MovieViewModel: NSObject {

    var artistName: String?
    var trackName: String?
    
    init(movie: MovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
