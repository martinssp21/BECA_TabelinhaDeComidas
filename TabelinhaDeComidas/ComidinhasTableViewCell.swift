//
//  ComidinhasTableViewCell.swift
//  TabelinhaDeComidas
//
//  Created by Rodrigo Martins on 02/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class ComidinhasTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewComida: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelCalorias: UILabel!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var labelResturante: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textViewDescricao.isSelectable = false
        textViewDescricao.isEditable = false
        textViewDescricao.scrollRangeToVisible(NSMakeRange(0, 0))
    }

}
