node ('docker_node') {

    stage ('Git Repository') {
        git 'https://github.com/venkychowdary/spring-petclinic.git'
    }

    stage ('Building Package') {
        sh 'mvn package'
    }

    stage ('Publishing Junitresults') {
        junit 'target/surefire-reports/*.xml'
    }

    stage ('Archiving Artifacts') {
        archiveArtifacts 'target/*.jar'
    }

    stage ('Build Sucess') {
        echo 'Venky One More Success in your project'
    }

    stage ('Deploying app in Container') {
        sh 'docker image build -t spc:1.0.0 .'
        sh 'docker container run -p 8090:8080 spc:1.0.0'
    }
    
}
