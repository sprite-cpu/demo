pipeline {
    agent any  // 어느 에이전트에서든 실행 가능

    stages {
        stage('Build') {
            steps {
                // Windows 환경에서는 `bat` 명령어를 사용
                bat 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                // 테스트 실행
                bat 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                // 배포 명령어 실행
                bat 'mvn deploy'
            }
        }
    }

    post {
        always {
            echo '빌드 후 작업이 완료되었습니다.'
        }
    }
}