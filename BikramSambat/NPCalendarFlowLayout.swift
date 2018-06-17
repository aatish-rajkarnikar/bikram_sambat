//
//  NPCalendarFlowLayout.swift
//  BikramSambat
//
//  Created by Aatish Rajkarnikar on 11/5/16.
//  Copyright © 2016 iOSHub. All rights reserved.
//

import UIKit

class NPCalendarFlowLayout: UICollectionViewFlowLayout {
    
    override var collectionViewContentSize: CGSize{
        return super.collectionViewContentSize
    }
        
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if let attribute = super.layoutAttributesForItem(at: indexPath){
            if let collectionView = self.collectionView {
                
                let xPageOffset = CGFloat(attribute.indexPath.section) * collectionView.frame.size.width
                let xCellOffset : CGFloat = xPageOffset + (CGFloat(attribute.indexPath.item % 7) * self.itemSize.width)
                let yCellOffset : CGFloat = self.headerReferenceSize.height + (CGFloat(attribute.indexPath.item / 7) * self.itemSize.width)
                attribute.frame = CGRect(x: xCellOffset, y: yCellOffset, width: self.itemSize.width, height: self.itemSize.height)
                return attribute
                
            }
        }
        return nil
    }
}
