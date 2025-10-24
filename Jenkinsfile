pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/HSNMZHR734/jenkinssimpleproject.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh '''
                ansible-playbook -i /home/ubuntu/jenkins/host.ini /home/ubuntu/jenkins/playbook.yml
                '''
            }
        }
    }
}
