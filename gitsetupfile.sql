
create database GH_ACTION;

create or replace secret git_secret
TYPE = password
USERNAME = 'shaina'
PASSWORD = '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';


CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/')
  ALLOWED_AUTHENTICATION_SECRETS = (git_secret)
  ENABLED = TRUE;


CREATE OR REPLACE GIT REPOSITORY notebook_git_repo
  API_INTEGRATION = git_api_integration
 GIT_CREDENTIALS = git_secret
  ORIGIN = 'https://github.com/shainakipi/snowflake_test_candex';
