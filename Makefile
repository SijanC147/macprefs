clean:
	find . -name '*.pyc' -delete
	rm -rf '__pycache__'
	rm -rf .cache
	rm -rf .tmontmp
	rm -rf .coverage
	rm -rf .testmondata
	rm -rf cov.xml
	rm -rf dist
	rm -rf build
	rm -rf .pytest_cache
	rm -rf .pdm-build
	rm -rf macprefs.egg-info

setup:
	pdm install

test:
	pytest --cov=. --cov-report xml:cov.xml  --cov-report term-missing

lint:
	pylint *.py

release:
	VERSION=$$(./bump.sh $(TYPE)) && \
	gh release create v$$VERSION --generate-notes

patch:
	$(MAKE) release TYPE=patch

minor:
	$(MAKE) release TYPE=minor

major:
	$(MAKE) release TYPE=major

help:
	@echo "COMMANDS:"
	@echo "  clean          Remove all generated files."
	@echo "  setup          Setup development environment."
	@echo "  test           Run tests."
	@echo "  lint           Run analysis tools."
	@echo "  patch          Publish new patch version release."
	@echo "  minor          Publish new minor version release."
	@echo "  major          Publish new major version release."
