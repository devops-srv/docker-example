pipeline {
    agent any
    stages{
        stage('scm checkout'){
            steps{
                git url: 'https://github.com/devops-srv/pipelineB29_project.git'
            }
        }
        stage('Artifacts'){
            steps{
                archiveArtifacts '**/*.html'
            }
        }
        stage('Deployment'){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'webserver', transfers: [sshTransfers(excludes: '', execCommand: '', execTimeout: 120000, flatten: true, makeEmptyDir: false, noDefaultExcludes: false, patternSeparator: '[,]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix:'',sourceFiles: '**/*.html')] usePromotionTimestamp: false, useworkspaceInpromotion: false, verbose: true)])
            }
        }
    }
