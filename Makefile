manual:
	@echo "You can find the shortcut in the make file. 😎"

build:
	docker-compose build

commit: flake8 isort test

# Create new app
# Ex. make createapp name=NEW_APP
createapp:
	docker-compose run --rm app sh -c "python manage.py startapp $(name)"

createsuperuser:
	docker-compose run --rm app sh -c "python manage.py createsuperuser"

down:
	docker-compose down

# Master datas dump
# Ex. make dump app=APP model=MODEL
dump:
	docker-compose run --rm app sh -c "mkdir $(app)/fixtures || true"
	docker-compose run --rm app sh -c "python manage.py dumpdata $(app).$(model) --format json --indent 4 > $(app)/fixtures/initial_data.json"

flake8:
	docker-compose run --rm app sh -c "flake8"

initdata:
	docker-compose run --rm app sh -c "python manage.py loaddata initial_data"

migrate:
	docker-compose run --rm app sh -c "python manage.py migrate"

migrations: 
	docker-compose run --rm app sh -c "python manage.py makemigrations"

run:
	docker-compose up

shell:
	docker-compose run --rm app sh -c "python manage.py shell"

isort:
	docker-compose run --rm app sh -c "isort . --skip migrations --profile django"

test:
	docker-compose run --rm app sh -c "pytest"
