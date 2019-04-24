//
//  ViewController.swift
//  TabelinhaDeComidas
//
//  Created by Rodrigo Martins on 02/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewComidinhas: UITableView!
    
    var arrayDeComidas = [AtributosDeComidas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewComidinhas.delegate = self
        tableViewComidinhas.dataSource = self
        
        let nibDaCelula = UINib(nibName: "ComidinhasTableViewCell", bundle: nil)
        tableViewComidinhas.register(nibDaCelula, forCellReuseIdentifier: "comidinhasCell")
        arrayDeComidas = retornaArrayDecomidas()
    }

    func retornaArrayDecomidas() -> [AtributosDeComidas]{
        let arquivoJSON = Bundle.main.url(forResource: "Comidas", withExtension: "json")!
        
        let dadosDoJSON: Data = try! Data(contentsOf: arquivoJSON)
        
        let comidas = ComidasDoMundo.parse(dadosDoJSON)
        
        return comidas.comidasDoMundo
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDeComidas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comidinhasCell") as! ComidinhasTableViewCell
        
        cell.labelTitulo.text = arrayDeComidas[indexPath.row].nomeDaComida
        cell.labelCalorias.text = "Calorias: \(arrayDeComidas[indexPath.row].calorias ?? 0)"
        cell.textViewDescricao.text = arrayDeComidas[indexPath.row].descricaoDaComida
        cell.imageViewComida.image = UIImage(named: arrayDeComidas[indexPath.row].imagem!)
        cell.labelResturante.text = "Restaurante: \(arrayDeComidas[indexPath.row].restaurante!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
}
