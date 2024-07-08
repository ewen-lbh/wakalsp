# WakaLSP 

This is a (arguably hacky) way to create [Wakatime Editor Plugins](https://wakatime.com/help/creating-plugin) through an LSP server.

The basic idea is this:

```mermaid
flowchart LR
    subgraph Editor
        A[Editor] -- new file open --> B[Language Server]
    end
    B -- textDocument/didOpen --> C[this monstrosity]
    C --> D[Wakatime CLI]
```

## Status

Right now it's just an idea. I might start a PoC by the end of the week.

## How it works

The LSP server receives events and calls the Wakatime CLI

| LSP event | Wakatime docs section |
| --------- | --------------------- |
| [`initialized`](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#initialized) | [Plugin Initialization](https://wakatime.com/help/creating-plugin#plugin-init) |
| [`textDocument/didOpen`](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_didOpen) | [File Changed](https://wakatime.com/help/creating-plugin#handling-editor-events:file-changed) |
| [`textDocument/didChange`](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_didChange) | [File Modified](https://wakatime.com/help/creating-plugin#handling-editor-events:file-modified) |
| [`textDocument/didSave`](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_didSave) | [File Saved](https://wakatime.com/help/creating-plugin#handling-editor-events:file-saved) |
