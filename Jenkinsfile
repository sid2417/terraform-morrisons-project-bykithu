pipeline {
    agent {
        label 'AGENT-1'
    }
    // parameters {
        
    //     choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
    // }

    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    stages {
        stage('Init') {
            steps {
                sh 'echo Hi, this is todays init, from AGENT-1'

               
               
                                                
            }
        }
        stage('Plan') {
            steps {
                sh 'echo Hi, this is todays plan, from AGENT-1'
                
            }
        }
        stage('Apply') {
            steps {
                sh 'echo Hi, this is todays apply, from AGENT-1'
            }
        }
        
    }

    post { 
        always { 
            echo 'This message will always say Hello again!'
        }
        aborted { 
            echo 'The stage is aborted'
        }
        failure { 
            echo 'The stage is failure'
        }
        success { 
            echo 'The stage is success'
        }
    }
}