uvicorn test_app.main:app --reloard--port=80

git checkout main
git add *
git commit -m 'deploiement on cloudron'
git push
