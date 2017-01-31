//
//  TarefaCompletaViewController.swift
//  ToDoList
//
//  Created by Bayard Junior on 31/01/17.
//  Copyright © 2017 Bayard Junior. All rights reserved.
//

import UIKit

class TarefaCompletaViewController: UIViewController {

    @IBOutlet weak var labelTarefa: UILabel!
    
    var telaAnterior = ViewController()
    
    var tarefa = Tarefas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTarefa.text = tarefa.nome
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tarefaConcluida(_ sender: Any) {
        
        telaAnterior.tarefas.remove(at: telaAnterior.rowSelecionada)
        telaAnterior.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
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
