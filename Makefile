# Create new app
# Ex. make app name=NEW_APP
app:
	docker-compose exec app sh -c "python manage.py startapp $(name)"

build:
	docker-compose build

commit: flake8 isort test

createsuperuser:
	docker-compose exec app sh -c "python manage.py createsuperuser"

# Master datas dump
# Ex. make dump app=APP model=MODEL
dump:
	docker-compose exec app sh -c "mkdir $(app)/fixtures || true"
	docker-compose exec app sh -c "python manage.py dumpdata $(app).$(model) --format json --indent 4 > $(app)/fixtures/initial_data.json"

flake8:
	docker-compose exec app sh -c "flake8 --max-line-length=119 --exclude=migrations"

init-data:
	docker-compose exec app sh -c "python manage.py loaddata initial_data"

migrate:
	docker-compose exec app sh -c "python manage.py migrate"

migrations: 
	docker-compose exec app sh -c "python manage.py makemigrations"

run:
	docker-compose up

shell:
	docker-compose exec app sh -c "python manage.py shell"

isort:
	docker-compose exec app sh -c "isort . --skip migrations"

test:
	docker-compose exec app sh -c "pytest"