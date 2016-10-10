//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
   
    var fibonacciArray:[Int] = []

    func generateFibonacciArray(indexNum:Int)->[Int]{
        
        var sequence = [0,1]
        if indexNum <= 1 {
            return sequence
        }
        
        for _ in 0...indexNum-2 {
        let first = sequence[sequence.count - 2]
        let second = sequence.last!
        sequence.append(first+second)
    }
        return sequence
    }
    
    
    override func viewDidLoad() {
        fibonacciArray = generateFibonacciArray(indexNum: 16)
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) 
        
        if fibonacciArray.contains(indexPath.item){
            cell.backgroundColor = UIColor.purple
           
            
        } else {
            cell.backgroundColor = UIColor.yellow
        }
       
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue" {
           if let dest = segue.destination as? HellaDetailViewController,
            let indexPath = collectionView.indexPathsForSelectedItems?.first {
            if fibonacciArray.contains(indexPath.item){
                dest.view.backgroundColor = UIColor.purple
                
            } else {
                dest.view.backgroundColor = UIColor.yellow
            }
            dest.numberLabel.text = String(indexPath.item)
            }
            
        }
        
    }
    

}
