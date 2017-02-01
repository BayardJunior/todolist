//
//  CriaTarefasViewController.swift
//  ToDoList
//
//  Created by Bayard Junior on 31/01/17.
//  Copyright © 2017 Bayard Junior. All rights reserved.
//

import UIKit

class CriaTarefasViewController: UIViewController {
    
    @IBOutlet weak var nomeTarefa: UITextField!
    
    @IBOutlet weak var importancia: UISwitch!
    
    @IBAction func adicionaTarefa(_ sender: Any) {
    
        //pega o contexto
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //criaçao de uma entidade
        let tarefa = Tarefas(context: context)
        
        tarefa.nome = nomeTarefa.text!
        tarefa.importancia = importancia.isOn
        
        //salva
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
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
