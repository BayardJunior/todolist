//
//  CriaTarefasViewController.swift
//  ToDoList
//
//  Created by Bayard Junior on 31/01/17.
//  Copyright © 2017 Bayard Junior. All rights reserved.
//

import UIKit

class CriaTarefasViewController: UIViewController {

    var telaAnterior = ViewController()
    
    @IBOutlet weak var nomeTarefa: UITextField!
    
    @IBOutlet weak var importancia: UISwitch!
    
    @IBAction func adicionaTarefa(_ sender: Any) {
    
        let tarefa = Tarefas()
        tarefa.nome = nomeTarefa.text!
        tarefa.importancia = importancia.isOn
        
        telaAnterior.tarefas.append(tarefa)//Add no array
    
        telaAnterior.tableView.reloadData()//atualiza as informaçoes da tabela
        
        navigationController!
            .popViewController(animated: true)//tras a tela atualizada
        
    }
    
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
