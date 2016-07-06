//
//  AdicionarPessoaContainerControllerViewController.swift
//  Alziegit
//
//  Created by Edson  Jr on 06/07/16.
//  Copyright © 2016 Edson  Jr. All rights reserved.
//

import UIKit

class AdicionarPessoaContainerControllerViewController: UIViewController {

    
    
    //Elementos Visuais do Container de Adicionar Pessoas
    
    @IBOutlet weak var imagemPessoaAdicionarImageView: UIImageView!
    @IBOutlet weak var nomePessoaAdicionarTextEdit: UITextField!
    @IBOutlet weak var notasPessoaAdicionarTextArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
