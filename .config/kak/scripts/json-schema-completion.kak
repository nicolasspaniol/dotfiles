# Schema-aware completion and validation for JSON and JSONC via kak-lsp.
# vscode-json-language-server reads a document's "$schema" property and
# resolves the referenced schema for completions and diagnostics.
# Requires vscode-json-language-server on PATH (npm package:
# vscode-langservers-extracted).

hook -group json-schema-completion global BufSetOption filetype=json %{
    set-option buffer lsp_servers %{
        [vscode-json-language-server]
        root_globs = ["package.json", ".git", ".hg"]
        args = ["--stdio"]
        settings_section = "_"
        [vscode-json-language-server.settings._]
        provideFormatter = true
        json.format.enable = true
        json.validate.enable = true
        json.schemaDownload.enable = true
        [[vscode-json-language-server.settings._.json.schemas]]
        fileMatch = ["/package.json"]
        url = "https://json.schemastore.org/package.json"
        [[vscode-json-language-server.settings._.json.schemas]]
        fileMatch = ["/.markdownlintrc", "/.markdownlint.json", "/.markdownlint.jsonc"]
        url = "https://raw.githubusercontent.com/DavidAnson/markdownlint/main/schema/markdownlint-config-schema.json"
        [[vscode-json-language-server.settings._.json.schemas]]
        fileMatch = ["/.prettierrc", "/.prettierrc.json"]
        url = "https://json.schemastore.org/prettierrc.json"
        [[vscode-json-language-server.settings._.json.schemas]]
        fileMatch = ["/compile_commands.json"]
        url = "https://json.schemastore.org/compile-commands.json"
        [[vscode-json-language-server.settings._.json.schemas]]
        fileMatch = ["/tsconfig*.json"]
        url = "https://json.schemastore.org/tsconfig.json"
    }
}

# Use the JSON language server for JSONC as well.
hook -group json-schema-completion global BufCreate .*\.jsonc$ %{
    set-option buffer filetype json
}
