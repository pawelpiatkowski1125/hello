#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

params.who = "World"

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo $x, ${params.who}!
    echo \$MYENV
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHello | view
}
