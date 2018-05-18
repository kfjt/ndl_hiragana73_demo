pushd %~dp0
docker-compose up -d --build
popd
timeout 1
start http://localhost:8888/
