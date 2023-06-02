def call(){
    echo "Build stage"
    sh 'mvn -B -DskipTests clean package'
}
