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

                sh"""
                ls -ltr
                cd 1-vpc
                ls -lrt
                terraform init

                """                                                
            }
        }
        stage('Validate') {
            steps {
                sh 'echo Hi, this is todays validate, from AGENT-1'
                sh"""
                cd 1-vpc
                terraform validate
                """
                
            }
        }
        stage('Plan') {
            {
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'KITHU', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }
            steps {
                sh 'echo Hi, this is todays plan, from AGENT-1'
                sh"""
                cd 1-vpc
                terraform plan
                """
                
            }
        }
        // stage('Apply') {
        //     steps {
        //         sh 'echo Hi, this is todays apply, from AGENT-1'
        //         sh"""
        //         cd 1-vpc
        //         terraform apply -auto-approve 
        //         """
        //     }
        // }
        // stage('Destroy') {
        //     steps {
        //         sh 'echo Hi, this is todays destroy, from AGENT-1'
        //         sh"""
        //         cd 1-vpc
        //         terraform destroy -auto-approve 
        //         """
        //     }
        // }

    
        
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