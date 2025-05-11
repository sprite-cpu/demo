pipeline {
    agent any  // 어느 에이전트에서든 실행 가능
    tools {
        maven 'Maven 3.9.9'   // 위에서 지정한 이름
      }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/sprite-cpu/demo.git'
            }
        }
        stage('Build') {
            when {
                // 푸시된 변경 사항 중에 pom.xml 파일이 있으면 true
                changeset pattern: '**/pom.xml', comparator: 'REGEXP'
                 }
              steps {
                bat 'mvn clean install'
              }
        }
        stage('Extract Version') {
            when {
                    changeset pattern: '**/pom.xml', comparator: 'REGEXP'
                  }
              steps {
                bat 'mvn test'
              }
        }
 /*        stage('Deploy') {
            steps {
                // 배포 명령어 실행
                bat 'mvn deploy'
            }
        } */
    }

    post {
        always {
            echo '빌드 후 작업이 완료되었습니다.'
        }
    }
}