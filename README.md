# keboola-as-code-templates
Templates repository for [Keboola as Code CLI client](https://github.com/keboola/keboola-as-code/)

## License

MIT licensed, see [LICENSE](./LICENSE) file.

## Adding a Template

When you add a template it should have at least one test. 
See [https://developers.keboola.com/cli/templates/tests/](https://developers.keboola.com/cli/templates/tests/) for more details.

If you need to use sensitive information for template inputs (like passwords and API tokens), store them 
in [Actions secrets](https://github.com/keboola/keboola-as-code-templates/settings/secrets/actions). Each secret needs 
to start with `KBC_SECRET_` prefix. See [inputs.json documentation](https://developers.keboola.com/cli/templates/tests/#inputsjson)
for more details.
