//
//  ViewController.swift
//  ToDoList
//
//  Created by Bayard Junior on 25/01/17.
//  Copyright © 2017 Bayard Junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tarefas : [Tarefas] = []
    var rowSelecionada = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        trasTarefas()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        rowSelecionada = indexPath.row
        
        if tarefas[rowSelecionada].importancia {
            cell.textLabel?.text = "❗️\(tarefas[rowSelecionada].nome!)"
        }else{
            cell.textLabel?.text = tarefas[rowSelecionada].nome!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tarefa = tarefas[indexPath.row]
        performSegue(withIdentifier: "telaChecagem", sender: tarefa)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "telaChecagem"{
            let proximaTela = segue.destination as! TarefaCompletaViewController
            proximaTela.tarefa = sender as? Tarefas
            proximaTela.telaAnterior = self
            
        }
        
    }
    
    @IBAction func addTarefa(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "addTarefa", sender: nil)
    }
    
    func trasTarefas(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try tarefas = context.fetch(Tarefas.fetchRequest()) as! [Tarefas]
        }
        catch  {
            print("Erro ao recuperar os dados!")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

