# configurable variables
PROFILE ?= dbt_adventure_works
TARGET ?= dev
PROJECT_DIR ?= .
LOG_DIR ?= logs
DATABASE ?= AdventureWorksDW2022
SCHEMA ?= dbo
FLUFF_DIALECT ?= tsql
FLUFF_TARGET ?= models/
TIMESTAMP := $(shell date +%Y%m%d_%H%M%S) 
LOG_FILE := $(LOG_DIR)/dbt-$(TARGET)-$(TIMESTAMP).log



# optional selectors
SELECT ?=
EXCLUDE ?= 



# standard settings to run with dbt commands
SETTINGS := --project-dir $(PROJECT_DIR) --profiles-dir $(PROJECT_DIR)/config --profile $(PROFILE) --target $(TARGET) \
            --vars "{'database_name': $(DATABASE), 'schema_name': $(SCHEMA)}" 



# phony targets
.PHONY: temp_test clean compile deps docs run test lint setup build


temp_test: 
	@echo $(LOG_FILE)
	@echo $(TIMESTAMP)


clean:
	@echo "Cleaning dbt artifacts"
	dbt clean 
	@echo "Cleaned dbt artifacts."


compile:
	@echo "Compiling dbt models..."
	dbt compile $(SETTINGS)
	@echo "Compilation complete."


deps:
	@echo "Installing required packages..."
	dbt deps $(SETTINGS)
	@echo "Installation complete."


docs:
	@echo "Preparing docs ..."
	dbt docs generate $(SETTINGS) && dbt docs serve $(SETTINGS)
	@echo "Docs ready."


run:
	@echo "Running dbt models ..."
	dbt run $(SETTINGS) $(if $(SELECT), --select $(SELECT)) \
	                    $(if $(EXCLUDE), --exclude $(EXCLUDE)) \
						| tee -a $(LOG_FILE)
	@echo "Run complete."


test:
	@echo "Running tests..."
	dbt test $(SETTINGS) $(if $(SELECT), --select $(SELECT)) \
	                     $(if $(EXCLUDE), --exclude $(EXCLUDE)) \
						 | tee -a $(LOG_FILE)
	@echo "Tests complete."


help:
	@echo "Available dbt Makefile commands:"
	@echo "  make clean          - Remove dbt artifacts"
	@echo "  make compile        - Compile dbt models"
	@echo "  make deps           - Install dbt dependencies"
	@echo "  make docs           - Generate and serve dbt docs"
	@echo "  make run            - Run dbt models"
	@echo "  make test           - Run dbt tests"
	@echo "  make lint           - Run SQLFluff linter"
	@echo "  make build          - Run dbt build (run + test + docs)"
	@echo "  make kitchen-sink   - Run dbt setup (clean + deps) followed by dbt build (run + test + docs)"
	@echo "  make setup          - Run clean + deps"


lint:
	sqlfluff lint --dialect $(FLUFF_DIALECT) $(FLUFF_TARGET)

build: run test docs

kitchen-sink: setup build 

setup: clean deps






