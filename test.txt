pipeline {
    agent any
    stages {

      stage('Lint HTML') {
        steps {
          sh 'tidy -q -e templates/*.html'
        }
       }

       stage('Run docker') {
            steps {
                sh './run_docker.sh'
            }
        }


        stage('Upload docker') {
            steps {
                sh './upload_docker.sh'
            }
        }

        stage('Apply Kubernetes deployment file') {
            steps {
              withKubeConfig([credentialsId: 'jenkins-deployer-credentials', serverUrl: 'https://A29B762498A21F68BAACAD1FA6B186A5.sk1.us-east-1.eks.amazonaws.com']) {
              sh 'kubectl apply -f project5-deployment.yaml'
              }
            }
          }

        stage('Apply Kubernetes service file') {
            steps {
              withKubeConfig([credentialsId: 'jenkins-deployer-credentials', serverUrl: 'https://A29B762498A21F68BAACAD1FA6B186A5.sk1.us-east-1.eks.amazonaws.com']) {
              sh 'kubectl apply -f project5-service.yaml'
              }
            }
          }

       stage ("wait for 10 seconds") {
            steps {
                sleep(time:10,unit:"SECONDS")
            }
        }

        stage('Results') {
            steps {
                withKubeConfig([credentialsId: 'jenkins-deployer-credentials',
                                serverUrl: 'https://A29B762498A21F68BAACAD1FA6B186A5.sk1.us-east-1.eks.amazonaws.com',
                                contextName: 'project5@prod.us-east-1.eksctl.io',
                                clusterName: 'prod.us-east-1.eksctl.io'
                                ]) {
                  sh 'kubectl get deployments'
                  sh 'kubectl get replicasets'
                  sh 'kubectl describe replicasets'
                  sh 'kubectl get services my-service'
                  sh 'kubectl describe services my-service'
                  sh 'kubectl get pods --output=wide'
                }
            }
          }


    }
}


